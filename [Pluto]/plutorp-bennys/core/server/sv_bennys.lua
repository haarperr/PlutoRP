local hmm = vehicleBaseRepairCost

RegisterServerEvent('plutorp-bennys:attemptPurchase')
AddEventHandler('plutorp-bennys:attemptPurchase', function(cheap, type, upgradeLevel)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    if type == "repair" then
        if user:getCash() >= hmm then
            user:removeMoney(hmm)
            TriggerClientEvent('plutorp-bennys:purchaseSuccessful', source)
        else
            TriggerClientEvent('plutorp-bennys:purchaseFailed', source)
        end
    elseif type == "performance" then
        if user:getCash() >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('plutorp-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('plutorp-bennys:purchaseFailed', source)
        end
    else
        if user:getCash() >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('plutorp-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('plutorp-bennys:purchaseFailed', source)
        end
    end
end)

RegisterServerEvent('plutorp-bennys:updateRepairCost')
AddEventHandler('plutorp-bennys:updateRepairCost', function(cost)
    hmm = cost
end)

RegisterServerEvent('plutorp:bennys:pay')
AddEventHandler('plutorp:bennys:pay', function()
local src = source
local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
TriggerEvent('DoLongHudText', "You Have Been Charged For: $0!", 2)
    user:removeMoney(0)
end)

RegisterServerEvent('plutorp:bennys:pay1')
AddEventHandler('plutorp:bennys:pay1', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(3250)
    TriggerEvent('DoLongHudText', "You Have Been Charged For: $3250!", 2)
end)

RegisterServerEvent('plutorp:bennys:pay2')
AddEventHandler('plutorp:bennys:pay2', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(5500)
    TriggerEvent('DoLongHudText', "You Have Been Charged For: $5500!", 2)
end)

RegisterServerEvent('plutorp:bennys:pay3')
AddEventHandler('plutorp:bennys:pay3', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(10450)
    TriggerEvent('DoLongHudText', "You Have Been Charged For: $10450!", 2)
end)

RegisterServerEvent('plutorp:bennys:turbo')
AddEventHandler('plutorp:bennys:turbo', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(10450)
    TriggerClientEvent('DoLongHudText', "You Have Been Charged For: $0!", 2)
end)


RegisterServerEvent('plutorp:bennys:turbo2')
AddEventHandler('plutorp:bennys:turbo2', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(15000)
    TriggerClientEvent('DoLongHudText', "You Have Been Charged For: $15000!", 2)
end)
