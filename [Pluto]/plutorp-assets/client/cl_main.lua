--Coord Command
RegisterCommand('coords', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    TriggerEvent('DoLongHudText', 'Your Coords and heading is copied to your clipboard.', 1)
    SendNUIMessage({
		coords = ""..coords.x..", "..coords.y..", "..coords.z.." Heading: "..heading
	})
end)

RegisterCommand("cid", function(source, args)
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerEvent("DoLongHudText", "Your CID: "..cid)
end)

-- Map Zoom Sens
Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
end)



local onlinePlayers = 0
RegisterNetEvent('rich:TakePlayers')
AddEventHandler('rich:TakePlayers', function(count)
    onlinePlayers = count
    if SetDiscordRichPresenceAction then
        SetDiscordRichPresenceAction(0, 'Click To Join the discord', 'https://discord.gg/wdW4S4YwQv')
    end
end)

Citizen.CreateThread(function()
    TriggerServerEvent('rich:GetPlayers')
    SetDiscordRichPresenceAsset(GetConvar("RichAssetId", "Pluto RP"))
    while true do
        Citizen.Wait(2000)
        SetDiscordRichPresenceAssetText("Pluto RP")
        SetRichPresence(onlinePlayers.."/48 Players")
    end
end)

-- Disable Pistol Whip
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsPedArmed(PlayerPedId(), 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        else
            Citizen.Wait(1500)
        end
    end
end) 

--Blind Fire
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if IsPedInCover(ped, 1) and not IsPedAimingFromCover(ped, 1) then 
			DisableControlAction(2, 24, true) 
			DisableControlAction(2, 142, true)
			DisableControlAction(2, 257, true)
		end		
	end
end)



--Basic Weapon Damage
Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIGHTSTICK"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 0.85)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 0.84)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_MK2"), 0.93)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNSPISTOL"), 0.80)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOl"), 0.81)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE_MK2"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHINEPISTOL"), 0.82)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_APPISTOl"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MICROSMG"), 0.80)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMPACTRIFLE"), 0.83)
    	Wait(0)
    end
end)

-- Crosshair
local plyPed = PlayerPedId()
local xhairActive = false
local disableXhair = false

RegisterCommand("togglexhair", function()
    disableXhair = not disableXhair
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        plyPed = PlayerPedId()
        isArmed = IsPedArmed(plyPed, 7)

        if isArmed then
            if IsPlayerFreeAiming(PlayerId()) then
                if not xhairActive then
                    SendNUIMessage("xhairShow")
                    xhairActive = true
                end
            elseif xhairActive then
                SendNUIMessage("xhairHide")
                xhairActive = false
            end
        elseif IsPedInAnyVehicle(plyPed, false) then
            if xhairActive then
                SendNUIMessage("xhairHide")
                xhairActive = false
            end
        else
            if xhairActive then
                SendNUIMessage("xhairHide")
                xhairActive = false
            end
        end
    end
end)

--- Disables wierd run after shooting
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped, false) then
            if IsPedUsingActionMode(ped) then
                SetPedUsingActionMode(ped, -1, -1, 1)
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

--Gets rid of barriers 
local gates = {
	'p_barier_test_s',
	'prop_sec_barier_01a',
	'prop_sec_barier_02a',
	'prop_sec_barier_02b',
	'prop_sec_barier_03a',
	'prop_sec_barier_03b',
	'prop_sec_barier_04a',
	'prop_sec_barier_04b',
	'prop_sec_barier_base_01',
	'prop_sec_barrier_ld_01a',
	'prop_sec_barrier_ld_02a',
	'prop_gate_airport_01',
	'prop_facgate_01',
	'prop_facgate_03_l',
	'prop_facgate_03_r',
    'prop_burgerstand_01',
    'prop_hotdogstand_01',
    'prop_food_van_01',
    'prop_road_memorial_02',
	'prop_gate_docks_ld',
}

