local blips = {
    {title="Pawn Shop", colour=5, id=500, scale=0.5, x = 412.34118652344, y =  314.52130126953, z = 103.02114105225},
    {title="Smelter", colour=5, id=365, scale=0.5, x = 1084.8002929688, y = -2002.1312255859, z = 31.418100357056},
    {title="Washer", colour=5, id=365, scale=0.5, x = 1984.2188720703, y =  552.18225097656, z = 161.0832824707},
    {title="Mine Shaft", colour=5, id=365, scale=0.5, x = -595.07623291016, y =  2085.5681152344, z = 131.38136291504}
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local currentlyMining = false
local currentlySmelting = false
local pFarmed = 0


RegisterNetEvent("start-mining")
AddEventHandler("start-mining", function()
	if exports["plutorp-inventory"]:hasEnoughOfItem("pickaxe",1,false) and not currentlyMining then 
        currentlyMining = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

            FreezeEntityPosition(playerPed, true)
            SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'))
            Citizen.Wait(200)
            
            local pickaxe = GetHashKey("prop_tool_pickaxe")
            
            -- Loads model
            RequestModel(pickaxe)
            while not HasModelLoaded(pickaxe) do
            Wait(1)
            end
            
            local anim = "melee@hatchet@streamed_core_fps"
            local action = "plyr_front_takedown"
            
            -- Loads animation
            RequestAnimDict(anim)
            while not HasAnimDictLoaded(anim) do
                Wait(1)
            end
            
            local object = CreateObject(pickaxe, coords.x, coords.y, coords.z, true, false, false)
            AttachEntityToEntity(object, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.0, 0.0, -90.0, 25.0, 35.0, true, true, false, true, 1, true)
            TaskPlayAnim(PlayerPedId(), anim, action, 3.0, -3.0, -1, 31, 0, false, false, false)
            -- SetEntityHeading(PlayerPedId(), 294.89007568359)

            local finished = exports ["plutorp-taskbarplus"]:taskBar(18000,math.random(10,20))
            if (finished == 100) then
                local finished = exports ["plutorp-taskbarplus"]:taskBar(18000,math.random(10,20))
                if (finished == 100) then
                    local finished = exports ["plutorp-taskbarplus"]:taskBar(18000,math.random(10,20))
                    if (finished == 100) then
                        TriggerEvent('player:receiveItem', "stone", math.random(1,5))
                        pFarmed = pFarmed + 1    
                    else
                        TriggerEvent("DoLongHudText", "Downbad", 1)
                        currentlyMining = false
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(playerPed, false)
                        DeleteObject(object)
                    
                    end
                else
                    TriggerEvent("DoLongHudText", "Downbad", 1)
                    currentlyMining = false
                    ClearPedTasks(PlayerPedId())
                    FreezeEntityPosition(playerPed, false)
                    DeleteObject(object)
                
                end
                              
            else
                TriggerEvent("DoLongHudText", "Downbad", 1)
                currentlyMining = false
                ClearPedTasks(PlayerPedId())
                FreezeEntityPosition(playerPed, false)
                DeleteObject(object)
            
            end

            currentlyMining = false
            ClearPedTasks(PlayerPedId())
            FreezeEntityPosition(playerPed, false)
            DeleteObject(object)
        

    else
		TriggerEvent('DoLongHudText', 'You need a pickaxe', 2)
    end
end)




RegisterNetEvent("washerevent")
AddEventHandler("washerevent", function()
    if exports['plutorp-inventory']:hasEnoughOfItem("washedpan", 1) and exports['plutorp-inventory']:hasEnoughOfItem("stone", 1) then
        local bitch = exports['plutorp-inventory']:getQuantity("stone")
        if bitch >= 1 then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            
            FreezeEntityPosition(playerPed, true)
            SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'))
            Citizen.Wait(200)
            
            local pHasStone = exports['plutorp-inventory']:getQuantity("stone")
            if pHasStone >= 1 then
                TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                local finished = exports["plutorp-taskbar"]:taskBar(10000,"Washing Stones")
                if finished == 100 then
                    TriggerEvent("inventory:removeItem","stone", 5)
                    TriggerEvent('player:receiveItem',"washedstone", math.random(1,8))	                    
                end

                
                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, false)
            else
                TriggerEvent('DoLongHudText', 'You need a 1x Stone to wash here!', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'You need a wash pan to wash here!', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You need a wash pan & atleast 1x Stone.', 2)
    end
end)

RegisterNetEvent("SmeltingEvent")
AddEventHandler("SmeltingEvent", function()
    local bitch = exports['plutorp-inventory']:getQuantity("washedstone")
    if bitch >= 1 then        
        currentlySmelting = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
            
        FreezeEntityPosition(playerPed, true)
        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'))
        Citizen.Wait(200)
                
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Smelting Washed Stone")
        if finished == 100 then
            TriggerEvent("inventory:removeItem","washedstone", 1)
                
            local itemLimit1 = exports['plutorp-inventory']:getQuantity("goldbar")
            local itemLimit2 = exports['plutorp-inventory']:getQuantity("silverbar")
            local itemLimit3 = exports['plutorp-inventory']:getQuantity("goldbar")
            local itemLimit4 = exports['plutorp-inventory']:getQuantity("silverbar")
            local itemLimit5 = exports['plutorp-inventory']:getQuantity("copperbar")
            local itemLimit6 = exports['plutorp-inventory']:getQuantity("ironbar")
            
            local rewardChance = math.random(1,10)

            if rewardChance == 1 then
                if itemLimit1 < 10000 then
                    TriggerEvent('player:receiveItem', "goldbar", math.random(1,2))
                    TriggerEvent('DoLongHudText', 'You received a Gold Bar!')
                end
            elseif rewardChance == 2 then
                if itemLimit2 < 10000 then
                    TriggerEvent('player:receiveItem', "ironbar", math.random(1,3))
                    TriggerEvent('DoLongHudText', 'You received a Iron Bar!')
                end
            elseif rewardChance == 3 or rewardChance == 4 or rewardChance == 5 then
                local firstChance = math.random(1,2)
                if firstChance == 1 then
                    if itemLimit3 < 10000 then
                        TriggerEvent('player:receiveItem', "goldbar", math.random(1,2))
                        TriggerEvent('DoLongHudText', 'You received a Gold Bar!')
                    end
                else
                    if itemLimit4 < 10000 then
                        TriggerEvent('player:receiveItem', "ironbar", math.random(1,3))
                        TriggerEvent('DoLongHudText', 'You received a Iron Bar!')
                    end
                end
            elseif rewardChance == 6 or rewardChance == 7 or rewardChance == 8 or rewardChance == 9 or rewardChance == 10 then
                local secondChance = math.random(1,2)
                if secondChance == 1 then
                    if itemLimit5 < 10000 then
                        TriggerEvent('player:receiveItem', "copperbar", math.random(1,3))
                        TriggerEvent('DoLongHudText', 'You received a Copper Bar!')
                    end
                else
                    if itemLimit6 < 10000 then
                        TriggerEvent('player:receiveItem', "silverbar", math.random(1, 2))
                        TriggerEvent('DoLongHudText', 'You received a Silver Bar!')
                    end
                end
            end
            
            FreezeEntityPosition(playerPed, false)
            currentlySmelting = false
            keyPressed = false
        end
    else
        TriggerEvent('DoLongHudText', 'You need at least 1x Washed Stone to Smelt here!', 2)
        keyPressed = false
    end

end)



RegisterNetEvent("mining:sell", function(pType)
    local pAmont = exports['plutorp-inventory']:getQuantity(pType)
    local pTaskbarTimer = pAmont * 2500
    local pFinished = exports["plutorp-taskbar"]:taskBar(pTaskbarTimer, "Selling Items")
    if (pFinished == 100) then
        TriggerServerEvent("mining-sell:items", pAmont, pType)
    else
        TriggerEvent("DoLongHudText", "You cancelled the sell!", 2)
    end
end)




RegisterNetEvent("miningmenu")
AddEventHandler("miningmenu", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Level 1 Mine",
			txt = "1 Pickaxe | +1 Stone",
			params = {
				event = "start-mining",
			}
		},
        {
			id = "2",
			header = "Level 2 Mine",
			txt = "1 Sledge Hammer | +1 Stone",
			params = {
				event = "start-mining2",
			}
		},
        {
			id = "3",
			header = "Level 3 Mine",
			txt = "1 Special Pickaxe | +1 Stone",
			params = {
				event = "start-mining3",
			}
		},
		{
			id = "4",
			header = "Close Menu",
			txt = "Exit the mining menu!",
			params = {
				event = "",
			}
		},
	})
end)


RegisterNetEvent("mining-info")
AddEventHandler("mining-info", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Miner",
			txt = "",
		},
        {
			id = "2",
			header = "Miner Says",
			txt = "Use your F1 muscle inside to start mining and make sure you have a pickaxe to mine the stone and a wash pan to wash the stone!",
		},
		{
			id = "3",
			header = "Close Menu",
			txt = "Exit the mining menu!",
			params = {
				event = "",
			}
		},
	})
end)
