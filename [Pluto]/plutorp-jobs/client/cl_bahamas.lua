RegisterNetEvent("bahamas:register")
AddEventHandler("bahamas:register", function(registerID)
    local myJob = exports["plutorp_manager"]:isPed("myJob")
    if myJob == "bahamas_bar" then
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
            TriggerServerEvent("bahamas_bar:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("bahamas:make:drink")
AddEventHandler("bahamas:make:drink", function()
    local myJob = exports["plutorp_manager"]:isPed("myJob")
    if myJob == "bahamas_bar" or myJob== "videogeddon_arcade" then
        TriggerEvent("server-inventory-open", "1313", "Shop");
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)


RegisterNetEvent("bahamas:get:receipt")
AddEventHandler("bahamas:get:receipt", function(registerid)
    TriggerServerEvent('bahamas:retreive:receipt', registerid)
end)

RegisterNetEvent('bahamas:cash:in')
AddEventHandler('bahamas:cash:in', function()
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("bahamas:update:pay", cid)
end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end