Citizen.CreateThread(function()
   while true do
		for i=1, #gates do
			local coords = GetEntityCoords(PlayerPedId(), false)
			local gate = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, GetHashKey(gates[i]), 0, 0, 0)
			if gate ~= 0 then
				SetEntityAsMissionEntity(gate, 1, 1)
				DeleteObject(gate)
				SetEntityAsNoLongerNeeded(gate)
			end
		end
	   Citizen.Wait(2500)
   end
end)

-- Afk Kicker
 local afkTimeout = 1200
 local timer = 0
 local currentPosition  = nil
 local previousPosition = nil
 local currentHeading   = nil
 local previousHeading  = nil
 local disabled = false
 Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(1000)
         if not disabled then
            playerPed = PlayerPedId()
             if playerPed then
                 currentPosition = GetEntityCoords(playerPed, true)
                 currentHeading  = GetEntityHeading(playerPed)

                 if currentPosition == previousPosition and currentHeading == previousHeading then
                     if timer > 0 then
                         if timer == math.ceil(afkTimeout / 4) then
                             TriggerEvent("DoLongHudText", "Move around or else you'll be kicked for being AFK!")
                         end

                         timer = timer - 1
                     else
                         TriggerServerEvent('afk:kick')
                     end
                 else
                     timer = afkTimeout
                 end

                 previousPosition = currentPosition
                 previousHeading  = currentHeading
             end
         end
 	end
 end)

 RegisterNetEvent("erp:afk:update")
 AddEventHandler("erp:afk:update", function(status)
     disabled = status
 end)

-- No NPC Drops
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
	end
end)

--Disables Recharge Rate

local pedId, plyId = PlayerPedId(), PlayerId()

function GetPed()
    return pedId
end
function GetPlayer()
    return plyId
end

--Disables Recharge Rate
CreateThread(function()
    while true do
        if GetPed() ~= PlayerPedId() then
            pedId = PlayerPedId()
            SetPedMinGroundTimeForStungun(pedId, 5000)
        end
        if GetPlayer() ~= PlayerId() then
            plyId = PlayerId()
            SetPlayerHealthRechargeMultiplier(plyId, 0.0)
        end
        SetPedMinGroundTimeForStungun(pedId, 5000)
        SetPlayerHealthRechargeMultiplier(plyId, 0.0)
        SetRadarBigmapEnabled(false, false)
        Wait(2000)
    end
end)


HudStage = 1
RegisterNetEvent('DoLongHudText')
AddEventHandler('DoLongHudText', function(text,color,length)
    if HudStage > 2 then return end
    if not color then color = 1 end
    if not length then length = 12000 end
    TriggerEvent("tasknotify:guiupdate",color, text, 12000)
end)

RegisterNetEvent('DoShortHudText')
AddEventHandler('DoShortHudText', function(text,color,length)
    if not color then color = 1 end
    if not length then length = 10000 end
    if HudStage > 2 then return end
    TriggerEvent("tasknotify:guiupdate",color, text, 10000)
end)


local waitKeys = false
RegisterNetEvent('car:engineHasKeys')
AddEventHandler('car:engineHasKeys', function(targetVehicle, allow)
    if IsVehicleEngineOn(targetVehicle) then
        if not waitKeys then
            waitKeys = true
            SetVehicleEngineOn(targetVehicle,0,1,1)
            SetVehicleUndriveable(targetVehicle,true)
            TriggerEvent("DoShortHudText", "Engine Halted",1)
            Citizen.Wait(300)
            waitKeys = false
        end
    else
        if not waitKeys then
            waitKeys = true
            TriggerEvent("keys:startvehicle")
            TriggerEvent("DoShortHudText", "Engine Started",1)
            Citizen.Wait(300)
            waitKeys = false
        end
    end
end)

RegisterNetEvent('car:engine')
AddEventHandler('car:engine', function()
    local targetVehicle = GetVehiclePedIsUsing(PlayerPedId())
    TriggerEvent("keys:hasKeys", 'engine', targetVehicle)
end)



 -- Ai Agression
