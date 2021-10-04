Fuel = 0
isUnderwater = false;
isLoggedIn = true;
veloc = GetEntityVelocity(veh)
engine = false
dead = false
sleeping = false
lastValues = {}

currentValues = {
	["health"] = 100,
	["armor"] = 100,
	["hunger"] = 100,
	["thirst"] = 100,
	["oxy"] = 200,
	["stress"] = 100,
	["voice"] = 2,
	["devmode"] = false,
	["devdebug"] = false,
	["is_talking"] = false
}

Fuel = 45
DivingStatus = false
updateLatestVehicle = nil
setLastUpdate = 0

DecorRegister("GetVehicleCurrentFuel", 3)



RegisterNetEvent("plutorp-hud:EnableHud")
AddEventHandler("plutorp-hud:EnableHud", function()
    isLoggedIn = true
end)

function getVehicleClosestToMe()
    playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    targetVehicle = getVehicleInDirection(coordA, coordB)
    return targetVehicle
end

RegisterNetEvent("RefuelCarServerReturn")
AddEventHandler("RefuelCarServerReturn",function()
    local timer = (100 - vehicleCurrentFuel) * 400
    refillVehicle()
    local finished = exports["plutorp-taskbar"]:taskBar(timer,"Refueling")
    local veh = getVehicleClosestToMe()

    if finished == 100 then
        DecorSetInt(veh, "GetVehicleCurrentFuel", 100)
    else

        local vehicleCurrentFuel = DecorGetInt(veh, "GetVehicleCurrentFuel")
        local endFuel = (100 - vehicleCurrentFuel) 
        endFuel = math.ceil(endFuel * (finished / 100) + vehicleCurrentFuel)
        DecorSetInt(veh, "GetVehicleCurrentFuel", endFuel)

    end
    endanimation()
end)

