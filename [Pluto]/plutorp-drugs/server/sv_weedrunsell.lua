RegisterServerEvent('sk1c2:payout')
AddEventHandler('sk1c2:payout', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
        TriggerClientEvent('DoLongHudText', source, 'You got $'.. money .. '!', 1)
    end
end)
