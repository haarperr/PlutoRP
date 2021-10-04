IRP = IRP or {}
IRP.Admin = IRP.Admin or {}
IRP._Admin = IRP._Admin or {}
IRP._Admin.Players = {}
IRP._Admin.DiscPlayers = {}

local Players = {}

RegisterServerEvent('plutorp-adminmenu:Disconnect')
AddEventHandler('plutorp-adminmenu:Disconnect', function(reason)
    DropPlayer(source, reason)
end)

RegisterServerEvent('admin:isFlying')
AddEventHandler('admin:isFlying', function(data)
    TriggerEvent('plutorp-adminmenu:NoclipState', data)
end)

RegisterServerEvent('admin:bringPlayer')
AddEventHandler('admin:bringPlayer', function(pSrc, target)
    local pTarget = tonumber(target)
    local coords = GetEntityCoords(GetPlayerPed(tonumber(pSrc)))
    if pAllowed(pSrc, "Bring") ~= "user" then
        TriggerClientEvent('plutorp-adminmenu:bringPlayer', pTarget, coords)
        TriggerClientEvent('DoLongHudText', tonumber(pSrc), 'Player Brought!')
    end
end)

RegisterServerEvent("admin:attempt:spawn:item", function(pSrc, ItemName, ItemAmount)
    local info =  "Item Name: " ..string.upper(ItemName) .. " Item Amount: " ..ItemAmount
    TriggerClientEvent('player:receiveItem', pSrc, ItemName, ItemAmount)
    exports["plutorp-core"]:k_log(pSrc, "Spawned:items", info)
end)

RegisterServerEvent("admin:attempt:spawn:car", function(pSrc, Model, livery)
    local info =  "Vehicle Spawned: " ..string.upper(Model)
    TriggerClientEvent('plutorp-adminmenu:runSpawnCommand', pSrc, Model, livery)
    exports["plutorp-core"]:k_log(pSrc, "Spawned:car", info)
end)

RegisterServerEvent("admin:getCoords")
AddEventHandler("admin:getCoords", function(Lsrc, target, toggle)
    local src = source
    local pSrc = tonumber(Lsrc)
    local pName = GetPlayerName(pSrc)

    local tSrc = tonumber(target)
    local tName = GetPlayerName(tSrc)

    local coords = GetEntityCoords(GetPlayerPed(tSrc))

    if toggle == true then
        pTog = "started"
    else
        pTog = "stopped"
    end
    local info = pName .. " " .. pTog .. " Spectating " ..tName
    exports["plutorp-core"]:k_log(pSrc, "Spectating", info)
    TriggerClientEvent("admin:attach", pSrc, tSrc, toggle)
    TriggerClientEvent("admin:sendCoords", pSrc, coords)
end)

RegisterServerEvent("admin:search")
AddEventHandler("admin:search", function(pSrc, tSrc)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(tSrc)
    local cid = user:getCurrentCharacter().id

    local pName = GetPlayerName(pSrc)
    local tName = GetPlayerName (tSrc)

    if pAllowed(pSrc, "Search") ~= "user" then
        TriggerClientEvent("server-inventory-open", pSrc, "1", 'ply-'..cid)
        local info = pName .. " Searched " ..tName
        exports["plutorp-core"]:k_log(pSrc, "Searching", info)
    end
end)


RegisterServerEvent("plutorp-adminmenu:delete:test")
AddEventHandler("plutorp-adminmenu:delete:test", function(pSrc, pCid, pModel)
    print(pSrc, pCid, pModel)
    if pAllowed(pSrc, "Give Car") ~= "user" then
        exports.ghmattimysql:execute("SELECT `owner` FROM `characters` WHERE id = ?", {pCid}, function(pData)
            local pSteamHex = pData[1].owner
            print(pSteamHex)
            local q = [[INSERT INTO characters_cars (owner, cid, name, model, vehicle_state, fuel, engine_damage, body_damage, current_garage, license_plate) VALUES(@owner, @cid, @name, @model, @vehicle_state, @fuel, @engine_damage, @body_damage, @current_garage, @license_plate);]]
            local v = {
                ["owner"] = pSteamHex,
                ["cid"] = pCid,
                ['name'] = pModel,
                ["model"] = pModel,
                ["vehicle_state"] = "In",
                ["fuel"] = 100,
                ["engine_damage"] = 1000,
                ["body_damage"] = 1000,
                ["current_garage"] = "I",
                ["license_plate"] = math.random(10000000,99999999)
            }
    
            exports.ghmattimysql:execute(q, v, function()
        
            end)

            TriggerClientEvent("DoLongHudText", pSrc, "Given " .. pModel .. " to cid: " ..pCid)
        end)
    end
end)

