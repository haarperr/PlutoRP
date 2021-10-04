NearScubaBoatRental, NearReturnBoat, IronSellSpot, SellUnknown, ProcessFish, NearWeazelNews = false, false, false, false, false, false
CutFish, SellSpotF, ChickenStart, ChickenSpot, MeltingSpot, WashingSpot, NearChopShop, AtChopSell ,Miningstart = false, false, false, false, false, false, false, false
Citizen.CreateThread(function()
    -- Mining
    exports["plutorp-polyzone"]:AddBoxZone("melting_spot", vector3(1084.69, -2001.75, 30.88), 3, 3, {
        name="melting_spot",
        heading=325,
        minZ=28.08,
        maxZ=32.08
    })  
    exports["plutorp-polyzone"]:AddBoxZone("washing_spot", vector3(1987.53, 551.72, 161.79), 9.4, 4, {
        name="washing_spot",
        heading=325,
        minZ=159.59,
        maxZ=162.79
    })  
    -- Scuba
    exports["plutorp-polyzone"]:AddBoxZone("scuba_get_boat", vector3(-1612.81, 5261.71, 3.97), 2.3, 1.5, {
        name="scuba_get_boat",
        heading=115,
        --debugPoly=true,
        minZ=2.97,
        maxZ=4.97
    })  
    exports["plutorp-polyzone"]:AddBoxZone("scuba_return_boat", vector3(-1602.02, 5260.31, 2.09), 7.4, 5, {
        name="scuba_return_boat",
        heading=25,
        --debugPoly=true,
        minZ=-1.11,
        maxZ=3.89
    })  
    exports["plutorp-polyzone"]:AddBoxZone("sell_iron_bars", vector3(2341.04, 3128.18, 48.21), 1.8, 1, {
        name="sell_iron_bars",
        heading=260,
        --debugPoly=true,
        minZ=47.21,
        maxZ=49.21
    }) 
    exports["plutorp-polyzone"]:AddBoxZone("sell_unknown_material", vector3(-1459.32, -413.59, 35.75), 1.8, 1, {
        name="sell_unknown_material",
        heading=75,
        --debugPoly=true,
        minZ=34.55,
        maxZ=36.95
    }) 
    -- Fishing 
    exports["plutorp-polyzone"]:AddBoxZone("fishing_sushi", vector3(-3248.21, 992.68, 12.49), 8.4, 5, {
        name="fishing_sushi",
        heading=85,
        --debugPoly=true,
        minZ=11.49,
        maxZ=13.44
    }) 
    exports["plutorp-polyzone"]:AddBoxZone("fishing_cut", vector3(-3426.17, 974.33, 8.35), 9.4, 4, {
        name="fishing_cut",
        heading=0,
        --debugPoly=true,
        minZ=7.35,
        maxZ=9.2
    }) 
    exports["plutorp-polyzone"]:AddBoxZone("fishing_sell", vector3(-1039.5, -1396.63, 5.42), 4.8, 4, {
        name="fishing_sell",
        heading=345,
        --debugPoly=true,
        minZ=4.42,
        maxZ=6.42
    }) 
    -- Chicken
    exports["plutorp-polyzone"]:AddBoxZone("chicken_sell", vector3(-593.25, -893.08, 25.56), 5, 5, {
        name="chicken_sell",
        heading=0,
        minZ=22.96,
        maxZ=26.96
    })
    exports["plutorp-polyzone"]:AddBoxZone("chicken_start", vector3(2388.54, 5044.33, 45.99), 4.8, 2, {
        name="chicken_start",
        heading=315,
        minZ=43.39,
        maxZ=47.79
    })
    exports["plutorp-polyzone"]:AddBoxZone("idcard", vector3(256.27, -369.48, -44.14), 2.4, 1, {
        name="idcard",
        heading=70,
        --debugPoly=true,
        minZ=-45.14,
        maxZ=-43.54
    }) 
    -- Weazel News Job
    exports["plutorp-polyzone"]:AddBoxZone("Weazel", vector3(-598.17, -929.75, 25.34), 2.9, 5, {
        name="Weazel",
        heading=91,
        --debugPoly=true,
        minZ=22.14,
        maxZ=24.74
    })

    -- mining 
    exports["plutorp-polyzone"]:AddBoxZone("mining_quarry", vector3(-592.03, 2073.39, 131.41), 25, 4, {
        name="mining_quarry",
        heading=15,
        --debugPoly=true,
        minZ=128.81,
        maxZ=132.81
    })  

end)

RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "scuba_get_boat" then
        NearScubaBoatRental = true
        NearScubaBoat()
        if not canSpawn then
            TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Boat rented already")) 
        else
            TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Rent Boat ($400)")) 
        end
    elseif name == 'scuba_return_boat' then
        if veh ~= 0 then
            TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Return Boat")) 
            NearReturnBoat = true
            AtReturnSpot()
        end
    elseif name == "sell_iron_bars" then
        IronSellSpot = true
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Sell Items")) 
        IronSell()
    elseif name == "sell_unknown_material" then
        SellUnknown = true
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Sell Items")) 
        SellUnknownSpot()
    elseif name == "chicken_sell" then
        ChickenSpot = true
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Sell Chicken")) 
        SellSpotChicken()
    elseif name == "chicken_start" then
        ChickenStart = true
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Start Catching Chicken")) 
        StartSpotChicken()
    elseif name == "Weazel" then
        NearWeazelNews = true
        NearWeazelNews2()
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Record The News!"))
    elseif name == "idcard" then
        NearCourthouse = true
        NearCourthouse2()
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("To purchase an ID ($50)"))
    elseif name == "melting_spot" then
        MeltingSpot = true
        Meltmaterials()
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Melt!"))
    elseif name == "washing_spot" then
        WashingSpot = true
        WashStones()
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[E] %s"):format("Wash Stones!"))
    elseif name == "mining_quarry" then
        Miningstart = true
        Minego()
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Mining"))
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
    if name == "scuba_get_boat" then
        NearScubaBoatRental = false
    elseif name == "melting_spot" then
        MeltingSpot = false
    elseif name == "washing_spot" then
        WashingSpot = false
    elseif name == 'scuba_return_boat' then
        NearReturnBoat = false
    elseif name == "sell_iron_bars" then
        IronSellSpot = false
    elseif name == "sell_unknown_material" then
        SellUnknown = false
    elseif name == "fishing_sushi" then
        ProcessFish = false
    elseif name == "fishing_cut" then
        CutFish = false
    elseif name == "fishing_sell" then
        SellSpotF = false
    elseif name == "chicken_sell" then
        ChickenSpot = false
    elseif name == "chicken_start" then
        ChickenStart = false
    elseif name == "Weazel" then
        NearWeazelNews = false
    elseif name == "idcard" then
        NearCourthouse = false
    elseif name == "mining_quarry" then
        Miningstart = false
    end
    TriggerEvent('plutorp-textui:HideUI')
end)

function NearScubaBoat()
    Citizen.CreateThread(function()
        while NearScubaBoatRental do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                if exports["plutorp-inventory"]:hasEnoughOfItem('oxygentank',1,false) or oxyOn then
                    if canSpawn then
                        TriggerEvent("fuckoffdinghyomfgwhyisntitspawning")
                        TriggerServerEvent('plutorp-scuba:checkAndTakeDepo')
                        Citizen.Wait(500)
                        canSpawn = false
                        SetEntityAsMissionEntity(vehicle, true, true)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                        local plate = GetVehicleNumberPlateText(vehicle)
                        TriggerEvent("keys:addNew",vehicle,plate)
                        StartDive()
                    end
                else
                    TriggerEvent('DoLongHudText', 'Sorry Man, You Wont Be Able To Breath Down There, Come Back With A Scuba Tank!.', 1)
                end
            end
        end
    end)
end

function AtReturnSpot()
    Citizen.CreateThread(function()
        while NearReturnBoat do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                DeleteVehicle(veh)
                veh = 0
                TriggerEvent('DoLongHudText', 'Thanks For Returning The Vehicles, Heres some of the Money Back!.', 1)
                RemoveBlip(allBlips)
                RemoveBlip(allBlipsSprite)
                TriggerServerEvent('plutorp-scuba:returnDepo')
                SetEntityCoords(GetPlayerPed(-1), -1605.7166748047, 5259.1162109375, 2.0883903503418)
                SetEntityHeading(GetPlayerPed(-1), 23.752769470215)
                Citizen.Wait(2000)
                canSpawn = true
            end
        end
    end)
end


function IronSell()
    Citizen.CreateThread(function()
        while IronSellSpot do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                if exports["plutorp-inventory"]:hasEnoughOfItem('ironbar',10,false) then
                    local finished = exports["plutorp-taskbar"]:taskBar(2000,"Selling Iron")
                    if (finished == 100) then
                        SellItems()
                    end
                else
                    TriggerEvent('DoLongHudText', 'Your missing something.', 2)
                end
            end
        end
    end)
end

function SellUnknownSpot()
    Citizen.CreateThread(function()
        while SellUnknown do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                if exports["plutorp-inventory"]:hasEnoughOfItem('umetal',10,false) then
                    local finished = exports["plutorp-taskbar"]:taskBar(5000,"Trading")
                    if (finished == 100 and payed == false) then
                        payed = true
                        TriggerServerEvent('plutorp-scuba:makeGold')
                        Citizen.Wait(500)
                        payed = false
                    end
                else
                    TriggerEvent('DoLongHudText', 'Your missing something.', 2)
                end
            end 
        end
    end)
end




function NearWeazelNews2()
    Citizen.CreateThread(function()
        local myJob = exports["plutorp_manager"]:isPed("myJob")
        while NearWeazelNews do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                if canSpawn then
                    TriggerEvent("spawnvan")
                    Citizen.Wait(500)
                    canSpawn = false
                    SetEntityAsMissionEntity(vehicle, true, true)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    local plate = GetVehicleNumberPlateText(vehicle)
                    TriggerEvent("keys:addNew",vehicle,plate)
                    TriggerEvent("makenews")
                end
            else
                TriggerEvent('DoLongHudText', "You Are Not Qualified For This Job", 1)
            end
        end
    end)
end

function Meltmaterials()
    Citizen.CreateThread(function()
        while MeltingSpot do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("SmeltingEvent")
            end
        end
    end)
end

function Minego()
    Citizen.CreateThread(function()
        while MeltingSpot do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("start-mining")
            end
        end
    end)
end

function WashStones()
    Citizen.CreateThread(function()
        while WashingSpot do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("washerevent")
            end
        end
    end)
end

function StartSpotChicken()
    Citizen.CreateThread(function()
        while ChickenStart do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("Lapchickena")
            end
        end
    end)
end

function SellSpotChicken()
    Citizen.CreateThread(function()
        while ChickenSpot do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("Sellchicken")
            end
        end
    end)
end


function SellSpotFish()
    Citizen.CreateThread(function()
        while SellSpotF do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("sellfish")
            end
        end
    end)
end

function NearCourthouse2()
    Citizen.CreateThread(function()
        while NearCourthouse do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerServerEvent("erp:idcard")
            end
        end
    end)
end