local relationshipTypes = {
        "PLAYER",
        "COP",
        "MISSION2",
        "MISSION3",
        "MISSION4",
        "MISSION5",
        "MISSION6",
        "MISSION7",
        "MISSION8",
    }
      
Citizen.CreateThread(function()
    while true do
    Wait(600)
    for _, group in ipairs(relationshipTypes) do
        if group == "COP" then
          SetRelationshipBetweenGroups(3, `PLAYER`,GetHashKey(group))
          SetRelationshipBetweenGroups(3, GetHashKey(group), `PLAYER`)
          SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
          SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)

        else
          SetRelationshipBetweenGroups(0, `PLAYER`,GetHashKey(group))
          SetRelationshipBetweenGroups(0, GetHashKey(group), `PLAYER`)
          SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
          SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)
        end  
      SetRelationshipBetweenGroups(5, GetHashKey(group), `MISSION8`)
    end
      
      
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_WEICHENG`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `PLAYER`)
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_FAMILY`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`)
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`)

    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`)
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`)



    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_WEICHENG`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_FAMILY`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_LOST`)

    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_LOST`)



--WEST SIDE
    SetRelationshipBetweenGroups(1, `MISSION4`, `AMBIENT_GANG_WEICHENG`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION4`)

-- MEDIC / POLICE WEST SIDE
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_WEICHENG`)



--CENTRAL
    SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_FAMILY`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION5`)
    SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION5`)

-- MEDIC / POLICE CENTRAL
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_FAMILY`)






--EAST SIDE
    SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION6`)
    SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION6`)

-- MEDIC / POLICE EAST SIDE
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION2`)





    SetRelationshipBetweenGroups(1, -86095805, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, -86095805)

    SetRelationshipBetweenGroups(1,1191392768, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`,1191392768)
    
    SetRelationshipBetweenGroups(1, `MISSION2`, 45677184)
    SetRelationshipBetweenGroups(1, 45677184, `MISSION2`)




    SetRelationshipBetweenGroups(3, `PLAYER`, `MISSION7`)
    SetRelationshipBetweenGroups(3, `MISSION7`, `PLAYER`)

    SetRelationshipBetweenGroups(0, `MISSION7`, `COP`)
    SetRelationshipBetweenGroups(0, `COP`, `MISSION7`)

    SetRelationshipBetweenGroups(0, `MISSION2`, `MISSION7`)
    SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION2`)

    SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION7`)

    SetRelationshipBetweenGroups(3, `COP`,`PLAYER`)
    SetRelationshipBetweenGroups(3, `PLAYER`, `COP`)

    SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION3`)
    SetRelationshipBetweenGroups(0, `MISSION3`,`PLAYER`)

    -- LOST MC
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`)
    SetRelationshipBetweenGroups(1,  `COP`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1,  `AMBIENT_GANG_LOST`, `COP`)
      
    end
end)
      
