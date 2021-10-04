function findClosestSpawnPointDrift(pCurrentPosition)
	local coords = vector3(-122.07105255127, -2533.732421875, 5.9999618530273)
	local closestDistance = -1
	local closestCoord = pCurrentPosition
	local distance = #(coords - pCurrentPosition)
	if closestDistance == -1 or closestDistance > distance then
	  closestDistance = distance
	  closestCoord = coords
	end
	return closestCoord
end

function SpawnVehDrift(name)
    Citizen.CreateThread(function()

        local hash = GetHashKey(name)
        math.random(1, 2)

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local spawnLocation = findClosestSpawnPointDrift(GetEntityCoords(PlayerPedId()))
        local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
        if DoesEntityExist(getVehicleInArea) then
          TriggerEvent("DoLongHudText", "The area is crowded", 2)
          return
        end

        local vehicle = CreateVehicle(hash, -122.07105255127, -2533.732421875, 5.9999618530273, 240.95489501953, true, false)

        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end)
end

RegisterNetEvent('spawn:veh:drift')
AddEventHandler('spawn:veh:drift', function(type)
    SpawnVehDrift(type.vehicle)    
	TriggerEvent("DoLongHudText", "Vehicle Spawned", 1)
end)

RegisterNetEvent('drift:garage')
AddEventHandler('drift:garage', function()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Rental Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Sentinel",
            txt = "Ayo a whip!",
            params = {
                event = "spawn:veh:drift",
                args = {
                    vehicle = "sentinel6str"
                }
            }
        },
        {
            id = 2,
            header = "Sultan RSV8",
            txt = "Ayo a whip!",
            params = {
                event = "spawn:veh:drift",
                args = {
                    vehicle = "sultanrsv8"
                }
            }
        },
        {
            id = 3,
            header = "Evo 9",
            txt = "Ayo a whip!",
            params = {
                event = "spawn:veh:drift",
                args = {
                    vehicle = "evo9"
                }
            }
        },
        {
            id = 4,
            header = "Nissan ER34",
            txt = "Ayo a whip!",
            params = {
                event = "spawn:veh:drift",
                args = {
                    vehicle = "er34"
                }
            }
        },
        {
            id = 5,
            header = "GMW",
            txt = "Ayo a whip!",
            params = {
                event = "spawn:veh:drift",
                args = {
                    vehicle = "m235"
                }
            }
        },
        {
            id = 6,
            header = "Drift Lambo",
            txt = "Ayo a whip!",
            params = {
                event = "spawn:veh:drift",
                args = {
                    vehicle = "lwlp670"
                }
            }
        },
        {
            id = 7,
            header = "Close Menu",
            txt = "Exit the menu!",
            params = {
                event = "",
            }
        },
    })
end)