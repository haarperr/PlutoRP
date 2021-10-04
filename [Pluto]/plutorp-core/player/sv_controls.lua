RegisterServerEvent("plutorp-core:sv:player_control_set")
AddEventHandler("plutorp-core:sv:player_control_set", function(controlsTable)
    local src = source
    MRP.DB:UpdateControls(src, controlsTable, function(UpdateControls, err)
            if UpdateControls then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("plutorp-core:sv:player_controls")
AddEventHandler("plutorp-core:sv:player_controls", function()
    local src = source
    MRP.DB:GetControls(src, function(loadedControls, err)
        if loadedControls ~= nil then 
            TriggerClientEvent("plutorp-core:cl:player_control", src, loadedControls) 
        else 
            TriggerClientEvent("plutorp-core:cl:player_control",src, nil)
        end
    end)
end)
