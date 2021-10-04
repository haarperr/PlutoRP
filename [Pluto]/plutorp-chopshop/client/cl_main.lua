GotLocAndCar = false
inArea = false
GotinChopCar = false
isinChopYard = false
gotCarSpawn = false
hasbox = false

Citizen.CreateThread(function()

    while true do

	    Citizen.Wait(1)
	    local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
        if GotLocAndCar == false then
            if IsControlJustReleased(0,38) then
                    TriggerServerEvent("plutorp-chopshop:chopCostMoney")
                TriggerEvent("plutorp-chopshop:start")
                Citizen.Wait(1000)
            end
        end

        if GotLocAndCar == true and GotinChopCar == false then
             if GetDistanceBetweenCoords(currentRoute.PickupCoordinates, pedCoords) < Config.Radius then
                TriggerEvent("DoLongHudText", "You are in the area keep a eye out for a " ..chopcar)
                inArea = true
             else
                inArea = false
             end
        end

        if GotLocAndCar == true and inArea and gotCarSpawn == false then
            if Config.SpawnCar then
                RequestModel(chopcar)
                while not HasModelLoaded(chopcar) do
                     Citizen.Wait(0)
                end
                whereCarSpawn = math.random(1,3)
                if whereCarSpawn == 1 then
                    Wait(1000)
                    car = CreateVehicle(chopcar, currentRoute.carSpawnLocation1.x, currentRoute.carSpawnLocation1.y, currentRoute.carSpawnLocation1.z, currentRoute.Heading1, true, true)
                    --SetNewWaypoint(currentRoute.carSpawnLocation1.x, currentRoute.carSpawnLocation1.y)
                end
                if whereCarSpawn == 2 then
                    Wait(1000)
                    car = CreateVehicle(chopcar, currentRoute.carSpawnLocation2.x, currentRoute.carSpawnLocation2.y, currentRoute.carSpawnLocation2.z, currentRoute.Heading2, true, true)
                    --SetNewWaypoint(currentRoute.carSpawnLocation2.x, currentRoute.carSpawnLocation2.y)
                end
                if whereCarSpawn == 3 then
                    Wait(1000)
                    car = CreateVehicle(chopcar, currentRoute.carSpawnLocation3.x, currentRoute.carSpawnLocation3.y, currentRoute.carSpawnLocation3.z, currentRoute.Heading3, true, true)
                    --SetNewWaypoint(currentRoute.carSpawnLocation3.x, currentRoute.carSpawnLocation3.y)
                end
                gotCarSpawn = true
            end
           

        end

        if GotLocAndCar == true and inArea == true then
           if IsPedInModel(ped, chopcarHash) then
               GotinChopCar = true
               TriggerEvent("DoLongHudText", "You found the car now bring it to the GPS Location and chop it up!")
               SetNewWaypoint(currentRoute.ChopupCoordinates)
                RemoveBlip(radiusBlip)
               local carchopis = GetVehiclePedIsIn(ped, false)
               local yes = SetEntityAsMissionEntity(carchopis,true,true)

           end
       end

       if GotinChopCar == true then
          if GetDistanceBetweenCoords(currentRoute.ChopupCoordinates, pedCoords) < 7.0 then
                isinChopYard = true
          end
      end

      
      if GotinChopCar == true then
          if GetDistanceBetweenCoords(currentRoute.SellboxCoordinates, pedCoords) < 10.0 then
                if IsControlJustReleased(0,38) and hasbox == true then
                    TriggerServerEvent("plutorp-chopshop:serverPay")
                    DropBox()
                    hasbox = false
                end
          end
      end

      if Boot == true and Hood == true and BackRightDoor == true and BackLeftDoor == true and FrontRightDoor == true and FrontLeftDoor == true and Engine == true and hasbox == false then
        Wait(5000)
        SetEntityAsNoLongerNeeded(yes)
        DeleteEntity(yes)
        GotLocAndCar = false
        inArea = false
        GotinChopCar = false
        isinChopYard = false
        hasbox = false
        gotCarSpawn = false
      end 
   end
end)


local chopcarPick = {
    [1] = "Sultan",
    [2] = "Premier",
    [3] = "Asterope",
    [4] = "Baller",
    [5] = "Tailgater"
}


RegisterNetEvent("plutorp-chopshop:menu")
AddEventHandler("plutorp-chopshop:menu", function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "🡸 Go Back",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 2,
            header = "Chop Front Left Door",
            txt = "Chop Front Left Door",
			params = {
                event = "plutorp-chopshop:startChop",
                args = {
                    part = 0,
                    number = 1,
                    id = 3
                }
           }
        },
		{
            id = 3,
            header = "Chop Front Right Door",
            txt = "Chop Front Right Door",
			params = {
                event = "plutorp-chopshop:startChop",
                args = {
                    part = 1,
                    number = 1,
                    id = 4
                }
           }
        },
        {
            id = 4,
            header = "Chop Back Left Door",
            txt = "Chop Back Left Door",
			params = {
                event = "plutorp-chopshop:startChop",
                args = {
                    part = 2,
                    number = 1,
                    id = 5
                }
           }
        },
        {
            id = 5,
            header = "Chop Back Right Door",
            txt = "Chop Back Right Door",
			params = {
                event = "plutorp-chopshop:startChop",
                args = {
                    part = 3,
                    number = 1,
                    id = 6
                }
           }
        },
        {
            id = 6,
            header = "Chop Trunk",
            txt = "Chop Trunk",
			params = {
                event = "plutorp-chopshop:startChop",
                args = {
                    part = 5,
                    number = 1,
                    id = 7
                }
           }
        },
        {
            id = 7,
            header = "Chop Hood",
            txt = "Chop Hood",
			params = {
                event = "plutorp-chopshop:startChop",
                args = {
                    part = 4,
                    number = 1,
                    id = 8
                }
           }
        },

        {
            id = 8,
            header = "Chop Engine",
            txt = "Chop Engine",
			params = {
                event = "plutorp-chopshop:startChop",
                args = {
                    part = 6,
                    number = 1,
                    id = 9
                }
           }
        },
    })
