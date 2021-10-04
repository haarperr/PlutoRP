-- laptop locations

RegisterNetEvent('plutorp:lesterscomputer')
AddEventHandler('plutorp:lesterscomputer', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(1275.7, -1710.3, 53.7) - player)
    if distance < 1.5 then
        if exports["plutorp-inventory"]:hasEnoughOfItem("usbdevice",1,false) then
            FreezeEntityPosition(PlayerPedId(),true)
            TaskStartScenarioInPlace(PlayerPedId(), "lost_boss_keyboard_talk", 0, false)
            Citizen.Wait(250)
            SetEntityHeading(GetPlayerPed(-1), 303.267)
            local finished = exports["plutorp-taskbar"]:taskBar(9000,"Hacking Into The Mainframe")
            if finished == 100 then
                TriggerEvent("inventory:removeItem", "usbdevice", 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)
