----------------------
------ COMMANDS ------
----------------------

RegisterCommand("extra", function(source, args, rawCommand)
	if exports["plutorp_manager"]:isPed("myjob") == "police" then
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped, false)
		local extraID = tonumber(args[1])
		local extra = args[1]
		local toggle = tostring(args[2])
		for k,v in pairs(Config.PoliceGarage) do 
			if IsPedInAnyVehicle(ped, true) then
				local veh = GetVehiclePedIsIn(ped, false)
				if GetDistanceBetweenCoords(GetEntityCoords(ped), v[1], v[2], v[3], true) <= Config.Distance then
					if toggle == "true" then
						toggle = 0
					end
					if veh ~= nil and veh ~= 0 and veh ~= 1 then
						TriggerEvent('DoLongHudText', 'Extra Toggled', 1)
				
						if extra == "all" then
							SetVehicleExtra(veh, 1, toggle)
							SetVehicleExtra(veh, 2, toggle)
							SetVehicleExtra(veh, 3, toggle)
							SetVehicleExtra(veh, 4, toggle)
							SetVehicleExtra(veh, 5, toggle)       
							SetVehicleExtra(veh, 6, toggle)
							SetVehicleExtra(veh, 7, toggle)
							SetVehicleExtra(veh, 8, toggle)
							SetVehicleExtra(veh, 9, toggle)               
							SetVehicleExtra(veh, 10, toggle)
							SetVehicleExtra(veh, 11, toggle)
							SetVehicleExtra(veh, 12, toggle)
							SetVehicleExtra(veh, 13, toggle)
							SetVehicleExtra(veh, 14, toggle)
							SetVehicleExtra(veh, 15, toggle)
							SetVehicleExtra(veh, 16, toggle)
							SetVehicleExtra(veh, 17, toggle)
							SetVehicleExtra(veh, 18, toggle)
							SetVehicleExtra(veh, 19, toggle)
							SetVehicleExtra(veh, 20, toggle)
						TriggerEvent('DoLongHudText', 'Extra All Toggled', 1)
						elseif extraID == extraID then
							SetVehicleExtra(veh, extraID, toggle)
						end
					end
				end
			end
		end
	elseif exports["plutorp_manager"]:isPed("myjob") == "ems" then
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped, false)
		local extraID = tonumber(args[1])
		local extra = args[1]
		local toggle = tostring(args[2])
		for k,v in pairs(Config.EMSGarage) do 
			if IsPedInAnyVehicle(ped, true) then
				local veh = GetVehiclePedIsIn(ped, false)
				if GetDistanceBetweenCoords(GetEntityCoords(ped), v[1], v[2], v[3], true) <= Config.Distance then
					if toggle == "true" then
						toggle = 0
					end
				end
				if veh ~= nil and veh ~= 0 and veh ~= 1 then
					TriggerEvent('DoLongHudText', 'Extra Toggled', 1)
					
					if extra == "all" then
						SetVehicleExtra(veh, 1, toggle)
						SetVehicleExtra(veh, 2, toggle)
						SetVehicleExtra(veh, 3, toggle)
						SetVehicleExtra(veh, 4, toggle)
						SetVehicleExtra(veh, 5, toggle)       
						SetVehicleExtra(veh, 6, toggle)
						SetVehicleExtra(veh, 7, toggle)
						SetVehicleExtra(veh, 8, toggle)
						SetVehicleExtra(veh, 9, toggle)               
						SetVehicleExtra(veh, 10, toggle)
						SetVehicleExtra(veh, 11, toggle)
						SetVehicleExtra(veh, 12, toggle)
						SetVehicleExtra(veh, 13, toggle)
						SetVehicleExtra(veh, 14, toggle)
						SetVehicleExtra(veh, 15, toggle)
						SetVehicleExtra(veh, 16, toggle)
						SetVehicleExtra(veh, 17, toggle)
						SetVehicleExtra(veh, 18, toggle)
						SetVehicleExtra(veh, 19, toggle)
						SetVehicleExtra(veh, 20, toggle)
						TriggerEvent('DoLongHudText', 'Extra All Toggled', 1)
					elseif extraID == extraID then
						SetVehicleExtra(veh, extraID, toggle)
					end
					
				end
			end
		end
	end
