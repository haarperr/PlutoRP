local repayTime = 168 * 60
local timer = ((60 *1000) * 10 )

local carTable = {
	[1] = { ["model"] = "entity2", ["baseprice"] = 255000, ["commission"] = 15 }, 
	[2] = { ["model"] = "italigto", ["baseprice"] = 175000, ["commission"] = 15 },
	[3] = { ["model"] = "italigtb2", ["baseprice"] = 190000, ["commission"] = 15 },
	[4] = { ["model"] = "seven70", ["baseprice"] = 160000, ["commission"] = 15 },
	[5] = { ["model"] = "furia", ["baseprice"] = 215000, ["commission"] = 15 },
	[6] = { ["model"] = "xa21", ["baseprice"] = 200000, ["commission"] = 15 },
	[7] = { ["model"] = "reaper", ["baseprice"] = 170000, ["commission"] = 15 },
	[8] = { ["model"] = "t20", ["baseprice"] = 220000, ["commission"] = 15 },
}


-- Updates CatTable to server
RegisterServerEvent("sunrise:carshop:table")
AddEventHandler("sunrise:carshop:table", function(table)
    if table ~= nil then 
        carTable = table
        TriggerClientEvent("plutorp-sunriseshop:returnTable", -1, carTable)
        updateDisplayVehicles()
    end 
end)

--Enables Finance for 60 seconds 
RegisterServerEvent("sunrise:finance:enable")
AddEventHandler("sunrise:finance:enable", function(plate)
    if plate ~= nil then
        TriggerClientEvent("sunrise:finance:enableOnClient", -1, plate)
    end
end)

RegisterServerEvent("sunrise:buy:enable")
AddEventHandler("sunrise:buy:enable", function(plate)
    if plate ~= nil then
        TriggerClientEvent("sunrise:buy:enableOnClient", -1, plate)
    end
end)

RegisterServerEvent("sunrise:CheckMoneyForVeh")
AddEventHandler("sunrise:CheckMoneyForVeh", function(name, model, price, financed)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local money = tonumber(user:getCash())
    if fananced then
        local financedPrice =  math.ceil(price / 4)
        if money >= financedPrice then
            user:removeMoney(financedPrice)
            TriggerClientEvent("sunrise:FinishMoneyCheckForVeh", user.source, name, model, price, financed)
            TriggerClientEvent("menu:veh:purchase", user.source)
            exports["plutorp-banking"]:UpdateSociety(financedPrice, "sunrise_shop", "add")
        else
            TriggerClientEvent('DoLongHudText', user.source, 'You dont have enough money on you!', 2)
            TriggerClientEvent("sunrise:carshop:failedpurchase", user.source)
        end
    else
        if money >= price then
            user:removeMoney(price)
            TriggerClientEvent('sunrise:FinishMoneyCheckForVeh', user.source, name, model, price, financed)
            TriggerClientEvent('menu:veh:purchase', user.source)
            exports["plutorp-banking"]:UpdateSociety(price, "sunrise_shop", "add")
        else
            TriggerClientEvent('DoLongHudText', user.source, 'You dont have enough money on you!', 2)
            TriggerClientEvent('sunrise:carshop:failedpurchase', user.source)
        end
    end
end)

RegisterServerEvent('sunrise:BuyForVeh')
AddEventHandler('sunrise:BuyForVeh', function(platew, name, vehicle, price, financed)
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local char = user:getVar("character")
    local player = user:getVar("hexid")
    exports.ghmattimysql:execute("SELECT * FROM `characters_cars` WHERE license_plate = @license_plate", {['license_plate'] = platew}, function(result)
        if result[1] then
            dbplate = math.random(10000000,99999999)
            TriggerClientEvent("plutorp-sunriseshop:update:plate", src, dbplate)
        else
            dbplate = platew
        end
        
        if financed then
            local cols = 'owner, cid, license_plate, name, purchase_price, financed, model, vehicle_state, payments_left'
            local val = '@owner, @cid, @license_plate, @name, @buy_price, @financed, @model, @vehicle_state, @payments_left'
            local downPay = math.ceil(price / 4)
            exports.ghmattimysql:execute('INSERT INTO characters_cars ( '..cols..' ) VALUES ( '..val..' )',{
                ['@owner'] = player,
                ['@cid'] = char.id,
                ['@license_plate'] = dbplate,
                ['@model'] = vehicle,
                ['@name'] = name,
                ['@buy_price'] = price,
                ['@financed'] = price - downPay,
                ['@payments_left'] = 12,
                ['@vehicle_state'] = "Out",
            })

            Citizen.Wait(2500)
            TriggerClientEvent("garges:update:phone")
        else
            exports.ghmattimysql:execute('INSERT INTO characters_cars (owner, cid, license_plate, name, model, purchase_price, vehicle_state) VALUES (@owner, @cid, @license_plate, @name, @model, @buy_price, @vehicle_state)',{
                ['@owner'] = player,
                ['@cid'] = char.id,
                ['@license_plate'] = dbplate,
                ['@name'] = name,
                ['@model'] = vehicle,
                ['@buy_price'] = price,
                ['@vehicle_state'] = "Out"
            })

            Citizen.Wait(2500)
            TriggerClientEvent("garges:update:phone")
        end
    end)
end)

function updateDisplayVehicles()
    for i=1, #carTable do
        exports.ghmattimysql:execute("UPDATE vehicle_display SET model=@model, commission=@commission, baseprice=@baseprice WHERE ID=@ID",{
            ['@ID'] = i,
            ['@model'] = carTable[i]["model"],
            ['@commission'] = carTable[i]["commission"],
            ['@baseprice'] = carTable[i]["baseprice"]
        })
    end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        updateDisplayVehicles()
    end
end)

function updateFinance()
    exports.ghmattimysql:execute("SELECT * FROM `characters_cars` WHERE finance_time > 0 AND payments_left >= 1", {}, function(result)
        for i=1, #result do
            local financeTimer = result[i].finance_time
            local license_plate = result[i].license_plate
            local newTimer = financeTimer - 10
            if financeTimer ~= nil then
                MySQL.Sync.execute('UPDATE characters_cars SET finance_time = @timer WHERE license_plate = @license_plate', {
                    ['@license_plate'] = license_plate,
                    ['@timer'] = newTimer
                })
            end
        end
    end)
    SetTimeout(timer, updateFinance)
end
SetTimeout(timer, updateFinance)