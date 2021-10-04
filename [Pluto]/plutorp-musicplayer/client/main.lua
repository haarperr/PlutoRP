globalOptionsCache = {}
isPlayerCloseToMusic = false
disableMusic = false

function getDefaultInfo()
    return {
        volume = 1.0,
        url = "",
        id = "",
        position = nil,
        distance = 0,
        playing = false,
        paused = false,
        loop = false,
        isDynamic = false,
        timeStamp = 0,
        maxDuration = 0,
        destroyOnFinish = true,
    }
end

-- updating position on html side so we can count how much volume the sound needs.
CreateThread(function()
    local refresh = config.RefreshTime
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    while true do
        Wait(refresh)
        if not disableMusic and isPlayerCloseToMusic then
            ped = PlayerPedId()
            pos = GetEntityCoords(ped)
            SendNUIMessage({
                status = "position",
                x = pos.x,
                y = pos.y,
                z = pos.z
            })
        else
            SendNUIMessage({ status = "position", x = -900000, y = -900000, z = -900000 })
            Wait(1000)
        end
    end
end)

-- checking if player is close to sound so we can switch bool value to true.
CreateThread(function()
    local ped = PlayerPedId()
    local playerPos = GetEntityCoords(ped)
    while true do
        Wait(500)
        ped = PlayerPedId()
        playerPos = GetEntityCoords(ped)
        isPlayerCloseToMusic = false
        for k, v in pairs(soundInfo) do
            if v.position ~= nil and v.isDynamic then
                if #(v.position - playerPos) < v.distance + config.distanceBeforeUpdatingPos then
                    isPlayerCloseToMusic = true
                    break
                end
            end
        end
    end
end)

-- updating timeStamp
CreateThread(function()
    Wait(1100)
    while true do
        Wait(1000)
        for k, v in pairs(soundInfo) do
            if v.playing then
                if getInfo(v.id).timeStamp ~= nil and getInfo(v.id).maxDuration ~= nil then
                    if getInfo(v.id).timeStamp < getInfo(v.id).maxDuration then
                        getInfo(v.id).timeStamp = getInfo(v.id).timeStamp + 1
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("vanilla:request:song", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "vanilla_unicorn" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Place the song URL below.",
            rows = {
                {
                    id = 0,
                    txt = "Song URL"
                },
            }
        })
        if url then
            TriggerEvent("DoLongHudText", "Song is begining to play!")
            TriggerServerEvent("vanilla:request:song:sv", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)

RegisterNetEvent("play:song", function(SongURL, coords, place)
    PlayUrlPos(place, SongURL, 0.2, coords, false, false)
end)

RegisterNetEvent("attemt:play:song", function()
    local pUrl = exports["plutorp-applications"]:KeyboardInput({
        header = "Place the song URL below.",
        rows = {
            {
                id = 0,
                txt = "Song URL" 
            },
            {
                id = 2,
                txt = "Song Volume (10 / 100)" 
            },
            {
                id = 3,
                txt = "Pause Song (True / False)" 
            },
        }
    })
    if pUrl[1].input and pUrl[2].input then
        TriggerEvent("DoLongHudText", "Song is begining to play!")
        PlayUrl("headPhones", pUrl[1].input, pUrl[2].input/100, false, false)
    elseif pUrl[2].input then
        local data = {
            soundId = "headPhones",
            volume =  pUrl[2].input/100,
        }
        TriggerEvent("plutorp-musicplayer:stateSound", "volume", data)
        TriggerEvent("DoLongHudText", "New Volume: " ..pUrl[2].input/100 .. " %")
    elseif pUrl[1].input then
        TriggerEvent("DoLongHudText", "Song is begining to play!")
        PlayUrl("headPhones", pUrl[1].input, 0.2, false, false)
    elseif string.lower(pUrl[3].input) == "true" then
        exports['plutorp-musicplayer']:Pause("headPhones")
        TriggerEvent("DoLongHudText", "Song is now paused!")
    elseif string.lower(pUrl[3].input) == "false" then
        exports['plutorp-musicplayer']:Resume("headPhones")
        TriggerEvent("DoLongHudText", "Song is now resumed!")

    elseif not pUrl[1].input or not pUrl[2].input then
        TriggerEvent("DoLongHudText", "You need a song URL", 2)
    end

end)


RegisterNetEvent("vanilla:change:volume", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "vanilla_unicorn" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Settings: 0 - 100",
            rows = {
                {
                    id = 0,
                    txt = "Volume of the music"
                },
            }
        })
        if url then
            TriggerServerEvent("vanilla:change:volume", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)

RegisterNetEvent("bahamas:request:song", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "bahamas_bar" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Place the song URL below.",
            rows = {
                {
                    id = 0,
                    txt = "Song URL"
                },
            }
        })
        if url then
            TriggerEvent("DoLongHudText", "Song is begining to play!")
            TriggerServerEvent("bahamas:request:song:sv", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)

RegisterNetEvent("bahamas:change:volume", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "bahamas_bar" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Settings: 0 - 100",
            rows = {
                {
                    id = 0,
                    txt = "Volume of the music"
                },
            }
        })
        if url then
            TriggerServerEvent("bahamas:change:volume", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)

RegisterNetEvent("casino:request:song", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "casino_dealer" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Place the song URL below.",
            rows = {
                {
                    id = 0,
                    txt = "Song URL"
                },
            }
        })
        if url then
            TriggerEvent("DoLongHudText", "Song is begining to play!")
            TriggerServerEvent("casino:request:song:sv", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)

RegisterNetEvent("casino:change:volume", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "casino_dealer" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Settings: 0 - 100",
            rows = {
                {
                    id = 0,
                    txt = "Volume of the music"
                },
            }
        })
        if url then
            TriggerServerEvent("casino:change:volume", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)

RegisterNetEvent("arcade:request:song", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "videogeddon_arcade" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Place the song URL below.",
            rows = {
                {
                    id = 0,
                    txt = "Song URL"
                },
            }
        })
        if url then
            TriggerEvent("DoLongHudText", "Song is begining to play!")
            TriggerServerEvent("arcade:request:song:sv", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)

RegisterNetEvent("arcade:change:volume", function()
    local job = exports["plutorp_manager"]:isPed("myjob")
    if job == "videogeddon_arcade" then
        local url = exports["plutorp-applications"]:KeyboardInput({
            header = "Settings: 0 - 100",
            rows = {
                {
                    id = 0,
                    txt = "Volume of the music"
                },
            }
        })
        if url then
            TriggerServerEvent("arcade:change:volume", url[1].input)
        else
            TriggerEvent("DoLongHudText", "You need a song URL", 2)
        end
    end
end)