end, false)


RegisterCommand('boat', function(source, args)
	if exports["plutorp_manager"]:isPed("myjob") == "police" then
      TriggerEvent('erp:spawnVehicle', 'predator')
	else
		TriggerEvent('DoLongHudText', 'You are not Police!', 1)
  end
end)

RegisterCommand('livery', function(source, args, raw)
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' and GetVehicleLiveryCount(vehicle) - 1 >= tonumber(args[1]) then
		SetVehicleLivery(vehicle, tonumber(args[1]))
		TriggerEvent('DoLongHudText', 'Livery Set', 1)
	else
		TriggerEvent('DoLongHudText', 'You are not a police officer!', 2)
	end
  end)

RegisterCommand("svlistuc", function(source, args, rawCommand)
	if exports["plutorp_manager"]:isPed("myjob") == "police" then
		TriggerEvent('chatMessagess', 'Undercover Vehicles:', 2, " \n [14] Galivanter Baller (UC) \n [15] Bravado Banshee (UC) \n [16] Bravado Buffalo (UC) \n [17] Pfister Comet (UC) \n [18] Invetero Coquette (UC) \n [19] Albany Primo (UC) \n [20] Declasse Rancher (UC) \n [21] Albany Washington (UC) ")
	end
end)


RegisterCommand("door", function(source, args, raw)
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)
	local Driver = GetPedInVehicleSeat(veh, -1)
	
	if args[1] ~= nil then
		door = tonumber(args[1]) - 1
	else
		door = nil
	end

	if door ~= nil then
		if DoesEntityExist(Driver) and IsPedInAnyVehicle(ped, false) then
			if GetVehicleDoorAngleRatio(veh, door) > 0 then
				SetVehicleDoorShut(veh, door, false)
			else	
				SetVehicleDoorOpen(veh, door, false, false)
			end
		end
	end
end)

RegisterCommand('seat', function(source, args)
	if args[1] ~= nil and tonumber(args[1]) >= 1 and tonumber(args[1]) <= 4 then
	  TriggerEvent('car:swapseat', tonumber(args[1]) - 2)
	end
end)


-----------------------
------ NETEVENTS ------
-----------------------

RegisterNetEvent('animation:impound')
AddEventHandler('animation:impound', function()
		inanimation = true
		local lPed = GetPlayerPed(-1)
		RequestAnimDict("amb@code_human_police_investigate@idle_a")
		while not HasAnimDictLoaded("amb@code_human_police_investigate@idle_a") do
			Citizen.Wait(0)
		end
		
		if IsEntityPlayingAnim(lPed, "amb@code_human_police_investigate@idle_a", "idle_b", 3) then
			ClearPedSecondaryTask(lPed)
		else
			TaskPlayAnim(lPed, "amb@code_human_police_investigate@idle_a", "idle_b", 8.0, -8, -1, 49, 0, 0, 0, 0)
			seccount = 4
			while seccount > 0 do
				Citizen.Wait(1000)
				seccount = seccount - 1
			end
			ClearPedSecondaryTask(lPed)
		end		
		inanimation = false
end)

