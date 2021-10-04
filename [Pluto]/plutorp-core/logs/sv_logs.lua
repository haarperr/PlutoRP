function AddLog(lType, user, log, data)
    if not lType then lType = "None" else lType = tostring(lType) end
    
    if lType == "Exploiter" then
        exports["plutorp-core"]:getModule("Admin"):ExploitAlertDiscord(user, log)
    end

    local steamId = (user and type(user) ~= "string") and user["steamid"] or (user and user or "Unknown")

    local cid = nil

    log = log and tostring(log) or "None"
    data = data and json.encode(data) or "None"

    local q = [[INSERT INTO logs (type, log, data, cid, steam_id) VALUES (@type, @log, @data, @cid, @steam_id);]]

    local v = {
        ["type"] = lType,
        ["log"] = log,
        ["data"] = data,
        ["cid"] = 0,
        ["steam_id"] = steamId
    }

    exports.ghmattimysql:execute(q, v)
end


function DiscordLog(wh, pSrc, reason, pBanReason, pLogData)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    if user ~= false then
        hexId = user:getVar("hexid")
    else
        hexId = GetPlayerIdentifiers(pSrc)[1]
    end


    local pName = GetPlayerName(pSrc)
    local pDiscord = GetPlayerIdentifiers(pSrc)[3]
    
    pLogData = pLogData and tostring(pLogData) or "None"

    
    local LogData = {
        {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", reason, pSrc, hexId, pDiscord),
            ['color'] = 2317994,
            ['fields'] = {
                {
                    ['name'] = '`Additional Information`',
                    ['value'] = pLogData,
                    ['inline'] = false
                },
            },
            ['author'] = {
                ['name'] = "Steam Name: "..pName
            },
        }
    }

    PerformHttpRequest(wh, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	


    --- Drop Player for valid reasons
    if reason == "Cheater: Spawned Blacklisted Prop" or reason == "Triggering Events" or reason == "Damage Modifier" then
        exports.ghmattimysql:execute('INSERT INTO user_bans (steam_id, discord_id, steam_name, reason, details) VALUES (@steam_id, @discord_id, @steam_name, @reason, @details)', {
            ['@steam_id'] = hexId,
            ['@discord_id'] = pDiscord,
            ['@steam_name'] = pName,
            ['@reason'] = pBanReason,
            ['@details'] = pLogData
        }, function()
        end)
    end
end