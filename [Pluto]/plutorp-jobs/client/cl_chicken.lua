local startX = 2388.725 
local startY = 5044.985
local startZ = 46.304

local converterX = -96.007   
local converterY = 6206.92
local converterZ = 31.02

local converterX2 = -100.64  
local converterY2 = 6202.30
local converterZ2 = 31.02

local packingX = -106.44 
local packingY = 6204.29
local packingZ = 31.02

local packingX2 = -104.20 
local packingY2 = 6206.45
local packingZ2 = 31.02

local sellX = -591.5437
local sellY = -892.665
local sellZ = 25.94248


local chicken1
local chicken2
local chicken3
local Zlapany1 = 0
local Zlapany2 = 0
local Zlapany3 = 0
local splashed = 0
local share = false
local prop
local packedintothecar = false
local carton
local meat
local packs = 0

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



Citizen.CreateThread(function()
local lapaniek = AddBlipForCoord(startX, startY, startZ)
    SetBlipSprite (lapaniek, 126)
    SetBlipDisplay(lapaniek, 4)
    SetBlipScale  (lapaniek, 0.5)
    SetBlipColour (lapaniek, 46)
    SetBlipAsShortRange(lapaniek, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Chicken Farm')
    EndTextCommandSetBlipName(lapaniek)
local rzeznia = AddBlipForCoord(converterX, converterY, converterZ)
    SetBlipSprite (rzeznia, 84)
    SetBlipDisplay(rzeznia, 4)
    SetBlipScale  (rzeznia, 0.5)
    SetBlipColour (rzeznia, 46)
    SetBlipAsShortRange(rzeznia, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Slaughterhouse')
    EndTextCommandSetBlipName(rzeznia)
local skupk = AddBlipForCoord(sellX, sellY, sellZ)
    SetBlipSprite (skupk, 478)
    SetBlipDisplay(skupk, 4)
    SetBlipScale  (skupk, 0.5)
    SetBlipColour (skupk, 46)
    SetBlipAsShortRange(skupk, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Chicken Dealer')
    EndTextCommandSetBlipName(skupk)
end)


function DrawText3D2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end



function GetVehicleInDirection()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

RegisterNetEvent("packingchicken")
AddEventHandler("packingchicken", function(position)
	if exports["plutorp-inventory"]:hasEnoughOfItem("slaughtered_chicken", 2) then
		SetEntityHeading(GetPlayerPed(-1), 40.0)
		local PedCoords = GetEntityCoords(GetPlayerPed(-1))
		local meat = CreateObject(GetHashKey('prop_cs_steak'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(meat, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		local carton = CreateObject(GetHashKey('prop_cs_clothes_box'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(carton, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
		packs = 1
		LoadDict("anim@heists@ornate_bank@grab_cash_heels")
		TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
		FreezeEntityPosition(GetPlayerPed(-1), true)
		local finishedpacking = exports['plutorp-taskbar']:taskBar(7500, 'Putting the chicken in the box')
		if (finishedpacking ==100 )then 
			FreezeEntityPosition(GetPlayerPed(-1),false)
			TriggerEvent('inventory:removeItem', "slaughtered_chicken", 2)

			TriggerEvent('player:receiveItem', "packaged_chicken", math.random(1,3))	
			TriggerEvent('DoLongHudText', 'Keep packing the chicken or go to the vehicle and store it.', 1)
			ClearPedTasks(GetPlayerPed(-1))
		end
		DeleteEntity(carton)
		DeleteEntity(meat)
	else
		TriggerEvent('DoLongHudText', 'You have nothing to pack!', 2)
	end
end)

RegisterNetEvent("portionthechicken")
AddEventHandler("portionthechicken", function(position)
	if exports["plutorp-inventory"]:hasEnoughOfItem("alive_chicken", 1) then
		local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
		LoadDict(dict)
		FreezeEntityPosition(GetPlayerPed(-1),true)
		TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		local PedCoords = GetEntityCoords(GetPlayerPed(-1))
		local prop = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0xDEAD), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)
		SetEntityHeading(GetPlayerPed(-1), 311.0)
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.5, 1))
		local chicken = CreateObject(GetHashKey('prop_int_cf_chick_01'), x, y, z,  true,  false, false)
		SetEntityHeading(chicken, GetEntityHeading(GetPlayerPed(-1)))
		local finished = exports['plutorp-taskbar']:taskBar(10000, 'Cutting the Chicken')
		if (finished == 100) then
			TriggerEvent('DoLongHudText', 'You slaughtered a chicken!', 1)
			FreezeEntityPosition(GetPlayerPed(-1),false)
			ClearPedTasks(GetPlayerPed(-1))
			TriggerEvent('inventory:removeItem', "alive_chicken", 1)
			TriggerEvent('player:receiveItem', "slaughtered_chicken", math.random(1,6))	
		end
		DeleteEntity(chicken)
		DeleteEntity(prop)
	else
		TriggerEvent('DoLongHudText', 'You dont have any chickens!', 2)
	end
end)


function TepnijWyjscie()
	DoScreenFadeOut(500)
	Citizen.Wait(500)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), startX+2, startY+2, startZ, 0, 0, 1)
	if DoesEntityExist(chicken1) or DoesEntityExist(chicken2) or DoesEntityExist(chicken3) then
		DeleteEntity(chicken1)
		DeleteEntity(chicken2)
		DeleteEntity(chicken3)
	end
	Citizen.Wait(500)
	DoScreenFadeIn(500)

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
							
	local dajdoAuta = true

	while dajdoAuta do
		Citizen.Wait(250)
		local vehicle   = GetVehicleInDirection()
		local coords    = GetEntityCoords(GetPlayerPed(-1))
		LoadDict('anim@heists@box_carry@')

		if not IsEntityPlayingAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 3 ) and dajdoAuta == true then
			TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		end
		
		if DoesEntityExist(vehicle) then
			dajdoAuta = false
			TriggerEvent('DoLongHudText', 'You put the chicken in the vehicle!', 2)
			LoadDict('anim@heists@narcotics@trash')
			TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@narcotics@trash', "throw_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			Citizen.Wait(900)
			ClearPedTasks(GetPlayerPed(-1))
			DeleteEntity(prop)
			TriggerEvent('player:receiveItem', "alive_chicken", 5)
		end
	end
end

RegisterNetEvent("Lapchickena")
AddEventHandler("Lapchickena", function()
	DoScreenFadeOut(500)
	Citizen.Wait(500)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), 2385.963, 5047.333, 46.400, 0, 0, 1)
	RequestModel(GetHashKey('a_c_hen'))
	while not HasModelLoaded(GetHashKey('a_c_hen')) do
		Wait(1)
	end
	chicken1 = CreatePed(26, "a_c_hen", 2370.262, 5052.913, 46.437, 276.351, true, false)

	chicken2 = CreatePed(26, "a_c_hen", 2372.040, 5059.604, 46.444, 223.595, true, false)
	chicken3 = CreatePed(26, "a_c_hen", 2379.192, 5062.992, 46.444, 195.477, true, false)
	TaskReactAndFleePed(chicken1, GetPlayerPed(-1))
	TaskReactAndFleePed(chicken2, GetPlayerPed(-1))
	TaskReactAndFleePed(chicken3, GetPlayerPed(-1))
	Citizen.Wait(500)
	DoScreenFadeIn(500)
	share = true
end)
-----
function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(5)
	
		if share == true then
			local chicken1Coords = GetEntityCoords(chicken1)
			local chicken2Coords = GetEntityCoords(chicken2)
			local chicken3Coords = GetEntityCoords(chicken3)
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chicken1Coords.x, chicken1Coords.y, chicken1Coords.z)
			local dist2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chicken2Coords.x, chicken2Coords.y, chicken2Coords.z)
			local dist3 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chicken3Coords.x, chicken3Coords.y, chicken3Coords.z)
			
			if splashed == 3 then
				Zlapany1 = 0
				Zlapany2 = 0
				Zlapany3 = 0
				splashed = 0
				share = false
				TriggerEvent('DoLongHudText', 'Take the chickens to a vehicle!', 1)
				TepnijWyjscie()
			end
			
			if dist <= 3.0 then
			DrawText3D2(chicken1Coords.x, chicken1Coords.y, chicken1Coords.z+0.5, "~o~[E]~b~ Catch the chicken")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany1 = 1
					Hewascaught()
				end	
			elseif dist2 <= 3.0 then
				DrawText3D2(chicken2Coords.x, chicken2Coords.y, chicken2Coords.z+0.5, "~o~[E]~b~ Catch the chicken")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany2 = 1
					Hewascaught()
				end	
			elseif dist3 <= 3.0 then
				DrawText3D2(chicken3Coords.x, chicken3Coords.y, chicken3Coords.z+0.5, "~o~[E]~b~ Catch the chicken")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany3 = 1
					Hewascaught()
				end	
			end
		else
			Citizen.Wait(500)
		end	
	end