RegisterNetEvent('PDSpawnVeh')
AddEventHandler('PDSpawnVeh', function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Police Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Crown Vic",
			txt = "",
			params = {
                event = "spawn:veh:pd",
				args = {
					vehicle = "polvic2"
				}
            }
        },
		{
            id = 3,
            header = "Tahoe",
			txt = "",
			params = {
                event = "spawn:veh:pd",
				args = {
					vehicle = "poltah"
				}
            }
        },
		{
            id = 4,
            header = "Charger",
			txt = "",
			params = {
                event = "spawn:veh:pd",
				args = {
					vehicle = "polchar"
				}
            }
        },
		{
            id = 5,
            header = "Raptor",
			txt = "",
			params = {
                event = "spawn:veh:pd",
				args = {
					vehicle = "polraptor"
				}
            }
        },
		{
            id = 6,
            header = "Taurus",
			txt = "",
			params = {
                event = "spawn:veh:pd",
				args = {
					vehicle = "poltaurus"
				}
            }
        },
		{
            id = 7,
            header = "Mustang",
			txt = "",
			params = {
                event = "spawn:veh:pd",
				args = {
					vehicle = "2015polstang"
				}
            }
        },
		{
            id = 8,
            header = "Close Menu",
			txt = "",
			params = {
                event = "",
            }
        },
    })
end)

RegisterNetEvent('EMSSpawnVeh')
AddEventHandler('EMSSpawnVeh', function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "EMS Garage",
            txt = ""
        },
        {
            id = 2,
            header = "2018 Vapid Speedo",
			txt = "Get In My Van!",
			params = {
                event = "spawn:veh:ems",
				args = {
					vehicle = "emsnspeedo"
				}
            }
        },
		{
            id = 3,
            header = "2014 Dodge Charger",
			txt = "Everyone's Favorite Car!",
			params = {
                event = "spawn:veh:ems",
				args = {
					vehicle = "emsc"
				}
            }
        },
		{
            id = 4,
            header = "2016 Ford F350",
			txt = "Big Boy/Girl Car!",
			params = {
                event = "spawn:veh:ems",
				args = {
					vehicle = "emsf"
				}
            }
        },
		{
            id = 5,
            header = "Coroner Van",
			txt = "Is it dead?",
			params = {
                event = "spawn:veh:ems",
				args = {
					vehicle = "emsv"
				}
            }
        },
		{
            id = 6,
            header = "Wheelchair",
			txt = "What happen to my legs?",
			params = {
                event = "spawn:veh:ems",
				args = {
					vehicle = "npwheelchair"
				}
            }
        },
    })
end)

RegisterNetEvent('spawn:veh:pd')
AddEventHandler('spawn:veh:pd', function(type)
	if exports["plutorp-inventory"]:hasEnoughOfItem('pdkeyfob',1,true) then 
	SpawnVehPD(type.vehicle)	
else
	TriggerEvent("DoLongHudText", "You do not have a Keyfob get one inside under the stairs!", 2)
	end
end)

RegisterNetEvent('spawn:veh:ems')
AddEventHandler('spawn:veh:ems', function(type)
	SpawnVehEMS(type.vehicle)	
end)

RegisterNetEvent('spawn:boat:pd')
AddEventHandler('spawn:boat:pd', function(type)
	SpawnVehBoat(type.vehicle)	
end)

RegisterNetEvent('spawn:boat:pd1')
AddEventHandler('spawn:boat:pd1', function(type)
	SpawnVehBoat(type.vehicle)	
end)

RegisterNetEvent('spawn:boat:pd2')
AddEventHandler('spawn:boat:pd2', function(type)
	SpawnVehBoat(type.vehicle)	
end)

RegisterNetEvent('spawn:boat:pd3')
AddEventHandler('spawn:boat:pd3', function(type)
	SpawnVehBoat(type.vehicle)	
end)

