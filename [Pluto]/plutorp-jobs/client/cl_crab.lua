crabcatch = false

Citizen.CreateThread(function()
	exports["plutorp-polyzone"]:AddBoxZone("crab_catch1", vector3(2258.89, 4574.31, 32.04), 80, 6, {
		name="crab_catch1",
		heading=100,
        minZ=27.64,
        maxZ=31.64
	})
    exports["plutorp-polyzone"]:AddBoxZone("crab_catch2", vector3(2218.81, 4580.45, 31.02), 20, 8, {
		name="crab_catch2",
		heading=10,
        minZ=28.42,
        maxZ=31.42
	})
	  
end)

RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "crab_catch1" or name == "crab_catch2" then
        crabcatch = true
        plutorpcrabsyo()
		TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Start Catching Crabs")) 
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    if name == "crab_catch1" or name == "crab_catch2" then
        crabcatch = false
    end
    TriggerEvent('plutorp-ui:HideUI')
end)


function plutorpcrabsyo()
    Citizen.CreateThread(function()
        while crabcatch do
            Citizen.Wait(5)
            if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) ~= 1 then
                local cunt = exports["plutorp-inventory"]:hasEnoughOfItem("crabcage",1,false) 
                if cunt then
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    ExecuteCommand("e gardening")
                    local finished = exports["plutorp-taskbar"]:taskBar(15000,"Searching for crabs")
                    if (finished == 100) then
                        if math.random(3) == 2 then
                            TriggerEvent("player:receiveItem","crab", math.random(1,2))	
                            ExecuteCommand("e c")
                            FreezeEntityPosition(GetPlayerPed(-1),false)
                        else
                            TriggerEvent('DoLongHudText', 'You didnt find any crabs', 1 )
                            FreezeEntityPosition(GetPlayerPed(-1),false)
                        end
                    else
                        TriggerEvent('DoLongHudText', 'cancelled', 2 )
                        ExecuteCommand("e c")
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                    end
                else
                    TriggerEvent('DoLongHudText', 'You dont have a crab cage head over to mega mall to buy one', 2)
                end
            end
        end
    end)
end

local crabsell = false

Citizen.CreateThread(function()
    exports["plutorp-polyzone"]:AddBoxZone("crab_sell", vector3(903.15, -1723.39, 32.16), 3, 3, {
        name="crab_sell",
        heading=0,
        minZ=29.36,
        maxZ=33.36
    })  
end)

RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "crab_sell" then
        crabsell = true
        plutorpsellyocrabs()
		TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Sell Crabs")) 
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    if name == "crab_sell" then
        crabsell = false
    end
    TriggerEvent('plutorp-ui:HideUI')
end)

function plutorpsellyocrabs()
    Citizen.CreateThread(function()
        while crabsell do
            Citizen.Wait(5)
			if exports["plutorp-inventory"]:hasEnoughOfItem("crab",1,false) then
                if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) ~= 1 then
                        FreezeEntityPosition(GetPlayerPed(-1),true)
                        ExecuteCommand("e id")
                        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Selling Crabs")
                        if finished == 100 then
                            TriggerEvent('inventory:removeItem', 'crab', 1)
                            TriggerServerEvent( 'sk1c2:payout', math.random(110,160))
                            FreezeEntityPosition(GetPlayerPed(-1),false)
                            ExecuteCommand("e c")
                            TriggerEvent('DoLongHudText', 'You successfully sold a crab', 1)
                        else
                            TriggerEvent('DoLongHudText', 'Cancelled', 2)
                            ExecuteCommand("e c")
                            FreezeEntityPosition(GetPlayerPed(-1),false)
                        end
                end        
            else
                TriggerEvent('DoLongHudText', 'You dont have any crabs to sell', 2)
            end
        end
    end)
end