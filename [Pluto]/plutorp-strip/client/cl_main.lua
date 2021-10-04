RegisterNetEvent("vanilla:register")
AddEventHandler("vanilla:register", function(registerID)
    local myJob = exports["plutorp_manager"]:isPed("myJob")
    if myJob == "vanilla_unicorn" then
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
            TriggerServerEvent("vanilla:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)



RegisterNetEvent("vanilla:make:drink")
AddEventHandler("vanilla:make:drink", function()
    local myJob = exports["plutorp_manager"]:isPed("myJob")
    if myJob == "vanilla_unicorn" then
        TriggerEvent("server-inventory-open", "1313", "Shop");
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("ammo:shit")
AddEventHandler("ammo:shit", function()
        TriggerEvent("server-inventory-open", "105", "Shop");
end)

RegisterNetEvent("vanilla:get:receipt")
AddEventHandler("vanilla:get:receipt", function(registerid)
    TriggerServerEvent('vanilla:retreive:receipt', registerid)
end)

RegisterNetEvent('vanilla:cash:in')
AddEventHandler('vanilla:cash:in', function()
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("vanilla:update:pay", cid)
end)
