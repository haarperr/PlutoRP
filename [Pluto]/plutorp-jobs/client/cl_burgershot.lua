RegisterNetEvent("plutorp-burgershot:startprocess3")
AddEventHandler("plutorp-burgershot:startprocess3", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then    
        if exports["plutorp-inventory"]:hasEnoughOfItem("rawpatty", 1) then 
            local dict = 'amb@prop_human_bbq@male@idle_a'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BBQ", 0, false)
            Citizen.Wait(2500)
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['plutorp-taskbar']:taskBar(25000, 'Cooking the Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "rawpatty", 1)
                TriggerEvent('player:receiveItem', 'patty', 2)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You need some Raw Patty to Make some Cooked Pattys! (Required Amount: 1)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("burgershot:bleeder")
AddEventHandler("burgershot:bleeder", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then    
        if exports['plutorp-inventory']:hasEnoughOfItem('bun', 2) and exports['plutorp-inventory']:hasEnoughOfItem('cheese', 1) and exports['plutorp-inventory']:hasEnoughOfItem('tomato', 1) and exports['plutorp-inventory']:hasEnoughOfItem('patty', 1) then
            local dict = 'amb@prop_human_bbq@male@idle_a'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)
            Citizen.Wait(250)
            local finished = exports['plutorp-taskbar']:taskBar(25000, 'Making The Burger')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "bun", 2)
                TriggerEvent('player:removeItem', 'cheese', 1)
                TriggerEvent('player:removeItem', 'tomato', 1)
                TriggerEvent('player:removeItem', 'lettuce', 1)
                TriggerEvent('player:removeItem', 'patty', 1)
                TriggerEvent('player:receiveItem', 'bleederburger', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(250)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You are missing something', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("burgershot:heartstopper")
AddEventHandler("burgershot:heartstopper", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then    
        if exports['plutorp-inventory']:hasEnoughOfItem('bun', 2) and exports['plutorp-inventory']:hasEnoughOfItem('cheese', 1) and exports['plutorp-inventory']:hasEnoughOfItem('tomato', 1) and exports['plutorp-inventory']:hasEnoughOfItem('patty', 1) then
            local dict = 'amb@prop_human_bbq@male@idle_a'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)
            Citizen.Wait(250)
            local finished = exports['plutorp-taskbar']:taskBar(25000, 'Making The Burger')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "bun", 2)
                TriggerEvent('player:removeItem', 'cheese', 1)
                TriggerEvent('player:removeItem', 'tomato', 1)
                TriggerEvent('player:removeItem', 'lettuce', 1)
                TriggerEvent('player:removeItem', 'patty', 1)
                TriggerEvent('player:receiveItem', 'heartstopper', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(250)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You are missing something', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("burgershot:torpedo")
AddEventHandler("burgershot:torpedo", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then    
        if exports['plutorp-inventory']:hasEnoughOfItem('bun', 2) and exports['plutorp-inventory']:hasEnoughOfItem('cheese', 1) and exports['plutorp-inventory']:hasEnoughOfItem('tomato', 1) and exports['plutorp-inventory']:hasEnoughOfItem('patty', 1) then
            local dict = 'amb@prop_human_bbq@male@idle_a'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)
            Citizen.Wait(250)
            local finished = exports['plutorp-taskbar']:taskBar(25000, 'Making The Burger')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "bun", 2)
                TriggerEvent('player:removeItem', 'cheese', 1)
                TriggerEvent('player:removeItem', 'tomato', 1)
                TriggerEvent('player:removeItem', 'lettuce', 1)
                TriggerEvent('player:removeItem', 'patty', 1)
                TriggerEvent('player:receiveItem', 'torpedo', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(250)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You are missing something', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("burgershot:meatfree")
AddEventHandler("burgershot:meatfree", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then    
        if exports['plutorp-inventory']:hasEnoughOfItem('bun', 2) and exports['plutorp-inventory']:hasEnoughOfItem('lettuce', 1) then
            local dict = 'amb@prop_human_bbq@male@idle_a'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)
            Citizen.Wait(250)
            local finished = exports['plutorp-taskbar']:taskBar(25000, 'Making The Burger')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "bun", 2)
                TriggerEvent('player:removeItem', 'lettuce', 1)
                TriggerEvent('player:receiveItem', 'meatfree', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(250)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You are missing something', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("plutorp-burgershot:startfryer")
AddEventHandler("plutorp-burgershot:startfryer", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then  
        if exports["plutorp-inventory"]:hasEnoughOfItem("potato", 1) then
            local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['plutorp-taskbar']:taskBar(20000, 'Dropping Fries')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'fries', 2)
                TriggerEvent("inventory:removeItem", "potato", 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You Havent Got Any Cut Potatoes! (Required Amount: 1)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("plutorp-burgershot:makeshake")
AddEventHandler("plutorp-burgershot:makeshake", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then
        if exports["plutorp-inventory"]:hasEnoughOfItem("milkshakeformula", 1) then
            local dict = 'mp_ped_interaction'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "handshake_guy_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['plutorp-taskbar']:taskBar(10000, 'Making Milk Shake')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'mshake', 2)
                TriggerEvent("inventory:removeItem", "milkshakeformula", 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You Havent got any Milk Shake Formula! (Required Amount: 1)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("plutorp-burgershot:getcola")
AddEventHandler("plutorp-burgershot:getcola", function()
    local rank = exports["plutorp_manager"]:GroupRank("burger_shot")
    if rank > 0 then
        if exports["plutorp-inventory"]:hasEnoughOfItem("hfcs", 1) then   
            local dict = 'mp_ped_interaction'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "handshake_guy_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['plutorp-taskbar']:taskBar(5000, 'Getting Coke')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'softdrink', 2)
                TriggerEvent("inventory:removeItem", "hfcs", 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You do not have enough Syrup! (Required Amount: 1)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
    end
end)

RegisterNetEvent("burgershot:register")
AddEventHandler("burgershot:register", function(registerID)
    local myJob = exports["plutorp_manager"]:isPed("myJob")
    if myJob == "burger_shot" then
        local order = exports["plutorp-applications"]:KeyboardInput({
            header = "Create Receipt",
            rows = {
                {
                    id = 0,
                    txt = "Amount"
                },
                {
                    id = 1,
                    txt = "Comment"
                }
            }
        })
        if order then
            TriggerServerEvent("burger_shot:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("burgershot:get:receipt")
AddEventHandler("burgershot:get:receipt", function(registerid)
    TriggerServerEvent('burgershot:retreive:receipt', registerid)
end)

RegisterNetEvent('burgershot:cash:in')
AddEventHandler('burgershot:cash:in', function()
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("burgershot:update:pay", cid)
end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

function findClosestSpawnPointLegion(pCurrentPosition)
	local coords = vector3(-1179.9895019531, -905.36828613281, 13.699028015137)
	local closestDistance = -1
	local closestCoord = pCurrentPosition
	local distance = #(coords - pCurrentPosition)
	if closestDistance == -1 or closestDistance > distance then
	  closestDistance = distance
	  closestCoord = coords
	end
	return closestCoord
end

function SpawnVehBurgerShot(name)
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

        local vehicle = CreateVehicle(hash, -1179.9895019531, -905.36828613281, 13.699028015137, 299.84042358398, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end)
end

RegisterNetEvent("burgershot:delivery")
AddEventHandler("burgershot:delivery", function()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "BurgerShot Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Delivery Van",
			txt = "For Deliveries!",
			params = {
                event = "burgershot:delivery2",
            }
        }
    })
end)

RegisterNetEvent("burgershot:delivery2")
AddEventHandler("burgershot:delivery2", function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "🡸 Go Back",
            txt = "",
            params = {
                event = "burgershot:delivery"
            }
        },
        {
            id = 2,
            header = "Spawn",
			txt = "",
			params = {
                event = "burgershot:delivery:truck",
				args = {
					vehicle = "rumpo2"
				}
            }
        },
        {
            id = 3,
            header = "Cancel",
            txt = "",
			params = {
                event = "burgershot:delivery",
           }
        },
    })
end)

RegisterNetEvent("plutorp-burgershot:cook")
AddEventHandler("plutorp-burgershot:cook", function()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Menu",
			txt = "",
        },
        {
            id = 2,
            header = "Patty",
			txt = "1 Raw Patty | 25s",
			params = {
                event = "plutorp-burgershot:startprocess3",
            }
        },
        {
            id = 3,
            header = "Double Patty",
			txt = "2 Raw Patty | 35s",
			params = {
                event = "plutorp-burgershot:startprocess4",
            }
        },
    })
end)