RegisterNetEvent("admin:DropPlayer")
AddEventHandler("admin:DropPlayer", function(target, pReason)
    DropPlayer(target, "You were kicked | Reason: " ..pReason)
end)

RegisterServerEvent('plutorp-adminmenu:setcloak')
AddEventHandler('plutorp-adminmenu:setcloak', function(args)
    TriggerClientEvent('cloak', source, args)
end)

RegisterServerEvent('plutorp-adminmenu:kick')
AddEventHandler('plutorp-adminmenu:kick', function(kickid, reason)
    DropPlayer(kickid, reason)
end)


RegisterServerEvent('plutorp-adminmenu:AddPlayer')
AddEventHandler("plutorp-adminmenu:AddPlayer", function()
    local licenses
    local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end
    for _, v in pairs(identifiers) do
        if string.find(v, "license") then
            licenses = v
            break
        end
    end

    local stid = HexIdToSteamId(steamIdentifier)
    local ply = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local scomid = steamIdentifier:gsub("steam:", "")
    local licenseid = licenses:gsub("license:", "")
    local ping = GetPlayerPing(source)
    local data = { source = source, steamid = stid, comid = scomid, name = ply, ip = ip, license = licenseid, ping = ping}

    TriggerClientEvent("plutorp-adminmenu:AddPlayer", -1, data )
    IRP.Admin.AddAllPlayers()
end)


function IRP.Admin.AddAllPlayers(self)
    local xPlayers   = GetPlayers()

    for _, playerId in ipairs(xPlayers) do
         
        local licenses
        local identifiers, steamIdentifier = GetPlayerIdentifiers(playerId)
        for _, v in pairs(identifiers) do
            if string.find(v, "steam") then
                steamIdentifier = v
                break
            end
        end
        for _, v in pairs(identifiers) do
            if string.find(v, "license") then
                licenses = v
                break
            end
        end
        local ip = GetPlayerEndpoint(playerId)
        local licenseid = licenses:gsub("license:", "")
        local ping = GetPlayerPing(playerId)
        local stid = HexIdToSteamId(steamIdentifier)
        local ply = GetPlayerName(playerId)
        local scomid = steamIdentifier:gsub("steam:", "")
        local data = { source = tonumber(playerId), steamid = stid, comid = scomid, name = ply, ip = ip, license = licenseid, ping = ping }

        TriggerClientEvent("plutorp-adminmenu:AddAllPlayers", source, data)

    end
end

function IRP.Admin.AddPlayerS(self, data)
    IRP._Admin.Players[data.source] = data
end

AddEventHandler("playerDropped", function()
	local licenses
    local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end
    for _, v in pairs(identifiers) do
        if string.find(v, "license") then
            licenses = v
            break
        end
    end

    local stid = HexIdToSteamId(steamIdentifier)
    local ply = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local scomid = steamIdentifier:gsub("steam:", "")
    local licenseid = licenses:gsub("license:", "")
    local ping = GetPlayerPing(source)
    local data = { source = source, steamid = stid, comid = scomid, name = ply, ip = ip, license = licenseid, ping = ping}

    TriggerClientEvent("plutorp-adminmenu:RemovePlayer", -1, data )
    Wait(600000)
    TriggerClientEvent("plutorp-adminmenu:RemoveRecent", -1, data)
end)

function HexIdToSteamId(hexId)
    local cid = math.floor(tonumber(string.sub(hexId, 7), 16))
	local steam64 = math.floor(tonumber(string.sub( cid, 2)))
	local a = steam64 % 2 == 0 and 0 or 1
	local b = math.floor(math.abs(6561197960265728 - steam64 - a) / 2)
	local sid = "STEAM_0:"..a..":"..(a == 1 and b -1 or b)
    return sid
end

