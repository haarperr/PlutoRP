RegisterServerEvent('thermite:StartFireAtLocation')
AddEventHandler('thermite:StartFireAtLocation' , function(x,y,z,arg1,arg2)
    local source = source
    TriggerClientEvent('thermite:StartClientFires', -1, x,y,z,arg1,arg2)
end)

RegisterServerEvent('thermite:StopFires')
AddEventHandler('thermite:StopFires' , function()
    local source = source
    TriggerClientEvent('thermite:StopFiresClient', -1)
end)

--fireworks--
RegisterServerEvent("syncbad1")
AddEventHandler("syncbad1", function(x, y, z)
    TriggerClientEvent("syncbad_cl1", -1, x, y, z)
end)
RegisterServerEvent("syncbad2")
AddEventHandler("syncbad2", function(x, y, z)
    TriggerClientEvent("syncbad_cl2", -1, x, y, z)
end)
RegisterServerEvent("syncbad3")
AddEventHandler("syncbad3", function(x, y, z)
    TriggerClientEvent("syncbad_cl3", -1, x, y, z)
end)
RegisterServerEvent("syncbad4")
AddEventHandler("syncbad4", function(x, y, z)
    TriggerClientEvent("syncbad_cl4", -1, x, y, z)
end)