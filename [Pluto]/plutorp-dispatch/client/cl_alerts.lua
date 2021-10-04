RegisterNetEvent('plutorp-outlawalert:gunshotInProgress')
AddEventHandler('plutorp-outlawalert:gunshotInProgress', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'news' then
		local alpha = 250
		local gunshotBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(gunshotBlip,  110)
		SetBlipColour(gunshotBlip,  1)
		SetBlipScale(gunshotBlip, 1.2)
		SetBlipAsShortRange(gunshotBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-71A Shots Fired')
		EndTextCommandSetBlipName(gunshotBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(policedown)
				return
			end
		end
	
	end
end)

AddEventHandler('plutorp-alerts:gunshot', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:shoot', {x = pos.x, y = pos.y, z = pos.z})
end)


---- 10-13s Officer Down ----

RegisterNetEvent('plutorp-alerts:policealertA')
AddEventHandler('plutorp-alerts:policealertA', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then
		local alpha = 250
		local policedown = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(policedown,  84)
		SetBlipColour(policedown,  1)
		SetBlipScale(policedown, 1.2)
		SetBlipAsShortRange(policedown,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-13A Officer Down')
		EndTextCommandSetBlipName(policedown)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'polalert', 0.2)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(policedown, alpha)

		if alpha == 0 then
			RemoveBlip(policedown)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:1013A', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:teenA', {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent('plutorp-alerts:policealertB')
AddEventHandler('plutorp-alerts:policealertB', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then
		local alpha = 250
		local policedown2 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(policedown2, 84)
		SetBlipColour(policedown2, 1)
		SetBlipScale(policedown2, 1.2)
		SetBlipAsShortRange(policedown2,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-13B Officer Down')
		EndTextCommandSetBlipName(policedown2)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(policedown2, alpha)

		if alpha == 0 then
			RemoveBlip(policedown2)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:1013B', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:teenB', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('plutorp-alerts:panic')
AddEventHandler('plutorp-alerts:panic', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then
		local alpha = 250
		local panic = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
		SetBlipSprite(panic, 459)
		SetBlipColour(panic, 1)
		SetBlipScale(panic, 1.2)
		SetBlipAsShortRange(panic,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-78 Officer Panic Botton')
		EndTextCommandSetBlipName(panic)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'polalert', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(panic, alpha)

		if alpha == 0 then
			RemoveBlip(panic)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:policepanic', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:teenpanic', {x = pos.x, y = pos.y, z = pos.z})
end)


---- 10-14 EMS ----

RegisterNetEvent('plutorp-alerts:tenForteenA')
AddEventHandler('plutorp-alerts:tenForteenA', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then
		local alpha = 250
		local medicDown = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(medicDown, 84)
		SetBlipColour(medicDown, 1)
		SetBlipScale(medicDown, 1.2)
		SetBlipAsShortRange(medicDown,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-14A Medic Down')
		EndTextCommandSetBlipName(medicDown)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'polalert', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(medicDown, alpha)

		if alpha == 0 then
			RemoveBlip(medicDown)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:1014A', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:fourA', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('plutorp-alerts:tenForteenB')
AddEventHandler('plutorp-alerts:tenForteenB', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then
		local alpha = 250
		local medicDown2 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(medicDown2, 84)
		SetBlipColour(medicDown2, 1)
		SetBlipScale(medicDown2, 1.2)
		SetBlipAsShortRange(medicDown2,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-14B Officer Down')
		EndTextCommandSetBlipName(medicDown2)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(medicDown2, alpha)

		if alpha == 0 then
			RemoveBlip(medicDown2)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:1014B', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:fourB', {x = pos.x, y = pos.y, z = pos.z})
end)

---- Down Person ----

RegisterNetEvent('plutorp-alerts:downalert')
AddEventHandler('plutorp-alerts:downalert', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then
		local alpha = 250
		local injured = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(injured,  126)
		SetBlipColour(injured,  18)
		SetBlipScale(injured, 1.2)
		SetBlipAsShortRange(injured,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-47 Injured Person')
		EndTextCommandSetBlipName(injured)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'dispatch', 0.1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(injured, alpha)

		if alpha == 0 then
			RemoveBlip(injured)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:downguy', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:downperson', {x = pos.x, y = pos.y, z = pos.z})
end)

---- assistance ----
RegisterNetEvent('plutorp-alerts:assistance')
AddEventHandler('plutorp-alerts:assistance', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then	
		local alpha = 250
		local assistance = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(assistance,  126)
		SetBlipColour(assistance,  18)
		SetBlipScale(assistance, 1.2)
		SetBlipAsShortRange(assistance,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Assistance Needed')
		EndTextCommandSetBlipName(assistance)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'dispatch', 0.1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(assistance, alpha)

		if alpha == 0 then
			RemoveBlip(assistance)
		return
      end
    end
  end
end)


RegisterNetEvent('plutorp-alerts:vehiclecrash')
AddEventHandler('plutorp-alerts:vehiclecrash', function()
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'ems' or job == 'news' then
		local alpha = 250
		local targetCoords = GetEntityCoords(PlayerPedId(), true)
		local recket = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(recket,  488)
		SetBlipColour(recket,  1)
		SetBlipScale(recket, 1.2)
		SetBlipAsShortRange(recket,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-50 Vehicle Crash')
		EndTextCommandSetBlipName(recket)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(recket, alpha)

		if alpha == 0 then
			RemoveBlip(recket)
		return
      end
    end
  end
end)

---- Store Robbery ----
RegisterNetEvent('plutorp-alerts:storerobbery')
AddEventHandler('plutorp-alerts:storerobbery', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'news' then
		local alpha = 250
		local store = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipHighDetail(store, true)
		SetBlipSprite(store, 52)
		SetBlipColour(store, 1)
		SetBlipScale(store, 1.2)
		SetBlipAsShortRange(store,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-31B Robbery In Progress')
		EndTextCommandSetBlipName(store)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(store, alpha)

		if alpha == 0 then
			RemoveBlip(store)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:robstore', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:storerob', {x = pos.x, y = pos.y, z = pos.z})
end)

---- House Robbery ----

RegisterNetEvent('plutorp-alerts:houserobbery')
AddEventHandler('plutorp-alerts:houserobbery', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'news' then
		local alpha = 250
		local burglary = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipHighDetail(burglary, true)
		SetBlipSprite(burglary,  411)
		SetBlipColour(burglary,  1)
		SetBlipScale(burglary, 1.2)
		SetBlipAsShortRange(burglary,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-31A Burglary')
		EndTextCommandSetBlipName(burglary)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(burglary, alpha)

		if alpha == 0 then
			RemoveBlip(burglary)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:robhouse', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:houserob', {x = pos.x, y = pos.y, z = pos.z})
end)

---- Bank Truck ----

RegisterNetEvent('plutorp-alerts:banktruck')
AddEventHandler('plutorp-alerts:banktruck', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'news' then
		local alpha = 250
		local truck = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(truck,  477)
		SetBlipColour(truck,  76)
		SetBlipScale(truck, 1.2)
		SetBlipAsShortRange(Blip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90 Bank Truck In Progress')
		EndTextCommandSetBlipName(truck)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(truck, alpha)

		if alpha == 0 then
			RemoveBlip(truck)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:bankt', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:tbank', {x = pos.x, y = pos.y, z = pos.z})
end)

---- Jewerly Store ----

RegisterNetEvent('plutorp-alerts:jewelrobbey')
AddEventHandler('plutorp-alerts:jewelrobbey', function()
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'news' then
		local alpha = 250
		local jew = AddBlipForCoord(-634.02, -239.49, 38)

		SetBlipSprite(jew,  487)
		SetBlipColour(jew,  4)
		SetBlipScale(jew, 1.2)
		SetBlipAsShortRange(Blip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90 In Progress')
		EndTextCommandSetBlipName(jew)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:jewrob', function()
	TriggerServerEvent('plutorp-alerts:robjew')
end)

-- Big Bank --

RegisterNetEvent('plutorp-alerts:bigbank2')
AddEventHandler('plutorp-alerts:bigbank2', function(plyPos)
	local job = exports["isPed"]:isPed("myjob")
	if job == 'police' or job == 'news' then
		local alpha = 250
		local targetCoords = GetEntityCoords(PlayerPedId(), true)
		local thiefBlip = AddBlipForCoord(plyPos.x, plyPos.y, plyPos.z)

		SetBlipSprite(thiefBlip,  51)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90 Pacific Standard Bank In Progress')
		EndTextCommandSetBlipName(thiefBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end
  end
end)

-- Bobcat Robbery --

RegisterNetEvent('plutorp-alerts:bobcat')
AddEventHandler('plutorp-alerts:bobcat', function(plyPos)
	local job = exports["isPed"]:isPed("myjob")
	if job == 'police' then
		local alpha = 250
		local targetCoords = GetEntityCoords(PlayerPedId(), true)
		local thiefBlip = AddBlipForCoord(plyPos.x, plyPos.y, plyPos.z)

		SetBlipSprite(thiefBlip,  51)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90 Bobcat Robbery In Progress')
		EndTextCommandSetBlipName(thiefBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end
  end
end)

-- Power Plant --

RegisterNetEvent('plutorp-alerts:powerplant')
AddEventHandler('plutorp-alerts:powerplant', function()
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' then
		local alpha = 250
		local targetCoords = GetEntityCoords(PlayerPedId(), true)

		SetBlipSprite(thiefBlip,  51)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-31A Tresspassing At A Power Plant')
		EndTextCommandSetBlipName(thiefBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end
  end
end)

-- Paleto Bank --

RegisterNetEvent('plutorp-alerts:paleto')
AddEventHandler('plutorp-alerts:paleto', function(plyPos)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' then
		local alpha = 250
		local targetCoords = GetEntityCoords(PlayerPedId(), true)
		local thiefBlip = AddBlipForCoord(plyPos.x, plyPos.y, plyPos.z)

		SetBlipSprite(thiefBlip,  51)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90 Paleto Bank Robbery In Progress')
		EndTextCommandSetBlipName(thiefBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end
  end
end)

RegisterNetEvent('plutorp-dispatch:fleeca:bank:receive')
AddEventHandler('plutorp-dispatch:fleeca:bank:receive', function(pCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' then
		local alpha = 250
		local pLocation = AddBlipForCoord(pCoords.x, pCoords.y, pCoords.z)

		SetBlipSprite(pLocation,  487)
		SetBlipColour(pLocation,  4)
		SetBlipScale(pLocation, 1.2)
		SetBlipAsShortRange(Blip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90 In Progress')
		EndTextCommandSetBlipName(pLocation)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(pLocation, alpha)

			if alpha == 0 then
				RemoveBlip(pLocation)
				return
			end
    	end
  end
end)

AddEventHandler('plutorp-dispatch:fleeca:bank', function(pCoords)
	TriggerServerEvent('plutorp-dispatch:fleeca:bank', pCoords)
end)

--drug sales--
RegisterNetEvent('plutorp-alerts:drugsales')
AddEventHandler('plutorp-alerts:drugsales', function(targetCoords)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'police' or job == 'news' then
		local alpha = 250
		local drugsales = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipHighDetail(drugsales, true)
		SetBlipSprite(drugsales,  51)
		SetBlipColour(drugsales,  1)
		SetBlipScale(drugsales, 1.0)
		SetBlipAsShortRange(drugsales,  0.8)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-26 Drugs In Proggress')
		EndTextCommandSetBlipName(burglary)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(drugsales, alpha)

		if alpha == 0 then
			RemoveBlip(drugsales)
		return
      end
    end
  end
end)

AddEventHandler('plutorp-alerts:sellingdrugs', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('plutorp-alerts:drugsselling', {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent('plutorp:alert:bigbank2')
AddEventHandler('plutorp:alert:bigbank2', function()
  AlertBigbank2()
end)

RegisterNetEvent('plutorp:alert:bobcat')
AddEventHandler('plutorp:alert:bobcat', function()
	AlertBobcat()
end)

RegisterNetEvent('plutorp-dispatch:methexplosion')
AddEventHandler("plutorp-dispatch:methexplosion",function()
  AlertMeth()
end)

RegisterNetEvent('plutorp-dispatch:pacific')
AddEventHandler("plutorp-dispatch:pacific",function()
  AlertPacific()
end)

RegisterNetEvent('plutorp:alert:paleto')
AddEventHandler('plutorp:alert:paleto', function()
	AlertPaletoBank()
end)

RegisterNetEvent('plutorp-dispatch:jailbreak')
AddEventHandler("plutorp-dispatch:jailbreak",function()
  AlertJailBreak()
end)

RegisterNetEvent('plutorp-dispatch:jewelrobbery')
AddEventHandler("plutorp-dispatch:jewelrobbery",function()
  AlertJewelRob()
  return
end)


RegisterNetEvent('plutorp-dispatch:houserobbery')
AddEventHandler("plutorp-dispatch:houserobbery",function()
  AlertCheckRobbery2()
end)

RegisterNetEvent('plutorp-dispatch:drugsales')
AddEventHandler("plutorp-dispatch:drugsales",function()
	DrugSales()
end)

RegisterNetEvent('plutorp-dispatch:storerobbery')
AddEventHandler("plutorp-dispatch:storerobbery",function()
  AlertpersonRobbed(vehicle)
end)

RegisterNetEvent('plutorp-dispatch:carjacking')
AddEventHandler("plutorp-dispatch:carjacking",function()
  AlertCheckLockpick(object)
end)

RegisterNetEvent('plutorp-dispatch:downplayer')
AddEventHandler("plutorp-dispatch:downplayer",function()
	TriggerEvent("police:1047")
end)

RegisterNetEvent('plutorp:alert:powerplant')
AddEventHandler('plutorp:alert:powerplant', function()
  AlertPowerPlant()
end)