
RegisterServerEvent("submit:bug:report", function(data)
    local pSrc = source
    print (data.description, data.url, data.title)
    if data.description and data.url and data.title ~= "" then
        local LogData = {
            {
                ['description'] = string.format("`%s`\n\n`• Bug: %s`\n\n`Description: %s`\n\n`• Discord Name: %s`\n\n", "Bug Report", data.title,  data.description, data.url),
                ['color'] = 2317994,
            }
        }
        PerformHttpRequest("https://discord.com/api/webhooks/887869941687136256/2HscN450L5li0T56wvY_TE4eHaaK8_qBwVldAVoK3KFu1cusqi4RPI6KN2bCNhh9brPL", function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
        TriggerClientEvent("DoLongHudText", pSrc, "Thank you for submitting a bug report, we will look into this!")
    else
        TriggerClientEvent("DoLongHudText", pSrc, "You did not follow the format!", 2)
    end
end)