end)

local ragdoll = false
function Hewascaught()
	LoadDict('move_jump')
	TaskPlayAnim(GetPlayerPed(-1), 'move_jump', 'dive_start_run', 8.0, -8.0, -1, 0, 0.0, 0, 0, 0)
	Citizen.Wait(600)
	SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
	Citizen.Wait(1000)
	ragdoll = true
	local szansaZlapania = math.random(1,100)
	if szansaZlapania <= 60 then
			TriggerEvent('DoLongHudText', 'You managed to catch 1 chicken!', 1)
			if Zlapany1 == 1 then
				DeleteEntity(chicken1)
				Zlapany1 = 0
				splashed = splashed +1
			elseif Zlapany2 == 1 then
				DeleteEntity(chicken2)
				Zlapany2 = 0
				splashed = splashed +1
			elseif Zlapany3 == 1 then
				DeleteEntity(chicken3)
				Zlapany3 = 0
				splashed = splashed +1
			end
		else
		TriggerEvent('DoLongHudText', 'The chicken escaped your arms!', 2)
	end
end

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		if ragdoll then
			SetEntityHealth(PlayerPedId(), 200)
			TriggerEvent('plutorp-hospital:client:ResetLimbs')
            TriggerEvent('plutorp-hospital:client:RemoveBleed')
			ragdoll = false
		end
	end
end)

RegisterNetEvent("Sellchicken")
AddEventHandler("Sellchicken", function()
	if exports["plutorp-inventory"]:hasEnoughOfItem("packaged_chicken",2,false) then 
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
		local prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  false, false)
		SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
		LoadDict('amb@medic@standing@tendtodead@idle_a')
		TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
		local finished = exports['plutorp-taskbar']:taskBar(5000, 'Selling the chicken!')
		LoadDict('amb@medic@standing@tendtodead@exit')
		TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
		if (finished == 100) then
			local chicken = math.random(70, 186)
			TriggerServerEvent('chickenpayment:pay', chicken)
			ClearPedTasksImmediately(PlayerPedId())
			TriggerEvent('inventory:removeItem', "packaged_chicken", 2)
		end
		DeleteEntity(prop)
	else
		TriggerEvent('DoLongHudText', 'You have nothing to sell!', 2)
	end
end)




