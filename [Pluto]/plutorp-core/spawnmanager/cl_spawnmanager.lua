MRP.SpawnManager = {}

function MRP.SpawnManager.Initialize(self)
    Citizen.CreateThread(function()

        FreezeEntityPosition(PlayerPedId(), true)

        TransitionToBlurred(500)
        DoScreenFadeOut(500)

        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)

        SetCamRot(cam, 0.0, 0.0, -45.0, 2)
        SetCamCoord(cam, -682.0, -1092.0, 226.0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, true)

        local ped = PlayerPedId()

        SetEntityCoordsNoOffset(ped, -682.0, -1092.0, 200.0, false, false, false, true)

        SetEntityVisible(ped, false)

        DoScreenFadeIn(500)

        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end

        Citizen.Wait(500)

        TriggerEvent("plutorp-core:spawnInitialized")
        TriggerServerEvent("plutorp-core:spawnInitialized")

    end)
end

function MRP.SpawnManager.InitialSpawn(self)
    Citizen.CreateThread(function()
        DisableAllControlActions(0)

        TransitionToBlurred(250)        
        DoScreenFadeOut(1)

        while IsScreenFadingOut() do
            Citizen.Wait(0)
        end

        local character = MRP.LocalPlayer:getCurrentCharacter()
        local new = character.new == 0

        --Tells raid clothes to set ped to correct skin
        TriggerEvent("plutorp-core:initialSpawnModelLoaded")

      

        local ped = PlayerPedId()

       
        SetEntityVisible(ped, true)
        FreezeEntityPosition(PlayerPedId(), false)

        ClearPedTasksImmediately(ped)
        RemoveAllPedWeapons(ped)
        --ClearPlayerWantedLevel(PlayerId())

        local startedCollision = GetGameTimer()

        while not HasCollisionLoadedAroundEntity(ped) do
            if GetGameTimer() - startedCollision > 8000 then break end
            Citizen.Wait(0)
        end

        Citizen.Wait(500)
        
        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end

        TransitionFromBlurred(500)
        EnableAllControlActions(0)
 
        if new then 
            TriggerServerEvent('character:setup:new') 
            return 
        end


        TriggerEvent("character:finishedLoadingChar")
    end)
end

AddEventHandler("plutorp-core:firstSpawn", function()
    MRP.SpawnManager:InitialSpawn()


    Citizen.CreateThread(function()
        Citizen.Wait(600)
        DestroyAllCams(true)
        RenderScriptCams(false, true, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end)


AddEventHandler("plutorp-core:RefreshSpawn", function()
    MRP.SpawnManager:Initialize()
end)

RegisterNetEvent('plutorp-core:clearStates')
AddEventHandler('plutorp-core:clearStates', function()
    TriggerServerEvent("reset:blips")
    TriggerEvent("nowEMSDeathOff")
    TriggerEvent("nowCopDeathOff")
    TriggerEvent("stopSpeedo")
    TriggerEvent("wk:disableRadar")
    exports['plutorp-voice']:removePlayerFromRadio()
    exports["plutorp-voice"]:setVoiceProperty("radioEnabled", false)
end)
