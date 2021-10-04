local nearRepo = false

Citizen.CreateThread(function()
    exports["plutorp-polyzone"]:AddBoxZone("sunrise_shop_repo", vector3(-763.54, -231.13, 36.56), 5.6, 4.4, {
        name="sunrise_shop_repo",
        heading=30,
        minZ=33.86,
        maxZ=37.86
    }) 
end)


RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "sunrise_shop_repo" then
        local job = exports["plutorp_manager"]:isPed("myjob")
        if job == "sunrise_shop" then
            nearRepo = true
            AtRepo()
            TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Repo Vehicle"))
        end
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    if name == "sunrise_shop_repo" then
        local job = exports["plutorp_manager"]:isPed("myjob")
        if job == "sunrise_shop" then
            nearRepo = false
            TriggerEvent('plutorp-textui:HideUI')
        end
    end
end)

function AtRepo()
	Citizen.CreateThread(function()
        while nearRepo do
            Citizen.Wait(5)
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if vehicle ~= 0 then
                local plate = GetVehicleNumberPlateText(vehicle)
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent("plutorp-vehicleshop:repo", plate)
                end
            end
        end
    end)
end