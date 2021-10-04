local houses = {}

RegisterServerEvent('character:loadspawns')
AddEventHandler('character:loadspawns', function(cid)
    houses = {}
    local pSrc = source
    local pNum = math.random(1,88)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    local cid = user:getCurrentCharacter().id
    exports.ghmattimysql:execute("SELECT * FROM __motels WHERE cid= ?", {cid}, function(result)
        pData = result
        exports.ghmattimysql:execute("SELECT * FROM __housedata WHERE cid= ?", {cid}, function(data)
            exports.ghmattimysql:execute("SELECT * FROM __housekeys WHERE cid= ?", {cid}, function(data2)
                for k, r in pairs(data) do
                    if r ~= nil then
                        if r.housename ~= nil then
                            local random = math.random(1111,9999)
                            houses[random] = {}
                            table.insert(houses[random], {["house_name"] = r.housename, ["house_model"] = r.house_model, ["house_id"] = r.house_id})
                
                        end
                    end
                end
    
                for k, j in pairs(data2) do
                    if j ~= nil then
                        if j.housename ~= nil then
                            local random = math.random(1111,9999)
                            houses[random] = {}
                            table.insert(houses[random], {["house_name"] = j.housename, ["house_model"] = j.house_model, ["house_id"] = j.house_id})
                        end
                    end
                end


                if pData[1] ~= nil then
                    TriggerClientEvent('hotel:createRoom1', pSrc, pData[1].roomNumber, pData[1].roomType, houses)
                    TriggerEvent("plutorp-clothingmenu:get_character_current", pSrc)
                else
                    exports.ghmattimysql:execute('INSERT INTO __motels(cid, roomType, roomNumber) VALUES(?, ?, ?)', {cid, "2", pNum})
                    TriggerClientEvent('hotel:createRoom1',  pSrc, pNum, 2, houses)
                end

            end)
        end)
       
    end)

end)

RegisterServerEvent("character:setup:new", function()
    local pSrc = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    local cid = user:getCurrentCharacter().id
    exports.ghmattimysql:execute("UPDATE characters SET `new` = @new WHERE `id` = @id", { ['new'] = "1", ['id'] = cid})
    TriggerClientEvent("plutorp-clothingmenu:defaultReset", pSrc)
end)

RegisterServerEvent("character:new:character", function(cid)
    local pSrc = source
    local pNum = math.random(1,88)
    
    exports.ghmattimysql:execute('INSERT INTO __motels(cid, roomType, roomNumber) VALUES(?, ?, ?)', {cid, "2", pNum})
    TriggerClientEvent("hotel:creation:character", pSrc, pNum, 2)
end)

RegisterServerEvent('hotel:updatelocks')
AddEventHandler('hotel:updatelocks', function(status)
    local src = source
    TriggerClientEvent('hotel:updateLockStatus', src, status)
end)
