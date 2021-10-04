RegisterNetEvent("Best_buds:register")
AddEventHandler("Best_buds:register", function(registerID)
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
            TriggerServerEvent("Best_buds:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("Best_buds:get:receipt")
AddEventHandler("Best_buds:get:receipt", function(registerid)
    TriggerServerEvent('Best_buds:retreive:receipt', registerid)
end)

RegisterNetEvent('Best_buds:cash:in')
AddEventHandler('Best_buds:cash:in', function()
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("Best_buds:update:pay", cid)
end)

RegisterNetEvent('best_buds:owner:stash')
AddEventHandler('best_buds:owner:stash', function()
    local rank = exports["plutorp_manager"]:GroupRank("best_buds")
    if rank < 4 then
        local player = GetEntityCoords(PlayerPedId())
        local distance = #(vector3(380.75, -818.81, 29.302) - player)
        if distance < 1.5 then   
            TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Best Buds Stash")) 
        end
    end
end)