RegisterNetEvent("spawn:hei:pd")
AddEventHandler("spawn:hei:pd", function()
	Citizen.CreateThread(function()

        local hash = GetHashKey("maverick2")

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

		local spawnLocation = findClosestSpawnPointPD(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end

        local vehicle = CreateVehicle(hash, 449.53030395508, -981.98162841797, 43.691337585449, 5.8439383506775, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
		SetVehicleLivery(vehicle, tonumber(3))
    end)
end)


RegisterNetEvent("spawn:hei:ems")
AddEventHandler("spawn:hei:ems", function()
	Citizen.CreateThread(function()

        local hash = GetHashKey("emsair")

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

		local spawnLocation = findClosestSpawnPointPD(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end

        local vehicle = CreateVehicle(hash, 351.47665405273, -588.42498779297, 74.161720275879, 252.28114318848, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)    
    end)
end)

RegisterNetEvent("spawn:boat:pd")
AddEventHandler("spawn:boat:pd", function()
	Citizen.CreateThread(function()

        local hash = GetHashKey("predator")

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

		local spawnLocation = findClosestSpawnPointPD(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end

        local vehicle = CreateVehicle(hash, -786.59112548828, -1498.8815917969, -0.47412407398224, 105.11709594727, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)    
    end)
end)

RegisterNetEvent("spawn:boat:pd1")
AddEventHandler("spawn:boat:pd1", function()
	Citizen.CreateThread(function()

        local hash = GetHashKey("predator")

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

		local spawnLocation = findClosestSpawnPointPD(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end     

        local vehicle = CreateVehicle(hash, -1797.9619140625, -1233.4514160156, -1.9508646726608, 105.11709594727, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)    
    end)
end)

RegisterNetEvent("spawn:boat:pd2")
AddEventHandler("spawn:boat:pd2", function()
	Citizen.CreateThread(function()

        local hash = GetHashKey("predator")

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
		
		local spawnLocation = findClosestSpawnPointPD(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end     

        local vehicle = CreateVehicle(hash, -1599.5415039062, 5262.2924804688, -0.47477689385414, 105.11709594727, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)    
    end)
end)

RegisterNetEvent("spawn:boat:pd3")
AddEventHandler("spawn:boat:pd3", function()
	Citizen.CreateThread(function()

        local hash = GetHashKey("predator")

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
		
		local spawnLocation = findClosestSpawnPointPD(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end    

        local vehicle = CreateVehicle(hash, 1435.3171386719, 3828.220703125, 30.233352661133, 105.11709594727, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)    
    end)
end)




-----------------------
------ FUNCTIONS ------
-----------------------


function SpawnVehPD(name)
	Citizen.CreateThread(function()

        local hash = GetHashKey(name)

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

		local spawnLocation = findClosestSpawnPointPD(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end

        local vehicle = CreateVehicle(hash, 451.25408935547, -975.93743896484, 25.69979095459, 85.700180053711, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        applyMaxUpgrades(vehicle)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        if livery ~= nil then
            SetVehicleLivery(vehicle, tonumber(livery))
        end
    
    end)
end

function SpawnVehEMS(name)
	Citizen.CreateThread(function()

        local hash = GetHashKey(name)

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

		local spawnLocation = findClosestSpawnPointEMS(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end

        local vehicle = CreateVehicle(hash, 333.15982055664, -576.3837890625, 28.796867370605, 338.55960083008, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        if livery ~= nil then
            SetVehicleLivery(vehicle, tonumber(livery))
        end

    end)
end

function SpawnVehBoat(name)
	Citizen.CreateThread(function()

        local hash = GetHashKey(name)

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

		local spawnLocation = findClosestSpawnPointEMS(GetEntityCoords(PlayerPedId()))
		local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
		if DoesEntityExist(getVehicleInArea) then
		  TriggerEvent("DoLongHudText", "The area is crowded", 2)
		  return
		end

        local vehicle = CreateVehicle(hash, -786.59112548828, -1498.8815917969, -0.47412407398224, 105.11709594727, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        if livery ~= nil then
            SetVehicleLivery(vehicle, tonumber(livery))
        end

    end)
end

function applyMaxUpgrades(veh)
	SetVehicleModKit(veh, 0)
    SetVehicleMod(veh, 16, 4, false)
end

function findClosestSpawnPointPD(pCurrentPosition)
	local coords = vector3(451.25408935547, -975.93743896484, 25.69979095459)
	local closestDistance = -1
	local closestCoord = pCurrentPosition
	local distance = #(coords - pCurrentPosition)
	if closestDistance == -1 or closestDistance > distance then
	  closestDistance = distance
	  closestCoord = coords
	end
	return closestCoord
end

function findClosestSpawnPointEMS(pCurrentPosition)
	local coords = vector3(333.15982055664, -576.3837890625, 28.796867370605)
	local closestDistance = -1
	local closestCoord = pCurrentPosition
	local distance = #(coords - pCurrentPosition)
	if closestDistance == -1 or closestDistance > distance then
	  closestDistance = distance
	  closestCoord = coords
	end
	return closestCoord
end

function policeFix()
	local ped = GetPlayerPed(-1)
	for k,v in pairs(Config.PoliceGarage) do 
		if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsIn(ped, false)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), v[1], v[2], v[3], true) <= Config.Distance then
				TriggerEvent('DoLongHudText', 'Your vehicle is being repaired please wait', 1)
				local finished = exports["plutorp-taskbar"]:taskBar(5000, "Completing Task")
				if finished == 100 then
					TriggerEvent('DoLongHudText', 'Your vehicle has been repaired', 1)
					SetVehicleFixed(veh)
					SetVehicleDirtLevel(veh, 0.0)
					exports["plutorp-hud"]:SetFuel(veh, 100)
				end
			end
		end
	end
end

function EMSFix()
	local ped = GetPlayerPed(-1)
	for k,v in pairs(Config.EMSGarage) do 
		if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsIn(ped, false)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), v[1], v[2], v[3], true) <= Config.Distance then
				TriggerEvent('DoLongHudText', 'Your vehicle is being repaired please wait', 1)
				local finished = exports["plutorp-taskbar"]:taskBar(5000, "Completing Task")
				if finished == 100 then
					TriggerEvent('DoLongHudText', 'Your vehicle has been repaired', 1)
					SetVehicleFixed(veh)
					SetVehicleDirtLevel(veh, 0.0)
					exports["plutorp-hud"]:SetFuel(veh, 100)
				end
			end
		end
	end
end

function findClosestSpawnPointLegion(pCurrentPosition)
	local coords = vector3(111.53205108643, -1080.794921875, 28.585647583008)
	local closestDistance = -1
	local closestCoord = pCurrentPosition
	local distance = #(coords - pCurrentPosition)
	if closestDistance == -1 or closestDistance > distance then
	  closestDistance = distance
	  closestCoord = coords
	end
	return closestCoord
end

-- PD Spawn Cars

function SpawnPDVeh(name)
    Citizen.CreateThread(function()

        local hash = GetHashKey(name)
        math.random(1, 2)

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local spawnLocation = findClosestSpawnPointLegion(GetEntityCoords(PlayerPedId()))
        local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
        if DoesEntityExist(getVehicleInArea) then
          TriggerEvent("DoLongHudText", "The area is crowded", 2)
          return
        end

        local vehicle = CreateVehicle(hash, 452.53399658203, -976.42822265625, 25.699842453003, 85.599273681641, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end)
end

RegisterNetEvent('spawn:veh:police')
AddEventHandler('spawn:veh:police', function(type)
    SpawnPDVeh(type.vehicle)    
end)

RegisterNetEvent('spawn:vehiclemrpd')
AddEventHandler('spawn:vehiclemrpd', function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Police Garage",
            txt = ""
        },
        {
            id = 2,
            header = "cvpi",
			txt = "",
			params = {
                event = "spawn:veh:police",
				args = {
					vehicle = "npolvic"
				}
            }
        },
		{
            id = 3,
            header = "Close Menu",
			txt = "",
			params = {
                event = "",
            }
        },
    })
end)

-- car rental (legion)

function SpawnVehRental(name)
    Citizen.CreateThread(function()

        local hash = GetHashKey(name)
        math.random(1, 2)

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local spawnLocation = findClosestSpawnPointLegion(GetEntityCoords(PlayerPedId()))
        local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
        if DoesEntityExist(getVehicleInArea) then
          TriggerEvent("DoLongHudText", "The area is crowded", 2)
          return
        end

        local vehicle = CreateVehicle(hash, 111.53205108643, -1080.794921875, 28.585647583008, 339.21298217773, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end)
end

RegisterNetEvent('spawn:veh:rental')
AddEventHandler('spawn:veh:rental', function(type)
    SpawnVehRental(type.vehicle)    
    TriggerEvent("player:receiveItem","rentalpapers",1)
	TriggerServerEvent("takecashhomie1")
	TriggerEvent("DoLongHudText", "Vehicle Spawned", 1)
end)

RegisterNetEvent('spawn:veh:rental2')
AddEventHandler('spawn:veh:rental2', function(type)
    SpawnVehRental(type.vehicle)    
    TriggerEvent("player:receiveItem","rentalpapers",1)
	TriggerServerEvent("takecashhomie2")
	TriggerEvent("DoLongHudText", "Vehicle Spawned", 1)
end)

RegisterNetEvent('spawn:veh:rental3')
AddEventHandler('spawn:veh:rental3', function(type)
    SpawnVehRental(type.vehicle)    
    TriggerEvent("player:receiveItem","rentalpapers",1)
	TriggerServerEvent("takecashhomie3")
	TriggerEvent("DoLongHudText", "Vehicle Spawned", 1)
end)

RegisterNetEvent('spawn:veh:rental4')
AddEventHandler('spawn:veh:rental4', function(type)
    SpawnVehRental(type.vehicle)    
    TriggerEvent("player:receiveItem","rentalpapers",1)
	TriggerServerEvent("takecashhomie4")
	TriggerEvent("DoLongHudText", "Vehicle Spawned", 1)
end)

RegisterNetEvent('spawn:veh:rental5')
AddEventHandler('spawn:veh:rental5', function(type)
    SpawnVehRental(type.vehicle)    
    TriggerEvent("player:receiveItem","rentalpapers",1)
	TriggerServerEvent("takecashhomie5")
	TriggerEvent("DoLongHudText", "Vehicle Spawned", 1)
end)

RegisterNetEvent('spawn:veh:rental6')
AddEventHandler('spawn:veh:rental6', function(type)
    SpawnVehRental(type.vehicle)    
    TriggerEvent("player:receiveItem","rentalpapers",1)
	TriggerServerEvent("takecashhomie6")
	TriggerEvent("DoLongHudText", "Vehicle Spawned", 1)
end)

RegisterNetEvent('Vehicle:Rental')
AddEventHandler('Vehicle:Rental', function()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Rental Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Faggio",
            txt = "$150",
            params = {
                event = "spawn:veh:rental",
                args = {
                    vehicle = "faggio"
                }
            }
        },
        {
            id = 3,
            header = "Panto",
            txt = "$750",
            params = {
                event = "spawn:veh:rental3",
                args = {
                    vehicle = "panto"
                }
            }
        },
        {
            id = 4,
            header = "Sultan",
            txt = "$1,500",
            params = {
                event = "spawn:veh:rental4",
                args = {
                    vehicle = "sultan"
                }
            }
        },
		{
            id = 5,
            header = "Futo",
            txt = "$150",
            params = {
                event = "spawn:veh:rental2",
                args = {
                    vehicle = "futo"
                }
            }
        },
        {
            id = 6,
            header = "Scorcher Mountain Bike",
            txt = "$150",
            params = {
                event = "spawn:veh:rental5",
                args = {
                    vehicle = "scorcher"
                }
            }
        },
        {
            id = 7,
            header = "BMX",
            txt = "$150",
            params = {
                event = "spawn:veh:rental6",
                args = {
                    vehicle = "bmx"
                }
            }
        },
        {
            id = 8,
            header = "Close Menu",
            txt = "Exit the menu!",
            params = {
                event = "",
            }
        },
    })
end)