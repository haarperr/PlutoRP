RegisterNetEvent("plutorp-weedstore:startpicking")
AddEventHandler("plutorp-weedstore:startpicking", function()
    local rank = exports["plutorp_manager"]:GroupRank("best_buds")
    if rank > 0 then  
        if exports['plutorp-inventory']:hasEnoughOfItem("qualityscales", 1) then
            local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 355.69338989258)
            local finished = exports['plutorp-taskbar']:taskBar(20000, 'Harvesting')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'driedbud', 6)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
            
        else
            TriggerEvent('DoLongHudText', 'You are missing an item', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You need a license', 2)
    end
end)
RegisterNetEvent("plutorp-weedstore:startpacking")
AddEventHandler("plutorp-weedstore:startpacking", function()
    local rank = exports["plutorp_manager"]:GroupRank("best_buds")
    if rank > 0 then  
        if exports['plutorp-inventory']:hasEnoughOfItem("driedbud", 50) and exports['plutorp-inventory']:hasEnoughOfItem("plastic", 25) then
            local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 186.32456970215)
            local finished = exports['plutorp-taskbar']:taskBar(20000, 'Packaging')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'boxofweed', 1)
                TriggerEvent("inventory:removeItem", "plastic", 25)
                TriggerEvent("inventory:removeItem", "driedbud", 50)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You are missing an item? You Need 25 Plastic and 50 Dried Bud!', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You need a license', 2)
    end
end)


RegisterNetEvent("weedstore:register")
AddEventHandler("weedstore:register", function(registerID)
    local myJob = exports["plutorp_manager"]:isPed("myJob")
    if myJob == "best_buds" then
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
            TriggerServerEvent("weedstore:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("weedstore:get:receipt")
AddEventHandler("weedstore:get:receipt", function(registerid)
    TriggerServerEvent('weedstore:retreive:receipt', registerid)
end)

RegisterNetEvent('weedstore:cash:in')
AddEventHandler('weedstore:cash:in', function()
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("weedstore:update:pay", cid)
end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end