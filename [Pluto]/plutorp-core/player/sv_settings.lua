RegisterServerEvent("plutorp-core:sv:player_settings_set")
AddEventHandler("plutorp-core:sv:player_settings_set", function(settingsTable)
    local src = source
    MRP.DB:UpdateSettings(src, settingsTable, function(UpdateSettings, err)
            if UpdateSettings then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("plutorp-core:sv:player_settings")
AddEventHandler("plutorp-core:sv:player_settings", function()
    local src = source
    MRP.DB:GetSettings(src, function(loadedSettings, err)
        if loadedSettings ~= nil then 
            TriggerClientEvent("plutorp-core:cl:player_settings", src, loadedSettings) 
        else 
            TriggerClientEvent("plutorp-core:cl:player_settings",src, nil) 
        end
    end)
end)
