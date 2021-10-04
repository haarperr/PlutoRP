RegisterNUICallback("dataPost", function(data, cb)
    SetNuiFocus(false)
    TriggerEvent(data.event, data.args)
    cb('ok')
    -- PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
end)

RegisterNUICallback("cancel", function()
    SetNuiFocus(false)

    -- Events that are required to do smothing on menu close!
    TriggerEvent('garges:force:clear')


    -- PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
end)


RegisterNetEvent('plutorp-context:sendMenu', function(data)
    if not data then return end
    SetNuiFocus(true, true)
    -- PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data
    })
end)
