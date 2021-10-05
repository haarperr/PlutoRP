RegisterServerEvent("plutorp-particleserver")
AddEventHandler("plutorp-particleserver", function(method)
    TriggerClientEvent("plutorp-ptfxparticle", -1, method)
end)

RegisterServerEvent("plutorp-particleserversec")
AddEventHandler("plutorp-particleserversec", function(method)
    TriggerClientEvent("plutorp-ptfxparticlesec", -1, method)
end)