end)

function AnimationDrill(ped)
    TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, false)
end

Engine = false
Hood = false
Boot = false
BackRightDoor = false
BackLeftDoor = false
FrontRightDoor = false
FrontLeftDoor = false

RegisterNetEvent("plutorp-chopshop:startChop")
AddEventHandler("plutorp-chopshop:startChop", function(data)
    local ped = PlayerPedId()
    local number = data.part

    carchopis = GetLastDrivenVehicle(GetPlayerPed(-1), true)
    yes = SetEntityAsMissionEntity(carchopis,true,true)

    if number == 6 and Engine == false and hasbox == false then
         Wait(2000)
         SetVehicleDoorOpen(yes, number, false, false)
         AnimationDrill(ped)
         Wait(2000)
         SetVehicleDoorBroken(yes, number, true)
         ClearPedTasksImmediately(ped)
         Engine = true
         whatPart = "prop_car_engine_01"
         GetBox(whatPart)
         hasbox = true
         SetVehicleEngineHealth(yes, 300)
         SetVehicleEngineOn(yes, false, true, true)
    end

    if number == 0 and FrontLeftDoor == false and hasbox == false then
         Wait(2000)
         SetVehicleDoorOpen(yes, number, false, false)
         AnimationDrill(ped)
         Wait(2000)
         SetVehicleDoorBroken(yes, number, true)
         ClearPedTasksImmediately(ped)
         FrontLeftDoor = true
         whatPart = "prop_car_door_01"
         GetBox(whatPart)
         hasbox = true
    end
    if number == 1 and FrontRightDoor == false and hasbox == false then
         Wait(2000)
         SetVehicleDoorOpen(yes, number, false, false)
         AnimationDrill(ped)
         Wait(2000)
         SetVehicleDoorBroken(yes, number, true)
         ClearPedTasksImmediately(ped)
         FrontRightDoor = true
         whatPart = "prop_car_door_01"
         GetBox(whatPart)
         hasbox = true
    end
    if number == 2 and BackLeftDoor == false and hasbox == false then
         Wait(2000)
         SetVehicleDoorOpen(yes, number, false, false)
         AnimationDrill(ped)
         Wait(2000)
         SetVehicleDoorBroken(yes, number, true)
         ClearPedTasksImmediately(ped)
         BackLeftDoor = true
         whatPart = "prop_car_door_01"
         GetBox(whatPart)
         hasbox = true
    end
    if number == 3 and BackRightDoor == false and hasbox == false then
         Wait(2000)
         SetVehicleDoorOpen(yes, number, false, false)
         AnimationDrill(ped)
         Wait(2000)
         SetVehicleDoorBroken(yes, number, true)
         ClearPedTasksImmediately(ped)
         BackRightDoor = true
         whatPart = "prop_car_door_01"
         GetBox(whatPart)
         hasbox = true
         TriggerEvent("player:receiveItem",'water', 1)
    end
    if number == 4 and Hood == false and hasbox == false then
         Wait(2000)
         SetVehicleDoorOpen(yes, number, false, false)
         AnimationDrill(ped)
         Wait(2000)
         SetVehicleDoorBroken(yes, number, true)
         ClearPedTasksImmediately(ped)
         Hood = true
         whatPart = "prop_car_bonnet_02"
         GetBox(whatPart)

         hasbox = true
    end
    if number == 5 and Boot == false and hasbox == false then
         Wait(2000)
         SetVehicleDoorOpen(yes, number, false, false)
         AnimationDrill(ped)
         Wait(2000)
         SetVehicleDoorBroken(yes, number, true)
         ClearPedTasksImmediately(ped)
         Boot = true
         whatPart = "prop_cardbordbox_04a"
         GetBox(whatPart)
         hasbox = true
    end

end)

function GetBox(whatPart)
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    local model = GetHashKey(whatPart)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(0) end
    local object = CreateObject(model, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(object, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
    CarryPackage = object
end

function DropBox()
    ClearPedTasks(GetPlayerPed(-1))
    DetachEntity(CarryPackage, true, true)
    DeleteObject(CarryPackage)
    CarryPackage = nil
end


RegisterNetEvent("plutorp-chopshop:startChopshop")
AddEventHandler("plutorp-chopshop:startChopshop", function()
    TriggerEvent("plutorp-chopshop:start")
end)

RegisterNetEvent("chopshop:start:event", function()
    TriggerServerEvent("plutorp-chopshop:chopCostMoney", 120)
end)

