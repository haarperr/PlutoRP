RegisterServerEvent('business:license:buy')
AddEventHandler('business:license:buy', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local char = user:getVar("character")
    local money = tonumber(user:getCash())
    if money >= 30000 then
        user:removeMoney(30000)
    else
        TriggerClientEvent('DoLongHudText', src, 'You dont have enough money!', 2)
    end
end)