RegisterNetEvent('gangs:setDefaultRelations')
AddEventHandler("gangs:setDefaultRelations",function() 
    Citizen.Wait(1000)
    for _, group in ipairs(relationshipTypes) do
        SetRelationshipBetweenGroups(0, `PLAYER`,GetHashKey(group))
        SetRelationshipBetweenGroups(0, GetHashKey(group), `PLAYER`)
        SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
        SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)
        SetRelationshipBetweenGroups(5, GetHashKey(group), `MISSION8`)
    end
      -- mission 7 is guards at vinewood and security guards
      SetRelationshipBetweenGroups(3, `PLAYER`, `MISSION7`)
      SetRelationshipBetweenGroups(3, `MISSION7`, `PLAYER`)
  
      SetRelationshipBetweenGroups(0, `MISSION7`, `COP`)
      SetRelationshipBetweenGroups(0, `COP`, `MISSION7`)
  
      SetRelationshipBetweenGroups(0, `MISSION2`, `MISSION7`)
       SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION2`)
  
      SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION7`)
  
  
  
  
      -- players love each other even if full hatred
      SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION8`)
  
      -- cops from scenarios love cops and ems logged in
      SetRelationshipBetweenGroups(0, `COP`, `MISSION2`)
  
      -- players love cops and ems
      SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION2`)
  
      SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION3`)
      SetRelationshipBetweenGroups(0, `MISSION3`,`PLAYER`)
end)


-- PlayerNumbers 
local hidden = {}
local showPlayerBlips = false
local ignorePlayerNameDistance = false
local disPlayerNames = 50
local playerSource = 0


function DrawText3D(x,y,z, text, textColor) -- some useful function, use it if you want!
    local color = { r = 255, g = 255, b = 255, alpha = 255 } -- Color of the text 
    if textColor ~= nil then 
        color = {r = textColor[1] or 255, g = textColor[2] or 255, b = textColor[3] or 255, alpha = textColor[4] or 255}
    end
    
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz) - vector3(x,y,z))

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.3,0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DrawText3DTalking(x,y,z, text, textColor) -- some useful function, use it if you want!
    local color = { r = 220, g = 220, b = 220, alpha = 255 } -- Color of the text 
    if textColor ~= nil then 
        color = {r = textColor[1] or 22, g = textColor[2] or 55, b = textColor[3] or 155, alpha = textColor[4] or 255}
    end

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz) - vector3(x,y,z))

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.0*scale, 0.75*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

RegisterNetEvent("hud:HidePlayer")
AddEventHandler("hud:HidePlayer", function(player, toggle)
    if type(player) == "table" then
        for k,v in pairs(player) do
            if DoesPlayerExist(k) then
                local id = GetPlayerFromServerId(k)
                hidden[id] = k
            end
        end
        return
    end
    if DoesPlayerExist(player) then
        local id = GetPlayerFromServerId(player)
        if toggle == true then
            hidden[id] = player
        else
            for k,v in pairs(hidden) do
                if v == player then hidden[k] = nil end
            end
        end
    end
end)

Controlkey = {["generalScoreboard"] = {303,"U"}} 
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
    Controlkey["generalScoreboard"] = table["generalScoreboard"]
end)


Citizen.CreateThread(function()
    while true do
        if IsControlPressed(0, Controlkey["generalScoreboard"][1]) then

            for i=0,255 do
                N_0x31698aa80e0223f8(i)
            end

            local playerped = PlayerPedId()
            local HeadBone = 0x796e

            for id = 0, 255 do
                if NetworkIsPlayerActive(id) then
                    local ped = GetPlayerPed(id)

                    local playerCoords = GetPedBoneCoords(playerped, HeadBone)

                    if ped == playerped then
                        DrawText3DTalking(playerCoords.x, playerCoords.y, playerCoords.z+0.5, " ".. GetPlayerServerId(id) .. " ", {152, 251, 152, 255})
                    else
                        local pedCoords = GetPedBoneCoords(ped, HeadBone)

                        local distance = math.floor(#(playerCoords - pedCoords))

                        local isDucking = IsPedDucking(ped)
                        local cansee = HasEntityClearLosToEntity(playerped, ped, 17 )
                        local isReadyToShoot = IsPedWeaponReadyToShoot(ped)
                        local isStealth = GetPedStealthMovement(ped)
                        local isDriveBy = IsPedDoingDriveby(ped)
                        local isInCover = IsPedInCover(ped,true)
                        if isStealth == nil then
                            isStealth = 0
                        end

                        if isDucking or isStealth == 1 or isDriveBy or isInCover then
                            cansee = false
                        end

                        if hidden[id] then cansee = false end

                        if (distance < disPlayerNames) then
                            if(NetworkIsPlayerTalking(id)) then                            
                                if cansee then
                                    DrawText3DTalking(pedCoords.x, pedCoords.y, pedCoords.z+0.5, " ".. GetPlayerServerId(id) .. " ", {22, 55, 155, 255})
                                end
                            else
                                if cansee then
                                    DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z+0.5, " ".. GetPlayerServerId(id) .. " ", {255, 255, 255, 255})
                                end
                            end
                        end
                    end                        
                end
            end
            Citizen.Wait(1)
        else
            Citizen.Wait(2000)
        end        
    end
end)

-- BIKE
RegisterNetEvent('pickup:bike')
AddEventHandler('pickup:bike', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)
    local bone = GetPedBoneIndex(playerPed, 0xE5F3)
    local bike = false

    if GetEntityModel(vehicle) == GetHashKey("bmx") or GetEntityModel(vehicle) == GetHashKey("scorcher") or GetEntityModel(vehicle) == GetHashKey("cruiser") or GetEntityModel(vehicle) == GetHashKey("fixter") or GetEntityModel(vehicle) == GetHashKey("tribike") or GetEntityModel(vehicle) == GetHashKey("tribike2") or GetEntityModel(vehicle) == GetHashKey("tribike3") then

    AttachEntityToEntity(vehicle, playerPed, bone, 0.0, 0.24, 0.10, 340.0, 330.0, 330.0, true, true, false, true, 1, true)
    TriggerEvent("DoLongHudText","Press G to drop the bike.", 5000)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do Citizen.Wait(0) end
    TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 2.0, 2.0, 50000000, 51, 0, false, false, false)
    bike = true

    RegisterCommand('dropbike', function()
        if IsEntityAttached(vehicle) then
        DetachEntity(vehicle, nil, nil)
        SetVehicleOnGroundProperly(vehicle)
        ClearPedTasksImmediately(playerPed)
        bike = false
        end
    end, false)

        RegisterKeyMapping('dropbike', 'Drop Bike', 'keyboard', 'g')

                Citizen.CreateThread(function()
                while true do
                Citizen.Wait(0)
                if bike and IsEntityPlayingAnim(playerPed, "anim@heists@box_carry@", "idle", 3) ~= 1 then
                    RequestAnimDict("anim@heists@box_carry@")
                    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do Citizen.Wait(0) end
                    TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 2.0, 2.0, 50000000, 51, 0, false, false, false)
                    if not IsEntityAttachedToEntity(playerPed, vehicle) then
                        bike = false
                        ClearPedTasksImmediately(playerPed)
                    end
                end
            end
        end)
    end
end)

-- No Driver Shooting
-- local passengerDriveBy = true

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Wait(1)

-- 		playerPed = GetPlayerPed(-1)
-- 		car = GetVehiclePedIsIn(playerPed, false)
-- 		if car then
-- 			if GetPedInVehicleSeat(car, -1) == playerPed then
-- 				SetPlayerCanDoDriveBy(PlayerId(), false)
-- 			elseif passengerDriveBy then
-- 				SetPlayerCanDoDriveBy(PlayerId(), true)
-- 			else
-- 				SetPlayerCanDoDriveBy(PlayerId(), false)
-- 			end
-- 		end
-- 	end
-- end)


WeaponCheckerFullList = {
    [`WEAPON_STUNGUN`] = "WEAPON_STUNGUN",
 
    --[[ Small Caliber ]]--
    [`WEAPON_PISTOL`] = "WEAPON_PISTOL",
    [`WEAPON_COMBATPISTOL`] = "WEAPON_COMBATPISTOL",
    [`WEAPON_APPISTOL`] = "WEAPON_APPISTOL",
    [`WEAPON_COMBATPDW`] = "WEAPON_COMBATPDW",
    [`WEAPON_MACHINEPISTOL`] = "WEAPON_MACHINEPISTOL",
    [`WEAPON_MICROSMG`] = "WEAPON_MICROSMG",
    [`WEAPON_MINISMG`] = "WEAPON_MINISMG",
    [`WEAPON_PISTOL_MK2`] = "WEAPON_PISTOL_MK2",
    [`WEAPON_SNSPISTOL`] = "WEAPON_SNSPISTOL",
    [`WEAPON_SNSPISTOL_MK2`] = "WEAPON_SNSPISTOL_MK2",
    [`WEAPON_VINTAGEPISTOL`] = "WEAPON_VINTAGEPISTOL",
 
    --[[ Medium Caliber ]]--
    [`WEAPON_ADVANCEDRIFLE`] = "WEAPON_ADVANCEDRIFLE",
    [`WEAPON_ASSAULTSMG`] = "WEAPON_ASSAULTSMG",
    [`WEAPON_BULLPUPRIFLE`] = "WEAPON_BULLPUPRIFLE",
    [`WEAPON_BULLPUPRIFLE_MK2`] = "WEAPON_BULLPUPRIFLE_MK2",
    [`WEAPON_CARBINERIFLE`] = "WEAPON_CARBINERIFLE",
    [`WEAPON_CARBINERIFLE_MK2`] = "WEAPON_CARBINERIFLE_MK2",
    [`WEAPON_COMPACTRIFLE`] = "WEAPON_COMPACTRIFLE",
    [`WEAPON_DOUBLEACTION`] = "WEAPON_DOUBLEACTION",
    [`WEAPON_GUSENBERG`] = "WEAPON_GUSENBERG",
    [`WEAPON_HEAVYPISTOL`] = "WEAPON_HEAVYPISTOL",
    [`WEAPON_MARKSMANPISTOL`] = "WEAPON_MARKSMANPISTOL",
    [`WEAPON_PISTOL50`] = "WEAPON_PISTOL50",
    [`WEAPON_REVOLVER`] = "WEAPON_REVOLVER",
    [`WEAPON_REVOLVER_MK2`] = "WEAPON_REVOLVER_MK2",
    [`WEAPON_SMG`] = "WEAPON_SMG",
    [`WEAPON_SMG_MK2`] = "WEAPON_SMG_MK2",
    [`WEAPON_SPECIALCARBINE`] = "WEAPON_SPECIALCARBINE",
    [`WEAPON_SPECIALCARBINE_MK2`] = "WEAPON_SPECIALCARBINE_MK2",
 
    --[[ High Caliber ]]--
    [`WEAPON_ASSAULTRIFLE`] = "WEAPON_ASSAULTRIFLE",
    [`WEAPON_ASSAULTRIFLE_MK2`] = "WEAPON_ASSAULTRIFLE_MK2",
    [`WEAPON_COMBATMG`] = "WEAPON_COMBATMG",
    [`WEAPON_COMBATMG_MK2`] = "WEAPON_COMBATMG_MK2",
    [`WEAPON_HEAVYSNIPER`] = "WEAPON_HEAVYSNIPER",
    [`WEAPON_HEAVYSNIPER_MK2`] = "WEAPON_HEAVYSNIPER_MK2",
    [`WEAPON_MARKSMANRIFLE`] = "WEAPON_MARKSMANRIFLE",
    [`WEAPON_MARKSMANRIFLE_MK2`] = "WEAPON_MARKSMANRIFLE_MK2",
    [`WEAPON_MG`] = "WEAPON_MG",
    [`WEAPON_MINIGUN`] = "WEAPON_MINIGUN",
    [`WEAPON_MUSKET`] = "WEAPON_MUSKET",
    [`WEAPON_RAILGUN`] = "WEAPON_RAILGUN",
 
    --[[ Shotguns ]]--
    [`WEAPON_ASSAULTSHOTGUN`] = "WEAPON_ASSAULTSHOTGUN",
    [`WEAPON_BULLUPSHOTGUN`] = "WEAPON_BULLUPSHOTGUN",
    [`WEAPON_DBSHOTGUN`] = "WEAPON_DBSHOTGUN",
    [`WEAPON_HEAVYSHOTGUN`] = "WEAPON_HEAVYSHOTGUN",
    [`WEAPON_PUMPSHOTGUN`] = "WEAPON_PUMPSHOTGUN",
    [`WEAPON_PUMPSHOTGUN_MK2`] = "WEAPON_PUMPSHOTGUN_MK2",
    [`WEAPON_SAWNOFFSHOTGUN`] = "WEAPON_SAWNOFFSHOTGUN",
    [`WEAPON_SWEEPERSHOTGUN`] = "WEAPON_SWEEPERSHOTGUN",
 
    --[[ Cutting Weapons ]]--
    -- [`WEAPON_BATTLEAXE`] = "WEAPON_BATTLEAXE",
    -- [`WEAPON_BOTTLE`] = "WEAPON_BOTTLE",
    -- [`WEAPON_DAGGER`] = "WEAPON_DAGGER",
    -- [`WEAPON_HATCHET`] = "WEAPON_HATCHET",
    -- [`WEAPON_KNIFE`] = "WEAPON_KNIFE",
    -- [`WEAPON_MACHETE`] = "WEAPON_MACHETE",
    -- [`WEAPON_SWITCHBLADE`] = "WEAPON_SWITCHBLADE",
 
    --[[ Heavy Impact ]]--
    -- [`WEAPON_BAT`] = "WEAPON_BAT",
    -- [`WEAPON_CROWBAR`] = "WEAPON_CROWBAR",
    -- [`WEAPON_FIREEXTINGUISHER`] = "WEAPON_FIREEXTINGUISHER",
    -- [`WEAPON_FIRWORK`] = "WEAPON_FIRWORK",
    -- [`WEAPON_GOLFLCUB`] = "WEAPON_GOLFLCUB",
    -- [`WEAPON_HAMMER`] = "WEAPON_HAMMER",
    -- [`WEAPON_PETROLCAN`] = "WEAPON_PETROLCAN",
    -- [`WEAPON_POOLCUE`] = "WEAPON_POOLCUE",
    -- [`WEAPON_WRENCH`] = "WEAPON_WRENCH",
    [`WEAPON_RAMMED_BY_CAR`] = "WEAPON_RAMMED_BY_CAR",
    [`WEAPON_RUN_OVER_BY_CAR`] = "WEAPON_RUN_OVER_BY_CAR",
 
    --[[ Explosives ]]--
    [`WEAPON_EXPLOSION`] = "WEAPON_EXPLOSION",
    [`WEAPON_GRENADE`] = "WEAPON_GRENADE",
    [`WEAPON_COMPACTLAUNCHER`] = "WEAPON_COMPACTLAUNCHER",
    [`WEAPON_PIPEBOMB`] = "WEAPON_PIPEBOMB",
    [`WEAPON_PROXMINE`] = "WEAPON_PROXMINE",
    [`WEAPON_RPG`] = "WEAPON_RPG",
    [`WEAPON_STICKYBOMB`] = "WEAPON_STICKYBOMB",
 
    --[[ Other ]]--
    [`WEAPON_FALL`] = "WEAPON_FALL", -- Fall
}



AddEventHandler("gameEventTriggered", function(name, args)
    if name == "CEventNetworkEntityDamage" then
        local ped = PlayerPedId()

        local hit, bone = nil, nil
        hit, bone = GetPedLastDamageBone(ped)
        if bone ~= nil then
            local weapon = GetDamagingWeapon(ped)
            if weapon ~= nil then
                if IsPedAPlayer(args[1]) then
                    local attacker = GetPlayerServerId(NetworkGetPlayerIndexFromPed(args[2]))
                    local dmg = GetPlayerWeaponDamageModifier(GetPlayerFromServerId(attacker))
                    if dmg > 1.0 then
                        TriggerServerEvent("player:damage:multi", attacker, weapon, string.format("%.2f", dmg))
                    end
                end
            end
        end
    end
end) 

function GetDamagingWeapon(ped)
    for k, v in pairs(WeaponCheckerFullList) do
        if HasPedBeenDamagedByWeapon(ped, k, 0) then
            ClearEntityLastDamageEntity(ped)
            return v
        end
    end

    return nil
end

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(veh) and not IsEntityDead(veh) then
            local model = GetEntityModel(veh)
            -- If it's not a boat, plane or helicopter, and the vehilce is off the ground with ALL wheels, then block steering/leaning left/right/up/down.
            if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) and IsEntityInAir(veh) then
                DisableControlAction(0, 59) -- leaning left/right
                DisableControlAction(0, 60) -- leaning up/down
            end
        end
    end
end)