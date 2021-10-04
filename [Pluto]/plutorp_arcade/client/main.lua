-------------------
-- Exports
-------------------
-- MenuAPI = exports.MenuAPI
-------------------
-- variables for arcade and time left
-------------------
gotTicket = false

minutes = 0
seconds = 0
-------------------
function doesPlayerHaveTicket()
    return gotTicket
end

exports('doesPlayerHaveTicket', doesPlayerHaveTicket)

--count time
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if gotTicket then
            if hasPlayerRunOutOfTime() then
                showNotification(_U("ticket_expired"))
                gotTicket = false

                SendNUIMessage({
                    type = "off",
                    game = "",
                })
                SetNuiFocus(false, false)
            end

            countTime()
            displayTime()
        end
    end
end)

--create npc, blip, marker
Citizen.CreateThread(function()
    for k, v in pairs(Config.Arcade) do
        local newPos = v.marker.markerPosition - vector3(0, 0, 0.4)
        local computerMarker = createMarker()

        computerMarker.setKeys({38})

        computerMarker.setRenderDistance(10)
        computerMarker.setPosition(newPos)

        computerMarker.render()

        computerMarker.setColor(v.marker.options.color)
        computerMarker.setScale(v.marker.options.scale)
        computerMarker.setType(v.marker.markerType)

        computerMarker.on('enter', function()
            showHelpNotification(_U("open_ticket_menu"))
        end)
        computerMarker.on('leave', function()
            MenuAPI:CloseAll()
        end)
        computerMarker.on('key', function()
            if gotTicket == false then
                playerBuyTicketMenu()
            else
                returnTicketMenu()
            end
        end)

        if v.blip and v.blip.enable then
            createBlip(v.blip.name, v.blip.blipId, v.blip.position, v.blip)
        end

        createLocalPed(4, v.NPC.model, v.NPC.position, v.NPC.heading, function(ped)
            SetEntityAsMissionEntity(ped)
            SetBlockingOfNonTemporaryEvents(ped, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
        end)
    end
end)

--create markers for computers
Citizen.CreateThread(function()
    for k, v in pairs(Config.computerList) do
        local newPos = v.position - vector3(0, 0, 0.4)
        local computerMarker = createMarker()

        computerMarker.setKeys({38})

        computerMarker.setRenderDistance(10)
        computerMarker.setPosition(newPos)

        computerMarker.render()

        computerMarker.setColor(v.markerOptions.color)
        computerMarker.setScale(v.markerOptions.scale)
        computerMarker.setType(v.markerType)

        computerMarker.setRotation(v.markerOptions.rotate)

        computerMarker.on('enter', function()
            showHelpNotification(_U("open_computer"))
        end)
        computerMarker.on('leave', function()
            MenuAPI:CloseAll()
        end)
        computerMarker.on('key', function()
            openComputerMenu(v.computerType, v)
        end)
    end
end)

RegisterNetEvent("arcade:register")
AddEventHandler("arcade:register", function(registerID)
    local myJob = exports["plutorp_manager"]:isPed("myJob")
    if myJob == "videogeddon_arcade" then
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
            TriggerServerEvent("arcade_bar:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("arcade:get:receipt")
AddEventHandler("arcade:get:receipt", function(registerid)
    TriggerServerEvent('arcade:retreive:receipt', registerid)
end)

RegisterNetEvent('arcade:cash:in')
AddEventHandler('arcade:cash:in', function()
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("arcade:update:pay", cid)
end)


RegisterNetEvent('arcade:enter')
AddEventHandler('arcade:enter', function()
	DoScreenFadeOut(1)
	Citizen.Wait(100)
	TriggerEvent("dooranim")
	TriggerEvent('InteractSound_CL:PlayOnOne', 'DoorOpen', 0.8)
	SetEntityCoords(PlayerPedId(), 757.22076416016, -816.11041259766, 26.507074356079)
	SetEntityHeading(PlayerPedId(), 97.8193359375)
	DoScreenFadeIn(1000)
	Citizen.Wait(1000)
end)

RegisterNetEvent('arcade:exit')
AddEventHandler('arcade:exit', function()
	DoScreenFadeOut(1)
	Citizen.Wait(100)
	TriggerEvent("dooranim")
	TriggerEvent('InteractSound_CL:PlayOnOne', 'DoorOpen', 0.8)
	SetEntityCoords(PlayerPedId(), 758.64898681641, -816.02105712891, 26.293067932129)
	SetEntityHeading(PlayerPedId(), 264.00790405273)
	DoScreenFadeIn(1000)
	Citizen.Wait(1000)
end)
local barricade = "prop_mb_sandblock_03"

RegisterCommand('addblock', function()
    local rank = exports["plutorp_manager"]:GroupRank("videogeddon_arcade")
    if rank > 4 then
        local src = source
        local plypos = GetEntityCoords(PlayerPedId())
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent("animation:impound")
            local finished = exports["plutorp-taskbar"]:taskBar("5000","Completing Task")
            if finished == 100 then
                local place = CreateObject(GetHashKey(barricade), 718.06799316406, -767.62799072266, 24.904331207275 -1.10, 1, 1, 1)
                FreezeEntityPosition(place,true)
                SetEntityHeading(place,GetEntityHeading(place)+360.0)
                TriggerEvent("DoLongHudText","Road Blocks Added!",1)

            end
        end
    else 
        TriggerEvent("DoLongHudText", "Access Required!", 2)
    end
end)

RegisterCommand('deleteblock', function()
    local rank = exports["plutorp_manager"]:GroupRank("videogeddon_arcade")
    if rank > 4 then
        local src = source
        local plypos = GetEntityCoords(PlayerPedId())
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent("animation:impound")
            local finished = exports["plutorp-taskbar"]:taskBar("5000","Completing Task")
            if finished == 100 then
                local shit = GetClosestObjectOfType(plypos.x, plypos.y, plypos.z, 20.0, GetHashKey(barricade), 1, 1, 1)
                Delete(shit)
                TriggerEvent("DoLongHudText","Road Blocks Removed!",1)
            end
        end
    else 
        TriggerEvent("DoLongHudText", "Access Required!", 2)
    end
end)

function Delete(object)
	SetEntityAsMissionEntity(object, false, true)
	DeleteEntity(object)
end

local clothes = false


Citizen.CreateThread(function()
    exports["plutorp-polyzone"]:AddBoxZone("changeclothes", vector3(734.78, -807.76, 16.28), 1.2, 1, {
		name="changeclothes",
        heading=0,
        minZ=13.48,
        maxZ=17.48
    }) 
end)

RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "changeclothes" then
        clothes = true
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("[/outfits] %s"):format("Change Outfits")) 
        TriggerEvent("plutorp-clothingmenu:enable", true)
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
  if name == "changeclothes" then
    clothes = false
  end
  TriggerEvent('plutorp-textui:HideUI')
end)


