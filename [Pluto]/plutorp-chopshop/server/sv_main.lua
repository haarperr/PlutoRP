RegisterServerEvent('plutorp-chopshop:serverPay')
AddEventHandler('plutorp-chopshop:serverPay', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local amount = math.random(80, 150)
    user:addMoney(amount)
end)


RegisterServerEvent("plutorp-chopshop:chopCostMoney")
AddEventHandler("plutorp-chopshop:chopCostMoney", function(money)
    local pSrc = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    if (tonumber(user:getCash()) >= money) then
        user:removeMoney(money)
        TriggerClientEvent("plutorp-chopshop:startChopshop", pSrc)
    else
        TriggerClientEvent("DoLongHudText", pSrc, "You need $"..money, 2)
    end
end)
