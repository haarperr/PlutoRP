RegisterServerEvent("plutorp-alerts:teenA")
AddEventHandler("plutorp-alerts:teenA",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:policealertA', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:teenB")
AddEventHandler("plutorp-alerts:teenB",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:policealertB', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:teenpanic")
AddEventHandler("plutorp-alerts:teenpanic",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:panic', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:fourA")
AddEventHandler("plutorp-alerts:fourA",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:tenForteenA', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:fourB")
AddEventHandler("plutorp-alerts:fourB",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:tenForteenB', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:downperson")
AddEventHandler("plutorp-alerts:downperson",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:downalert', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:shoot")
AddEventHandler("plutorp-alerts:shoot",function(targetCoords)
    TriggerClientEvent('plutorp-outlawalert:gunshotInProgress', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:storerob")
AddEventHandler("plutorp-alerts:storerob",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:storerobbery', -1, targetCoords)
	return
end)


RegisterServerEvent("plutorp-alerts:houserob")
AddEventHandler("plutorp-alerts:houserob",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:houserobbery', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:drugsselling")
AddEventHandler("plutorp-alerts:drugsselling",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:drugsales', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:tbank")
AddEventHandler("plutorp-alerts:tbank",function(targetCoords)
    TriggerClientEvent('plutorp-alerts:banktruck', -1, targetCoords)
	return
end)

RegisterServerEvent("plutorp-alerts:robjew")
AddEventHandler("plutorp-alerts:robjew",function()
    TriggerClientEvent('plutorp-alerts:jewelrobbey', -1)
	return
end)


RegisterServerEvent("plutorp-dispatch:fleeca:bank")
AddEventHandler("plutorp-dispatch:fleeca:bank",function(pCoords)
    TriggerClientEvent('plutorp-dispatch:fleeca:bank:receive', -1, pCoords)
end)

