Tuner, auto_exotics, harmony_autos, hayes_autos = false, false, false, false

Citizen.CreateThread(function()
	exports["plutorp-polyzone"]:AddBoxZone("tuner", vector3(933.31, -971.0, 39.54), 30, 15, {
        name="tuner",
        heading=275,
      --  debugPoly=true,
        minZ=36.59,
        maxZ=40.39
    })

    exports["plutorp-polyzone"]:AddBoxZone("auto_exotics", vector3(542.17, -177.28, 54.49), 53.8, 25, {
        name="auto_exotics",
        heading=189,
        --debugPoly=true,
        minZ=53.29,
        maxZ=56.29
    })

    exports["plutorp-polyzone"]:AddBoxZone("harmony_autos", vector3(1178.51, 2640.06, 37.75), 13.8, 10, {
        name="harmony_autos",
        heading=270,
        --debugPoly=true,
        minZ=36.75,
        maxZ=39.15
    })

    exports["plutorp-polyzone"]:AddBoxZone("hayes_autos", vector3(-1419.51, -447.71, 35.91), 26.6, 10, {
        name="hayes_autos",
        heading=302,
        --debugPoly=true,
        minZ=34.91,
        maxZ=38.11
    })
end)


RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    local job = exports["plutorp_manager"]:isPed("myjob")
    if name == "tuner" then
        if job == "tuner_shop" then
            Tuner = true     
        end
    elseif name == "auto_exotics" then
        if job == "auto_exotics" then
            auto_exotics = true
        end
    elseif name == "harmony_autos" then
        if job == "harmony_autos" then
            harmony_autos = true
        end
    elseif name == "hayes_autos" then
        if job == "hayes_autos" then
            hayes_autos = true
        end
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    local job = exports["plutorp_manager"]:isPed("myjob")
    if name == "tuner" then
        if job == "tuner_shop" then
            Tuner = false  
        end    
    elseif name == "auto_exotics" then
        if job == "auto_exotics" then
            auto_exotics = false
        end
    elseif name == "harmony_autos" then
        if job == "harmony_autos" then
            harmony_autos = false
        end
    elseif name == "hayes_autos" then
        if job == "hayes_autos" then
            hayes_autos = false
        end
    end
end)