function refillVehicle()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict( "weapon@w_sp_jerrycan" ) 
    TaskPlayAnim( PlayerPedId(), "weapon@w_sp_jerrycan", "fire", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
end

function endanimation()
    shiftheld = false
    ctrlheld = false
    tabheld = false
    ClearPedTasks(PlayerPedId())
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function round( n )
    return math.floor( n + 0.5 )
end


function lerp(min, max, amt)
	return (1 - amt) * min + amt * max
end
function rangePercent(min, max, amt)
	return (((amt - min) * 100) / (max - min)) / 100
end

RegisterNetEvent("plutorp-hud:changeRange")
AddEventHandler("plutorp-hud:changeRange", function(pRange)
    voice = pRange or 2
end)

AddEventHandler("hud:voice:transmitting", function (transmitting)
	SendNUIMessage({type = "transmittingStatus", is_transmitting = transmitting})
end)


Citizen.CreateThread(function ()
	while true do
		local isTalking = NetworkIsPlayerTalking(PlayerId())
        local pRadioActive = exports['plutorp-voice']:pRadioActive()
		if isTalking and pRadioActive == false then
            SendNUIMessage({talking = true})
        elseif pRadioActive == true then 
            SendNUIMessage({pActive = pRadioActive})
		elseif not isTalking then
            SendNUIMessage({talking = false})
		end

		Citizen.Wait(100)
	end
end)

local seatbelt = false
RegisterNetEvent("seatbelt")
AddEventHandler("seatbelt", function(belt)
    seatbelt = belt
end)

RegisterNetEvent("harness")
AddEventHandler("harness", function(belt)
    seatbelt = belt
end)

local DevMode = false
RegisterNetEvent("plutorp-adminmenu:currentDevmode", function(pOn)
	DevMode = pOn
end)

local DebugMode = false
RegisterNetEvent("plutorp-adminmenu:currentDebug", function(pOn)
	DebugMode = pOn
end)

pShowLocation = false
RegisterNetEvent("plutorp-inventory:watch:status")
AddEventHandler("plutorp-inventory:watch:status", function()
	pShowLocation = not pShowLocation
end)

Citizen.CreateThread(function()
    voice = 2
    while true do
        Wait(500)
        if isLoggedIn then
            local player = PlayerPedId()
            local veh = GetVehiclePedIsIn(player, false)
            SetPedSuffersCriticalHits(PlayerPedId(),false)
            local x, y, z = table.unpack(GetEntityCoords(player, true))
            local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
            currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
            intersectStreetName = GetStreetNameFromHashKey(intersectStreetHash)
            zone = tostring(GetNameOfZone(x, y, z))
            local area = GetLabelText(zone)
            local pRadio = exports['radio']:pChannel()

            if not zone then
                zone = "UNKNOWN"
            end
    
            if intersectStreetName ~= nil and intersectStreetName ~= "" and currentStreetName ~= nil and currentStreetName ~= "" then
                playerStreetsLocation = currentStreetName .. " | [" .. intersectStreetName .. "]"
            elseif currentStreetName ~= nil and currentStreetName ~= "" then
                playerStreetsLocation = currentStreetName
            end

            SendNUIMessage({action = "voice_level", voicelevel = voice})

            street = playerStreetsLocation

     
            if IsPedSwimmingUnderWater(PlayerPedId()) then
                isUnderwater = true
                SendNUIMessage({showOxygen = true})
            elseif not IsPedSwimmingUnderWater(PlayerPedId()) then
                isUnderwater = false
                SendNUIMessage({showOxygen = false})
            end

            if GetVehicleEngineHealth(veh) < 400.0 then
                engine = true
            else
                engine = false
            end
			
            if isLoggedIn and IsPedInAnyVehicle(PlayerPedId(), true) and not IsPauseMenuActive() then 
                local Mph = math.ceil(GetEntitySpeed(veh) * 2.236936)
                local vehhash = GetEntityModel(veh)
                local maxspeed = GetVehicleModelMaxSpeed(vehhash) * 3.6
                TriggerEvent('plutorp-map:ShowMap')
                SendNUIMessage({showCarUi = true})
                SendNUIMessage({checkseatbelt = seatbelt})
                SendNUIMessage({speed = Mph, maxspeed = maxspeed, street = area, street2 = street, engine = engine})
                SetRadarBigmapEnabled(false, false)
                HideMinimapInteriorMapThisFrame()
                DisplayRadar(true)
            else
                DisplayRadar(false)
				SendNUIMessage({DevMode = DevMode})
				SendNUIMessage({DebugMode = DebugMode})
				SendNUIMessage({ShowLocation = pShowLocation, street = area, street2 = street})
                SendNUIMessage({showCarUi = false})
                TriggerEvent('plutorp-map:HideMap')
            end


            if pRadio == true then 
                SendNUIMessage({radio = true})
            elseif pRadio == false then 
                SendNUIMessage({radio = false})
            end

            if IsPedInAnyVehicle(player, true) then
                SendNUIMessage({
                    action = "update_fuel",
                    fuel = math.ceil(Fuel)
                })
            end


			local get_ped = PlayerPedId()
            local armor = GetPedArmour(PlayerPedId())
			local death = exports['ragdoll']:GetDeathStatus()
            currentValues["health"] = GetEntityHealth(get_ped) - 100
			currentValues["armor"] = GetPedArmour(get_ped)
			currentValues["stress"] = math.ceil(stresslevel / 100)
			currentValues["parachute"] = HasPedGotWeapon(get_ped, `gadget_parachute`, false)

			if currentValues["stress"] > 100 then currentValues["stress"] = 100 end

      		if currentValues["hunger"] < 0 then
				currentValues["hunger"] = 0
			end
			if currentValues["thirst"] < 0 then
				currentValues["thirst"] = 0
			end

			if currentValues["hunger"] > 100 then currentValues["hunger"] = 100 end

			if currentValues["health"] < 1 then currentValues["health"] = 100 end
			if currentValues["thirst"] > 100 then currentValues["thirst"] = 100 end
            if currentValues["oxy"] <= 0 then currentValues["oxy"] = 0 end

            SendNUIMessage({
                action = "update_hud",
                hp = currentValues["health"],
                armor = lerp(0, 100, rangePercent(0, 60, currentValues["armor"])),
                hunger = currentValues["hunger"],
                thirst = currentValues["thirst"],
                stress = currentValues["stress"],
                oxygen = lerp(0, 100, rangePercent(0, 205, currentValues["oxy"])),
				death = death
            })

            if IsPauseMenuActive() then
                SendNUIMessage({showUi = false})
                TriggerEvent('plutorp-map:HideMap')
            elseif not IsPauseMenuActive() then
                SendNUIMessage({showUi = true})
            end
		
        else
            DisplayRadar(false)
            TriggerEvent('plutorp-map:HideMap')
            SendNUIMessage({showUi = false})
            SendNUIMessage({showCarUi = false})
			SendNUIMessage({ShowLocation = false})
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = PlayerPedId()

        if IsVehicleEngineOn(GetVehiclePedIsIn(player, false)) or pShowLocation or sleeping then
            SendNUIMessage({
                direction = math.floor(calcHeading(-GetEntityHeading(player) % 360)),
            })

			if sleeping then
				if IsControlJustReleased(0,38) then
					sleeping = false
					DetachEntity(PlayerPedId(), 1, true)
				end
			end
        else
            Citizen.Wait(1000)
        end
    end
end)

-- Map stuff below
local x = -0.025
local y = -0.015
local w = 0.16
local h = 0.25


RegisterCommand("togglehud", function()  
	SendNUIMessage({action = "toggle_hud"})
end, false)


Citizen.CreateThread(function()

    while true do

        Citizen.Wait(500)
        local player = PlayerPedId()

        if (IsPedInAnyVehicle(player, false)) then

            local veh = GetVehiclePedIsIn(player,false)

            if GetPedInVehicleSeat(veh, -1) == player then

                if not DivingStatus then


                    if updateLatestVehicle ~= veh then
                        if not DecorExistOn(veh, "GetVehicleCurrentFuel") then
                            Fuel = math.random(80,100)
                        else
                            Fuel = DecorGetInt(veh, "GetVehicleCurrentFuel")
                        end
                    else
                        Fuel = DecorGetInt(veh, "GetVehicleCurrentFuel")
                    end

                    DivingStatus = true
                    updateLatestVehicle = veh
                    setLastUpdate = 0

                    if not DecorExistOn(veh, "GetVehicleCurrentFuel") then 
                        Fuel = math.random(80,100)
                        DecorSetInt(veh, "GetVehicleCurrentFuel", round(Fuel))
                    end

                else

                    if Fuel > 105 then
                        Fuel = DecorGetInt(veh, "GetVehicleCurrentFuel")
                    end                     
                    if Fuel == 101 then
                        Fuel = DecorGetInt(veh, "GetVehicleCurrentFuel")
                    end

                end

                if ( setLastUpdate > 300) then
                    DecorSetInt(veh, "GetVehicleCurrentFuel", round(Fuel))
                    lasteupdate = 0
                end

                setLastUpdate = setLastUpdate + 1

                if Fuel > 0 then
                    if IsVehicleEngineOn(veh) then
                        local fueltankhealth = GetVehiclePetrolTankHealth(veh)
                        if fueltankhealth == 1000.0 then
                            SetVehiclePetrolTankHealth(veh, 4000.0)
                        end
                        local fuelMath = GetEntitySpeed(GetVehiclePedIsIn(player, false)) * 3.6
                        if fuelMath > 30 then
                            fuelMath = fuelMath * 1.8
                        else
                            fuelMath = fuelMath / 2.0
                        end
                        fuelMath = fuelMath / 15000

                        if fuelMath == 0 then
                            fuelMath = 0.0001
                        end
                        if IsPedInAnyBoat(PlayerPedId()) then
                            fuelMath = 0.0090
                        end
                        local missingTankHealth = (4000 - fueltankhealth) / 1000

                        if missingTankHealth > 1 then
                            missingTankHealth = missingTankHealth * (missingTankHealth * missingTankHealth * 12)
                        end

                        local factorFuel = (fuelMath + 1 / 5000) * (missingTankHealth+1)
                        Fuel = Fuel - factorFuel
                    end
                end

                if Fuel <= 4 and Fuel > 0 then
                    if not IsThisModelABike(GetEntityModel(veh)) then
                        local decayChance = math.random(20,100)
                        if decayChance > 90 then
                            SetVehicleEngineOn(veh,0,0,1)
                            SetVehicleUndriveable(veh,true)
                            Citizen.Wait(100)
                            SetVehicleEngineOn(veh,1,0,1)
                            SetVehicleUndriveable(veh,false)
                        end
                    end
                end

                if Fuel < 15 then
                end

                if Fuel < 1 then
                    if Fuel ~= 0 then
                        Fuel = 0
                        DecorSetInt(veh, "GetVehicleCurrentFuel", round(Fuel))
                    end

                    if IsVehicleEngineOn(veh) or IsThisModelAHeli(GetEntityModel(veh)) then
                        SetVehicleEngineOn(veh,0,0,1)
                        SetVehicleUndriveable(veh,false)
                    end
                end
            end
        else
            if DivingStatus then
                DivingStatus = false
                DecorSetInt(updateLatestVehicle, "GetVehicleCurrentFuel", round(Fuel))
            end
            Citizen.Wait(1500)
        end
    end
end)


RegisterNetEvent('plutorp-gas:checkpump')
AddEventHandler('plutorp-gas:checkpump', function()
    local ped = PlayerPedId()
	local vehicle = GetPlayersLastVehicle()
	local vehicleCoords = GetEntityCoords(vehicle)
    local veh = getVehicleClosestToMe()

    TriggerEvent('customNotification', "Make sure you are facing the vehicle!") 
    TaskTurnPedToFaceEntity(ped, vehicle, 1000)
    Wait(1600)
    if DoesEntityExist(veh) and IsEntityAVehicle(veh) and #(GetEntityCoords(veh) - GetEntityCoords(PlayerPedId())) < 5.0 then
        vehicleCurrentFuel = DecorGetInt(veh, "GetVehicleCurrentFuel")
        costs = (100 - vehicleCurrentFuel)
        if costs < 0 then
            costs = 0
        end
        if vehicleCurrentFuel >= 100 then
            PlaySound(-1, "5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
            TriggerEvent('customNotification', "You are already full!") 
        else
            costs = math.ceil(costs)
            TriggerServerEvent("carfill:checkmoney", costs)
        end
    end
    Citizen.Wait(1)
end)

local imageWidth = 100 -- leave this variable, related to pixel size of the directions
local containerWidth = 100 -- width of the image container
local width =  0;
local south = (-imageWidth) + width
local west = (-imageWidth * 2) + width
local north = (-imageWidth * 3) + width
local east = (-imageWidth * 4) + width
local south2 = (-imageWidth * 5) + width

function calcHeading(direction)
    if (direction < 90) then
        return lerp(north, east, direction / 90)
    elseif (direction < 180) then
        return lerp(east, south2, rangePercent(90, 180, direction))
    elseif (direction < 270) then
        return lerp(south, west, rangePercent(180, 270, direction))
    elseif (direction <= 360) then
        return lerp(west, north, rangePercent(270, 360, direction))
    end
end

function rangePercent(min, max, amt)
    return (((amt - min) * 100) / (max - min)) / 100
end

function lerp(min, max, amt)
    return (1 - amt) * min + amt * max
end

function IsCar(veh)
  local vc = GetVehicleClass(veh)
  return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end	

function Fwv(entity)
  local hr = GetEntityHeading(entity) + 90.0
  if hr < 0.0 then hr = 360.0 + hr end
  hr = hr * 0.0174533
  return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

RegisterNetEvent('hud:saveCurrentMeta')
AddEventHandler('hud:saveCurrentMeta', function()
	TriggerServerEvent("police:update:hud",GetEntityHealth(PlayerPedId()),GetPedArmour(PlayerPedId()),currentValues["thirst"],currentValues["hunger"],currentValues["armor"])
end)

Citizen.CreateThread(function()
    while true do
    	if currentValues["hunger"] > 0 then
    		currentValues["hunger"] = currentValues["hunger"] - math.random(3)
    	end
	    if currentValues["thirst"] > 0 then
    		currentValues["thirst"] = currentValues["thirst"] - 3
    	end	

		Citizen.Wait(300000)
    	TriggerServerEvent("police:update:hud",GetEntityHealth(PlayerPedId()),GetPedArmour(PlayerPedId()),currentValues["thirst"],currentValues["hunger"])
		
		if currentValues["thirst"] < 20 or currentValues["hunger"] < 20 then


			local newhealth = GetEntityHealth(PlayerPedId()) - math.random(10)
			SetEntityHealth(PlayerPedId(), newhealth)
			
		end
	end
end)


Citizen.CreateThread( function()

	local resetcounter = 0
	local jumpDisabled = false
  	
  	while true do 
    Citizen.Wait(100)
		if jumpDisabled and resetcounter > 0 and IsPedJumping(PlayerPedId()) then
			
			SetPedToRagdoll(PlayerPedId(), 1000, 1000, 3, 0, 0, 0)

			resetcounter = 0
		end

		if not jumpDisabled and IsPedJumping(PlayerPedId()) then

			jumpDisabled = true
			resetcounter = 10
			Citizen.Wait(1200)
		end

		if resetcounter > 0 then
			resetcounter = resetcounter - 1
		else
			if jumpDisabled then
				resetcounter = 0
				jumpDisabled = false
			end
		end
	end
end)





Citizen.CreateThread( function()
	while true do 

		local ply = PlayerPedId()

		if IsPedArmed(ply, 6) then Wait(0)
		else Wait(1500) end

		local _,wep = GetCurrentPedWeapon(ply)

	    if wep ~= `WEAPON_SNOWBALL` and IsPedShooting(ply) then
	    	local GamePlayCam = GetFollowPedCamViewMode()
	    	local Vehicled = IsPedInAnyVehicle(ply, false)
	    	local MovementSpeed = math.ceil(GetEntitySpeed(ply))

	    	if MovementSpeed > 69 then
	    		MovementSpeed = 69
	    	end

	        local group = GetWeapontypeGroup(wep)

	        local p = GetGameplayCamRelativePitch()

	        local cameraDistance = #(GetGameplayCamCoord() - GetEntityCoords(ply))

	        local recoil = math.random(50,75+(math.ceil(MovementSpeed*1.5)))/100
	        local rifle = false


          	if group == 970310034 or group == 1159398588 then
          		rifle = true
          	end

          	if cameraDistance < 5.3 then
          		cameraDistance = 1.5
          	else
          		if cameraDistance < 8.0 then
          			cameraDistance = 4.0
          		else
          			cameraDistance = 7.0
          		end
          	end


	        if Vehicled then
	        	recoil = recoil + (recoil + cameraDistance)
	        else
	        	recoil = recoil * 1.0
	        end

	        if GamePlayCam == 4 then

	        	recoil = recoil * 0.35
		        if rifle then
					recoil = recoil * 0.15
				else
					recoil = recoil * 0.05
		        end

	        end

	        if rifle then
	        	recoil = recoil * 0.15
	        end

	        local rightleft = math.random(4)
	        local h = GetGameplayCamRelativeHeading()
	        local hf = math.random(10,40+MovementSpeed)/100

	        if Vehicled then
	        	hf = hf * 2.0
	        end


	        if rightleft == 1 then
	        	SetGameplayCamRelativeHeading(h+hf)
	        elseif rightleft == 2 then
	        	SetGameplayCamRelativeHeading(h-hf)
	        end 
		

	        local set = p+recoil

			SetGameplayCamRelativePitch(set,0.8)    
	       	
	    end
	end

end)


local crouched = false
exports["plutorp-keymapping"]:registerKeyMapping("Crouch", "Player", "Toggle Crouch", "+Crouch", "-Crouch", "LCONTROL", true)
RegisterCommand("+Crouch", function()
    local ped = PlayerPedId()

    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        DisableControlAction(0, 36, true) -- INPUT_DUCK  

        if (not IsPauseMenuActive()) then 
            RequestAnimSet("move_ped_crouched")

            while (not HasAnimSetLoaded("move_ped_crouched")) do 
                Citizen.Wait(100)
            end 

            if crouched then 
                TriggerEvent("AnimSet:Set")
                crouched = false 
            else
                SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
                crouched = true 
            end 
        end 
    end 
end, false)


RegisterNetEvent('lowerthirst')
AddEventHandler('lowerthirst', function()
    
    currentValues["thirst"] = currentValues["thirst"] - 1

    if currentValues["thirst"] < 0 then
        currentValues["thirst"] = 0
    end

    if currentValues["thirst"] > 100 then
        currentValues["thirst"] = 100
    end

end)

RegisterNetEvent('changethirst')
AddEventHandler('changethirst', function()
    
    currentValues["thirst"] = currentValues["thirst"] + 25

    if currentValues["thirst"] < 0 then
        currentValues["thirst"] = 0
    end

    if currentValues["thirst"] > 100 then
        currentValues["thirst"] = 100
    end

end)

RegisterNetEvent('coffee:drink')
AddEventHandler('coffee:drink', function()
	
	currentValues["thirst"] = currentValues["thirst"] + 45

	if currentValues["thirst"] < 0 then
		currentValues["thirst"] = 0
	end

	if currentValues["thirst"] > 100 then
		currentValues["thirst"] = 100
	end
	
end)

RegisterNetEvent('coffee:drink2')
AddEventHandler('coffee:drink2', function()
	
	currentValues["thirst"] = currentValues["thirst"] + 25

	if currentValues["thirst"] < 0 then
		currentValues["thirst"] = 0
	end

	if currentValues["thirst"] > 100 then
		currentValues["thirst"] = 100
	end
	
end)


RegisterNetEvent('changehunger')
AddEventHandler('changehunger', function()
	

	currentValues["hunger"] = currentValues["hunger"] + 25

	if currentValues["hunger"] < 0 then
		currentValues["hunger"] = 0
	end

	if currentValues["hunger"] > 100 then
		currentValues["hunger"] = 100
	end

end)

RegisterCommand("-crouch", function() end, false)
local lastDamageTrigger = 0

RegisterNetEvent("fire:damageUser")
AddEventHandler("fire:damageUser", function(Reqeuester)
	if not DoesPlayerExist(Reqeuester) then return end

	local attacker = GetPlayerFromServerId(Reqeuester)
	local Attackerped = GetPlayerPed(attacker)

	if IsPedShooting(Attackerped) then
		local name = GetSelectedPedWeapon(Attackerped)
        if name == `WEAPON_FIREEXTINGUISHER` and not exports["plutorp_manager"]:isPed("dead") then
        	lastDamageTrigger = GetGameTimer()
        	currentValues["oxy"] = currentValues["oxy"] - 15
        end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(1)
		if currentValues["oxy"] > 0 and IsPedSwimmingUnderWater(PlayerPedId()) then
			SetPedDiesInWater(PlayerPedId(), false)
			if currentValues["oxy"] > 25.0 then
				currentValues["oxy"] = currentValues["oxy"] - 0.0003125
			else
				currentValues["oxy"] = currentValues["oxy"] - 1
			end
		else
			if IsPedSwimmingUnderWater(PlayerPedId()) then
				currentValues["oxy"] = currentValues["oxy"] - 0.01
				SetPedDiesInWater(PlayerPedId(), true)
			end
		end

		if not IsPedSwimmingUnderWater( PlayerPedId() ) and currentValues["oxy"] < 25.0 then
			if GetGameTimer() - lastDamageTrigger > 3000 then
				currentValues["oxy"] = currentValues["oxy"] + 1
				if currentValues["oxy"] > 25.0 then
					currentValues["oxy"] = 25.0
				end
			else
				if currentValues["oxy"] <= 0 then
					
					if exports["plutorp_manager"]:isPed("dead") then
						lastDamageTrigger = -7000
						currentValues["oxy"] = 25.0
					else
						SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 20)
					end
				end
			end
		end

		if currentValues["oxy"] > 25.0 and not oxyOn then
			oxyOn = true
			attachProp("p_s_scuba_tank_s", 24818, -0.25, -0.25, 0.0, 180.0, 90.0, 0.0)
			attachProp2("p_s_scuba_mask_s", 12844, 0.0, 0.0, 0.0, 180.0, 90.0, 0.0)
		elseif oxyOn and currentValues["oxy"] <= 25.0 then
			oxyOn = false
			removeAttachedProp()
			removeAttachedProp2()
		end
		if not oxyOn then
			Wait(1000)
    	end

	end
end)


RegisterNetEvent('client:anchor')
AddEventHandler('client:anchor', function()
    local currVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currVeh ~= 0 then
        local vehModel = GetEntityModel(currVeh)
        if vehModel ~= nil and vehModel ~= 0 then
            if DoesEntityExist(currVeh) then
                if IsThisModelABoat(vehModel) or IsThisModelAJetski(vehModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel) then
                	local finished = exports["plutorp-taskbar"]:taskBar(2000,"Toggling Anchor")
					if (finished ~= 100) then
					    return
					end
                    if IsBoatAnchoredAndFrozen(currVeh) then
                    	TriggerEvent("customNotification","Anchor Disabled")
                        SetBoatAnchor(currVeh, false)
                        SetBoatFrozenWhenAnchored(currVeh, false)
                        SetForcedBoatLocationWhenAnchored(currVeh, false)
                    elseif not IsBoatAnchoredAndFrozen(currVeh) and CanAnchorBoatHere(currVeh) and GetEntitySpeed(currVeh) < 3 then
                    	SetEntityAsMissionEntity(currVeh,false,true)
                    	TriggerEvent("customNotification","Anchor Enabled")
                        SetBoatAnchor(currVeh, true)
                        SetBoatFrozenWhenAnchored(currVeh, true)
                        SetForcedBoatLocationWhenAnchored(currVeh, true)
                    end
                end
            end
        end
    end
end)


local lastping = 0
local blipgps = {}
RegisterNetEvent('GPSTrack:Accepted')
AddEventHandler('GPSTrack:Accepted', function(x,y,z,srcid,stage)

	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == "police" or job == "ems" or job == "auto_exotics" or job == "tuner_shop" or job == "harmony_autos" or job == "hayes_autos" then
		if blipgps.srcid then
			RemoveBlip(blipgps.srcid)
		end
		blipgps.srcid = AddBlipForCoord(x,y,z) 
	    SetBlipColour(blipgps.srcid,1)
		SetBlipSprite(blipgps.srcid, 459)
		SetBlipColour(blipgps.srcid, 8)
		SetBlipScale(blipgps.srcid, 1.5)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Help Call")
		EndTextCommandSetBlipName(blipgps.srcid)
		Citizen.Wait(55000)
		RemoveBlip(blipgps.srcid)
	end
end)

RegisterNetEvent('GPSTrack:Create')
AddEventHandler('GPSTrack:Create', function()

	if lastping == 0 then
		lastping = 1
		x,y,z = GPSTrack(1)
		TriggerServerEvent("GPSTrack:Accepted",x,y,z,1)
		Citizen.Wait(60000)
		x,y,z = GPSTrack(2)
		TriggerServerEvent("GPSTrack:Accepted",x,y,z,2)
		Citizen.Wait(60000)
		x,y,z = GPSTrack(3)
		TriggerServerEvent("GPSTrack:Accepted",x,y,z,3)
		Citizen.Wait(120000)
		lastping = 0
	end

end)


function GPSTrack(stage)
	local multi = 50
	if stage == 1 then
		multi = 110
	elseif stage == 2 then
		multi = 55
	else
		multi = 5
	end
	local luck = math.random(2)
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, math.random(multi) + 0.0, 0.0))
	if luck == 1 then
		x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), math.random(multi) + 0.0, 0.0, 0.0))
	end
	return x,y,z
