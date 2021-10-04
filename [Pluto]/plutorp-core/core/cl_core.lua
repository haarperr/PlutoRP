MRP.Core.hasLoaded = false


function MRP.Core.Initialize(self)
    Citizen.CreateThread(function()
        while true do
            if NetworkIsSessionStarted() then
                TriggerEvent("plutorp-core:playerSessionStarted")
                TriggerServerEvent("plutorp-core:playerSessionStarted")
                break
            end
        end
    end)
end
MRP.Core:Initialize()

AddEventHandler("plutorp-core:playerSessionStarted", function()
    while not MRP.Core.hasLoaded do
        --print("waiting in loop")
        Wait(100)
    end
    ShutdownLoadingScreen()
    MRP.SpawnManager:Initialize()
end)

RegisterNetEvent("plutorp-core:waitForExports")
AddEventHandler("plutorp-core:waitForExports", function()
    if not MRP.Core.ExportsReady then return end

    while true do
        Citizen.Wait(0)
        if exports and exports["plutorp-core"] then
            TriggerEvent("plutorp-core:exportsReady")
            return
        end
    end
end)

RegisterNetEvent("customNotification")
AddEventHandler("customNotification", function(msg, length, type)

	TriggerEvent("chatMessage","SYSTEM",4,msg)
end)

RegisterNetEvent("base:disableLoading")
AddEventHandler("base:disableLoading", function()
    if not MRP.Core.hasLoaded then
         MRP.Core.hasLoaded = true
    end
end)

Citizen.CreateThread( function()
    TriggerEvent("base:disableLoading")
end)


RegisterNetEvent("paycheck:client:call")
AddEventHandler("paycheck:client:call", function()
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("paycheck:server:send", cid)
end)