local pWeedFieldSpot = false

Citizen.CreateThread(function()
    exports["plutorp-polyzone"]:AddBoxZone("weed_field", vector3(2224.47, 5577.01, 53.81), 15, 5, {
        name="weed_field",
        heading=265,
        --debugPoly=true,
	   minZ=50.81,
	   maxZ=54.81
    })  
end)


RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "weed_field" then
        pWeedFieldSpot = true
        WeedFieldSpot()
		TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Pick Weed")) 
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    if name == "weed_field" then
        pWeedFieldSpot = false
    end
    TriggerEvent('plutorp-ui:HideUI')
end)


function WeedFieldSpot()
    Citizen.CreateThread(function()
        while pWeedFieldSpot do
            Citizen.Wait(5)
			if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) ~= 1 then
				if JustPickedWeed then
					TriggerEvent("DoLongHudText","You are too tired ,  take a little rest and try again in a few seconds!", 2)
				else
					if not JustPickedWeed then
						JustPickedWeed = true
					   TriggerEvent("sk1c2:drugs-prevent","weedpicking")
					end

					TriggerEvent("animation:farm")
					local finished = exports["plutorp-taskbar"]:taskBar(4000,"Picking Weed")
					if (finished == 100) then
						TriggerEvent("player:receiveItem","wetbud", math.random(1,3))
						TriggerEvent("client:newStress",true,50)
					end
				end			
			end
        end
    end)
end


-- weed sell (smoke on water)

local pWeedSell = false

Citizen.CreateThread(function()
    exports["plutorp-polyzone"]:AddBoxZone("smokeonwater", vector3(-1172.01, -1571.89, 4.33), 0.5, 1, {
        name="smokeonwater",
        heading=305,
        --debugPoly=true,
		minZ=1.33,
		maxZ=5.33
    })  
end)

RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "smokeonwater" then
        pWeedSell = true
        WeedSellSpot()
		TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Sell Weed")) 
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    if name == "smokeonwater" then
        pWeedSell = false
    end
    TriggerEvent('plutorp-ui:HideUI')
end)

function WeedSellSpot()
    Citizen.CreateThread(function()
        while pWeedSell do
            Citizen.Wait(5)
			local wetbud = exports["plutorp-inventory"]:hasEnoughOfItem("smallbud",3,false)
			if wetbud then
				if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) ~= 1 then
					local finished = exports["plutorp-taskbar"]:taskBar(6500,"Selling Weed")
					if (finished == 100) then
						TriggerEvent("inventory:removeItem", "smallbud", math.random(1,6))
						TriggerServerEvent( 'sk1c2:payout', math.random(136,183))
					end		
				end
			end
        end
    end)
end


-- Weed Field cool down
RegisterNetEvent('sk1c2:drugs-prevent')
AddEventHandler('sk1c2:drugs-prevent', function(prevent)
	if prevent == "weedpicking" then
		Wait(5000)  -- 5 seconds
		JustPickedWeed = false
	end
end)


-- animation's

RegisterNetEvent('animation:farm')
AddEventHandler('animation:farm', function()
    inanimation = true
	local lPed = GetPlayerPed(-1)
	RequestAnimDict("amb@world_human_gardener_plant@male@base")
	while not HasAnimDictLoaded("amb@world_human_gardener_plant@male@base") do
	Citizen.Wait(0)
	end
	if IsEntityPlayingAnim(lPed, "amb@world_human_gardener_plant@male@base", "base", 3) then
	ClearPedSecondaryTask(lPed)
	else
	TaskPlayAnim(lPed, "amb@world_human_gardener_plant@male@base", "base", 8.0, -8, -1, 49, 0, 0, 0, 0)
	seccount = 4
	while seccount > 0 do
	Citizen.Wait(1000)
	seccount = seccount - 1
	end
	ClearPedSecondaryTask(lPed)
	end		
	inanimation = false
end)

RegisterNetEvent('pluto-drugs:animation')
AddEventHandler('pluto-drugs:animation', function()
  	local pid = PlayerPedId()
  	RequestAnimDict("amb@prop_human_bum_bin@idle_b")
  	while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do Citizen.Wait(0) end
	TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
	TaskPlayAnim(ped,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
    Wait(1500)
	StopAnimTask(pid, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
	StopAnimTask(ped, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
end)

-- Process weed!
local pWeedProcess = false

Citizen.CreateThread(function()
    exports["plutorp-polyzone"]:AddBoxZone("process_weed", vector3(3802.85, 4442.67, 4.41), 7, 7, {
        name="process_weed",
        heading=0,
        --debugPoly=true,
		minZ=3.01,
		maxZ=7.01
    })  
end)

RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "process_weed" then
        pWeedProcess = true
        WeedProcessSpot()
		TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Process Wet Bud")) 
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    if name == "process_weed" then
        pWeedProcess = false
    end
    TriggerEvent('plutorp-ui:HideUI')
end)

function WeedProcessSpot()
    Citizen.CreateThread(function()
        while pWeedProcess do
            Citizen.Wait(5)
			local wetbud = exports["plutorp-inventory"]:hasEnoughOfItem("wetbud",3,false)
			if wetbud then
				if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) ~= 1 then
					local finished = exports["plutorp-taskbar"]:taskBar(6500,"Processing Wet Bud")
					if (finished == 100) then
						TriggerEvent("inventory:removeItem", "wetbud", math.random(1,3))
						TriggerEvent("player:receiveItem","smallbud", math.random(1,3))
					end		
				end
			end
        end
    end)
end