RegisterNetEvent("plutorp-burgershot:fry")
AddEventHandler("plutorp-burgershot:fry", function()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Menu",
			txt = "",
        },
        {
            id = 2,
            header = "Fries",
			txt = "1 Sack Potato | 20s",
			params = {
                event = "plutorp-burgershot:startfryer",
            }
        },
        {
            id = 3,
            header = "Large Fries",
			txt = "3 Sack Potato | 30s",
			params = {
                event = "plutorp-burgershot:startfryer2",
            }
        },
    })
end)



RegisterNetEvent("plutorp-burgershot:colamachine")
AddEventHandler("plutorp-burgershot:colamachine", function()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Menu",
			txt = "",
        },
        {
            id = 2,
            header = "Cola",
			txt = "1 High-Fructose Syrup | 10s",
			params = {
                event = "plutorp-burgershot:getcola",
            }
        },
        {
            id = 3,
            header = "Big Cola",
			txt = "3 High-Fractose Syrup | 15s",
			params = {
                event = "plutorp-burgershot:getcola2",
            }
        },
        {
            id = 4,
            header = "Mikshake",
			txt = "1 Mik-Shake Formula | 10s",
			params = {
                event = "plutorp-burgershot:makeshake",
            }
        },
    })
end)

RegisterNetEvent("burgershot:makeburger")
AddEventHandler("burgershot:makeburger", function()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Menu",
			txt = "",
        },
        {
            id = 2,
            header = "Bleeder",
			txt = "2 Buns, 1 Cheese, 1 Lettuce, 1 Patty | 25s",
			params = {
                event = "burgershot:bleeder",
            }
        },
        {
            id = 3,
            header = "Heart Stopper",
			txt = "2 Buns, 1 Cheese, 1 Lettuce, 1 Patty | 25s",
			params = {
                event = "burgershot:heartstopper",
            }
        },
        {
            id = 4,
            header = "Torpedo",
			txt = "2 Buns, 1 Cheese, 1 Lettuce, 1 Patty | 25s",
			params = {
                event = "burgershot:torpedo",
            }
        },
        {
            id = 5,
            header = "Meat Free",
			txt = "2 Buns, 1 Lettuce | 10s",
			params = {
                event = "burgershot:meatfree",
            }
        },
        {
            id = 6,
            header = "Questionable Meat Burger",
			txt = "2 Buns, 1 Questionable Meat, 1 Cheese, 1 Lettuce | 25s",
			params = {
                event = "burgershot:qmb",
            }
        },
    })
end)

RegisterNetEvent("burgershot:get:bags")
AddEventHandler("burgershot:get:bags", function()
    TriggerEvent('player:receiveItem', 'burgershotbag', 1)
end)

RegisterNetEvent('burgershot:delivery:truck')
AddEventHandler('burgershot:delivery:truck', function(type)
	SpawnVehBurgerShot(type.vehicle)	
end)

-- delivery

--##########--
--###Peds###--
--##########--

function BurgerShot()
    --worker--
    modelHash = GetHashKey("csb_burgerdrug")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,-1199.650, -902.31, 13.0, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 299.457 )
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
end

Citizen.CreateThread(function()
	BurgerShot()
end)