RegisterServerEvent('admin:setGroup')
AddEventHandler('admin:setGroup', function(pSrc, target, rank)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(target)
    local hexId = user:getVar("hexid")
    if pAllowed(pSrc, "SetGroup") ~= "user" then
        exports.ghmattimysql:execute("UPDATE users SET `rank` = @rank WHERE `hex_id` = @hex_id", {
            ['rank'] = rank, 
            ['hex_id'] = hexId
        })
        TriggerClientEvent('DoLongHudText', pSrc, "Set " .. target .. "'s rank to " .. rank .. "!")
        TriggerClientEvent('admin:RegetGroup', target)
    end
end)


RegisterServerEvent("server:enablehuddebug")
AddEventHandler("server:enablehuddebug", function(enable)
    debug = not debug
    local src = source
    if debug then
        TriggerClientEvent('hud:enabledebug', src)
    else
        TriggerClientEvent('hud:enabledebug', src)
    end
end)


RegisterServerEvent('plutorp-adminmenu:runCommand')
AddEventHandler('plutorp-adminmenu:runCommand', function(data)
    local src = source
    TriggerClientEvent('plutorp-adminmenu:RunClCommand', src, data.command, data)
    if IRP._Admin.Commands[data.command].runcommand then
        local caller = {
            source = src,
            name = GetPlayerName(src),
            steamid = GetPlayerIdentifiers(src)[1],
            getVar = function(self, key) return self[key] end,
        }
        IRP._Admin.Commands[data.command].runcommand(caller, data)
    end
end)

RegisterServerEvent('admin:dumpCurrentPlayers')
AddEventHandler('admin:dumpCurrentPlayers', function()

end)

RegisterServerEvent('admin:teleportToPlayer')
AddEventHandler('admin:teleportToPlayer', function(target)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(target))
    if pAllowed(src, "Teleport") ~= "user" then
        TriggerClientEvent('plutorp-adminmenu:bringPlayer', src, coords)
        TriggerClientEvent('DoLongHudText', src, 'You teleported to this player.')
    end
end)



RegisterServerEvent("plutorp-adminmenu:update:vehicle")
AddEventHandler("plutorp-adminmenu:update:vehicle", function(pSrc, vPlate, vGarage)
    exports.ghmattimysql:execute("SELECT * FROM characters_cars WHERE license_plate = @id", {['id'] = vPlate}, function(data)
        if data[1] then
            local pCid = data[1].cid
            if data[1].vehicle_state == "In" then
                exports.ghmattimysql:execute("UPDATE characters_cars SET `vehicle_state` = @vehicle_state, `current_garage` = @current_garage WHERE `license_plate` = @id", { ['id'] = vPlate, ['vehicle_state'] = "Out", ['current_garage'] = vGarage})
                TriggerClientEvent("DoLongHudText", pSrc, "Vehicle State: Out")
            elseif data[1].vehicle_state == "Out" then
                exports.ghmattimysql:execute("UPDATE characters_cars SET `vehicle_state` = @vehicle_state, `current_garage` = @current_garage WHERE `license_plate` = @id",{ ['id'] = vPlate, ['vehicle_state'] = "In", ['current_garage'] = vGarage})
                TriggerClientEvent("DoLongHudText", pSrc, "Vehicle State: In")
                Citizen.Wait(500)
                TriggerEvent("garages:reset:player:function", vPlate)
            end
        end
    end)
end)


function pAllowed(pSrc, pTrigger)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    local hexId = user:getVar("hexid")
    local pName = GetPlayerName(pSrc)
    print("Checking Perms | Admin Menu | Trigger: " .. pTrigger .. " | Source Steam Hex: " ..hexId.. " Steam Name: "..pName)

    exports.ghmattimysql:execute("SELECT `rank` FROM users WHERE hex_id = ?", {hexId}, function(data)
        pRank = data[1].rank

        if pRank == "user" then
            LogInfo = "Admin Menu | Trigger: " .. pTrigger
            exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/862509992832794645/b6UG6gRdB9Bg0tGav4qxfZ1mO2AlJCBuwn10OveqegnawJeseKiM6Qp2R4kijLvpr211", pSrc, "Trigger-Event-Admin", "Triggering Events", LogInfo)
            DropPlayer(pSrc, "[plutorp-anticheat] | Ban Reason: Triggering Events")
            return
        end

    end)

    Citizen.Wait(100)
    return pRank
end

