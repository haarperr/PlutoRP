RegisterServerEvent('sk1c2:rollcashitem')
AddEventHandler('sk1c2:rollcashitem', function()
    TriggerClientEvent('player:receiveItem', source, 'wetcash', math.random(1,10))
end)

RegisterServerEvent('sk1c2:stackcashitem')
AddEventHandler('sk1c2:stackcashitem', function()
    TriggerClientEvent('player:receiveItem', source, 'wetcash2', math.random(1,10))
end)

RegisterServerEvent('sk1c2:banditem')
AddEventHandler('sk1c2:banditem', function()
    TriggerClientEvent('player:receiveItem', source, 'wetcash3', math.random(1,10))
end)