end


function loadAnim( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterCommand("roll", function(source, args)
	if args[1] and args[2] then
		TriggerEvent("roll", args[1], args[2])
	else
		TriggerEvent("DoLongHudText", "You need to do /roll 1 2", 2)
	end

end)

RegisterNetEvent("roll")
AddEventHandler("roll",function(times,weight)
	local Coords = GetEntityCoords(PlayerPedId())
	times = tonumber(times)
	weight = tonumber(weight)
	rollAnim()
	local strg = ""
	for i = 1, times do
		if i == 1 then
			strg = strg .. " " .. math.random(weight) .. "/" .. weight
		else
			strg = strg .. " | " .. math.random(weight) .. "/" .. weight
		end
		
	end
	TriggerServerEvent("actionclose", "Dice rolled " .. strg, Coords)
end)

function rollAnim()
    loadAnimDict( "anim@mp_player_intcelebrationmale@wank" ) 
    Citizen.Wait(500)
    TaskPlayAnim( PlayerPedId(), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Citizen.Wait(1500)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'dice', 0.1)
    ClearPedTasks(PlayerPedId())
    Citizen.Wait(500)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end


local recoils = {


	-- pistols
	[416676503] = 0.34,

	--smg
	[-957766203] = 0.22,

	-- rifles
	[970310034] = 0.14,

}


local myRecoilFactor = 0.0
RegisterNetEvent("recoil:updateposition")
AddEventHandler("recoil:updateposition", function(sendFactor)
    myRecoilFactor = sendFactor / 5 + 0.0
end)


currentValues["hunger"] = 100
currentValues["thirst"] = 100

hunger = "Full"
thirst = "Sustained"
local cruise = {enabled = false, speed = 0, airTime = 0}



function getVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		
		offset = offset - 1

		if vehicle ~= 0 then break end
	end
	
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	
	if distance > 3000 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function canCruise(get_ped_veh)
	local ped = PlayerPedId()
	if not IsPedSittingInAnyVehicle(ped) then
		return false
	end
	if IsPedInAnyBoat(ped) or IsPedInAnySub(ped) or IsPedInAnyHeli(ped) or IsPedInAnyPlane(ped) or IsPedInFlyingVehicle(ped) then
		return false
	end
	if IsThisModelABicycle(GetEntityModel(get_ped_veh)) then
		return false
	end
	if IsVehicleSirenOn(get_ped_veh) or IsPedJumpingOutOfVehicle(ped) or IsVehicleStopped(ped) then
		return false
	end
	if GetEntitySpeedVector(get_ped_veh, true).y < 1 or GetEntitySpeed(get_ped_veh) * 3.6 < 40 then
		return false
	end

	return true
end

function EnableCruise(get_ped_veh)
	cruise.airTime = 0
	cruise.enabled = true
	cruise.speed = GetEntitySpeed(get_ped_veh)
	TriggerEvent("DoLongHudText",'Cruise Activated',11)
end

function DisableCruise(showMsg)
	cruise.airTime = 0
	cruise.enabled = false
	if showMsg then
		TriggerEvent("DoLongHudText",'Cruise Deactivated',11)	
	end
end


oxyOn = false
attachedProp = 0
attachedProp2 = 0

function removeAttachedProp2()
	DeleteEntity(attachedProp2)
	attachedProp2 = 0
end

function removeAttachedProp()
	DeleteEntity(attachedProp)
	attachedProp = 0
end

function attachProp2(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)
	removeAttachedProp2()
	attachModel = GetHashKey(attachModelSent)
	boneNumber = boneNumberSent
	local bone = GetPedBoneIndex(PlayerPedId(), boneNumberSent)
	--local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Citizen.Wait(100)
	end
	attachedProp2 = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
	exports["plutorp_manager"]:GlobalObject(attachedProp2)
	AttachEntityToEntity(attachedProp2, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
	SetModelAsNoLongerNeeded(attachModel)
end


function attachProp(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)
	removeAttachedProp()
	attachModel = GetHashKey(attachModelSent)
	boneNumber = boneNumberSent 
	local bone = GetPedBoneIndex(PlayerPedId(), boneNumberSent)
	--local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Citizen.Wait(100)
	end
	attachedProp = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
	exports["plutorp_manager"]:GlobalObject(attachedProp)
	AttachEntityToEntity(attachedProp, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
	SetModelAsNoLongerNeeded(attachModel)
end

RegisterNetEvent("OxyMenu")
AddEventHandler("OxyMenu",function()
	if currentValues["oxy"] > 25.0 then
		--RemoveOxyTank
		TriggerEvent('sendToGui','Remove Oxy Tank','RemoveOxyTank')
	end
end)

RegisterNetEvent("RemoveOxyTank")
AddEventHandler("RemoveOxyTank",function()
	if currentValues["oxy"] > 25.0 then
		currentValues["oxy"] = 25.0
		TriggerEvent('menu:hasOxygenTank', false)
	end
end)

RegisterNetEvent("UseOxygenTank")
AddEventHandler("UseOxygenTank",function()
	currentValues["oxy"] = 200.0
	TriggerEvent('menu:hasOxygenTank', true)
end)

dstamina = 0
RegisterNetEvent("client:updateStress")
AddEventHandler("client:updateStress",function(newStress)
	stresslevel = newStress
end)


local beds = {
	2117668672,
	1631638868,
	-1787305376,
	666470117,
	-1182962909,
	-1519439119, -- operation
	-289946279, -- mri
	-1091386327,
}



RegisterNetEvent("client:bed")
AddEventHandler("client:bed",function()
--v_med_bed1=1631638868
--v_med_bed2=2117668672
	local ped = PlayerPedId()
	lastPlayerPos = GetEntityCoords(PlayerPedId())

	local objFound = nil
	local near = 999
	for i=1, #beds do
		
		local curobjFound = GetClosestObjectOfType(lastPlayerPos, 3.0, beds[i], 0, 0, 0)
		if curobjFound ~= 0 then
			local dist = #(GetEntityCoords(curobjFound) - GetEntityCoords(ped))

			if DoesEntityExist(curobjFound) then
				if dist ~= 0 and dist < near then
					near = dist 
					objFound = curobjFound
				end
			end
		end
	end

	if DoesEntityExist(objFound) then
		TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Press [E] to leave the Bed !"))
	    loadAnimDict( "missfinale_c1@" ) 
	    Citizen.Wait(500)

	    sleeping = true

		local bedOffset = vector3(-0.2, -0.2, 1.4)
		if GetEntityModel(objFound) == -289946279 or GetEntityModel(objFound) == -1519439119 then
			TaskPlayAnim( ped, "anim@gangops@morgue@table@", "body_search", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
			bedOffset = vector3(0, 0.05, 2)
		else
			TaskPlayAnim( ped, "missfinale_c1@", "lying_dead_player0", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
		end

	    while sleeping do
	    	AttachEntityToEntity(ped, objFound, 1, bedOffset.x, bedOffset.y, bedOffset.z, 0.0, 0.0, 180.0, true, true, true, true, 1, true)
	    	camOn()
	    	Citizen.Wait(1)
	    	SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(objFound, 0.0, -0.8, bedOffset.z + 0.1))
	    	SetCamRot(cam, -30.0, 0.0, GetEntityHeading(objFound))
		end
		
		local counter = 0	
	    SetEntityHeading(GetEntityHeading(PlayerPedId()-90))
	    TriggerEvent("animation:PlayAnimation","getup")
	    local count=0
	    while counter < 400 do
	    	counter = counter + 1
	    	
	    	if counter > 250 then
	    		count = count + 0.004
	    		AttachEntityToEntity(ped, objFound, 1, bedOffset.x+count, bedOffset.y, bedOffset.z / 2.0, 0.0, 0.0, -90.0, false, false, false, false, 0, false)
	    	else
	    		AttachEntityToEntity(ped, objFound, 1, bedOffset.x, bedOffset.y, bedOffset.z / 2.0, 0.0, 0.0, -90.0, false, false, false, false, 0, false)
	    	end
	    	Citizen.Wait(1)
	    end

	    
	    camOff()
	    DetachEntity(PlayerPedId(), 1, true)
		TriggerEvent('plutorp-textui:HideUI')

	    

    end
    
end)

function camOn()
	if(not DoesCamExist(cam)) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

		
		SetCamActive(cam,  true)

		RenderScriptCams(true,  false,  0,  true,  true)
		
	end	
end

function camOff()
	RenderScriptCams(false, false, 0, 1, 0)
	DestroyCam(cam, false)
end


local stressDisabled = false
RegisterNetEvent("client:disableStress")
AddEventHandler("client:disableStress",function(stressNew)
	stressDisabled = stressNew
end)


RegisterNetEvent("client:newStress")
AddEventHandler("client:newStress",function(positive, alteredValue, notify)
	if stressDisabled then
		return
	end
	if notify then
		if positive then
			TriggerEvent("DoShortHudText",'Stress Gained',6)
		else
			TriggerEvent("DoShortHudText",'Stress Relieved',6)
		end
	end
	
	TriggerServerEvent("server:alterStress",positive,alteredValue)
end)


RegisterNetEvent("stress:timed")
AddEventHandler("stress:timed",function(alteredValue,scenario)
	local removedStress = 0
	Wait(1000)

	TriggerEvent("DoShortHudText",'Stress is being relieved',6)
	SetPlayerMaxArmour(PlayerId(), 30 )
	while true do
		removedStress = removedStress + 100
		if removedStress >= alteredValue then
			break
		end
        local armor = GetPedArmour(PlayerPedId())
        SetPedArmour(PlayerPedId(),armor+3)
		if scenario ~= "None" then
			if not IsPedUsingScenario(PlayerPedId(),scenario) then
				TriggerEvent("animation:cancel")
				break
			end
		end
		Citizen.Wait(1000)
	end
	TriggerServerEvent("server:alterStress",false,removedStress)
end)

RegisterNetEvent("stress:timed2")
AddEventHandler("stress:timed2",function(alteredValue,scenario)
	local removedStress = 0
	Wait(1000)

	TriggerEvent("DoShortHudText",'Stress is being relieved',6)
	SetPlayerMaxArmour(PlayerId(), 60 )
	while true do
		removedStress = removedStress + 100
		if removedStress >= alteredValue then
			break
		end
        local armor = GetPedArmour(PlayerPedId())
        SetPedArmour(PlayerPedId(),armor+3)
		if scenario ~= "None" then
			if not IsPedUsingScenario(PlayerPedId(),scenario) then
				TriggerEvent("animation:cancel")
				break
			end
		end
		Citizen.Wait(1000)
	end
	TriggerServerEvent("server:alterStress",false,removedStress)
end)


RegisterNetEvent("plutorp-adminmenu:currentDevmode")
AddEventHandler("plutorp-adminmenu:currentDevmode", function(devmode)
    isBlocked = devmode
end)

Citizen.CreateThread(function()
    while true do
        if not isBlocked then
            if stresslevel > 7500 then
                ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.12)
            elseif stresslevel > 4500 then
                ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.08)
            elseif stresslevel > 2000 then
                ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.03)
            end
        end 
        Citizen.Wait(2000)
    end
end)

currentValues["oxy"] = 25.0
stresslevel = 0

RegisterNetEvent("police:setClientMeta")
AddEventHandler("police:setClientMeta",function(meta)
	if meta == nil then return end
	if meta.thirst == nil then currentValues["thirst"] = 100 else currentValues["thirst"] = meta.thirst end
	if meta.hunger == nil then currentValues["hunger"] = 100 else currentValues["hunger"] = meta.hunger end
	if meta.health == nil then
		return
	end

	if meta.health < 10.0 then
		SetEntityHealth(PlayerPedId(),10.0)
	else
		SetEntityHealth(PlayerPedId(),meta.health)
	end

	
	SetPlayerMaxArmour(PlayerPedId(), 60 )
	SetPedArmour(PlayerPedId(),meta.armour)
end)

RegisterNetEvent("plutorp-adminmenu:currentDevmode")
AddEventHandler("plutorp-adminmenu:currentDevmode", function(devmode)
    currentValues["devmode"] = devmode
end)

RegisterNetEvent("plutorp-adminmenu:currentDebug")
AddEventHandler("plutorp-adminmenu:currentDebug", function(debugToggle)
    currentValues["devdebug"] = debugToggle
end)



exports("setFuel", function(veh, amt)
	DecorSetInt(veh, "GetVehicleCurrentFuel", amt)
end)