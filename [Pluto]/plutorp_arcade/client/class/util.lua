function showSubtitle(message, time)
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(time, 1)
end

function playerBuyTicketMenu()


    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Arcade Booth",
            txt = ""
        },

        {
            id = 2,
            header = "Bronze (Blue Ticket)",
			txt = "Purchase Blue Ticket",
			params = {
                event = "plutorp-arcade:buyTicket",
                args = '1'
            }
        },

        {
            id = 3,
            header = "Silver (Pink Tikcet)",
			txt = "Purchase Pink Ticket",
			params = {
                event = "plutorp-arcade:buyTicket",
                args = '2'

            }
        },

        {
            id = 4,
            header = "Gold (Gold Ticket)",
			txt = "Purchase Gold Ticket",
			params = {
                event = "plutorp-arcade:buyTicket",
                args = '3'

            }
        },

        {
            id = 5,
            header = "Cancel",
			txt = "Cancel because you broke af!",
			params = {
                event = ""
            }
        },
    })

end

RegisterNetEvent('plutorp-arcade:buyTicket')
AddEventHandler('plutorp-arcade:buyTicket', function(args)
    local args = tonumber(args)
    if args == 1 then 
        if exports["plutorp-inventory"]:hasEnoughOfItem("blueticket",1) then
            TriggerEvent("inventory:removeItem","blueticket", 1)
            TriggerServerEvent("plutorp_arcade:buyTicket", 'bronz')
        else
            TriggerEvent("DoLongHudText", "You need to buy a ticket!", 2)
        end
    elseif args == 2 then 
        if exports["plutorp-inventory"]:hasEnoughOfItem("pinkticket",1) then
            TriggerEvent("inventory:removeItem","pinkticket", 1)
            TriggerServerEvent("plutorp_arcade:buyTicket", 'silver')
        else
            TriggerEvent("DoLongHudText", "You need to buy a ticket!", 2)
        end
    else
        if exports["plutorp-inventory"]:hasEnoughOfItem("goldticket",1) then
            TriggerEvent("inventory:removeItem","goldticket", 1)
            TriggerServerEvent("plutorp_arcade:buyTicket", 'gold')
        else
            TriggerEvent("DoLongHudText", "You need to buy a ticket!", 2)
        end
    end

end)

RegisterNetEvent('plutorp-arcade:returnticket')
AddEventHandler('plutorp-arcade:returnticket', function(args)
    local args = tonumber(args)
    if args == 1 then 
        minutes = 0
        seconds = 0 
        gotTicket = false
    else
        return

    end
end)

function returnTicketMenu()
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Arcade Booth",
            txt = ""
        },

        {
            id = 2,
            header = "Return Ticket",
			txt = "Stop using arcade",
			params = {
                event = "plutorp-arcade:returnticket",
                args = '1'
            }
        },

        {
            id = 3,
            header = "Cancel Return",
			txt = "Close Menu",
			params = {
                event = ""

            }
        },

    })
end

function showHelpNotification(text)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true,5000)
end

function showNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(0, 1)
end

function createBlip(name, blip, coords, options)
    local x, y, z = table.unpack(coords)
    local ourBlip = AddBlipForCoord(x, y, z)
    SetBlipSprite(ourBlip, blip)
    if options.type then SetBlipDisplay(ourBlip, options.type) end
    if options.scale then SetBlipScale(ourBlip, options.scale) end
    if options.color then SetBlipColour(ourBlip, options.color) end
    if options.shortRange then SetBlipAsShortRange(ourBlip, options.shortRange) end
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(ourBlip)
    return ourBlip
end

function createLocalPed(pedType, model, position, heading, cb)
    requestModel(model, function()
        local ped = CreatePed(pedType, model, position.x, position.y, position.z, heading, false, false)
        SetModelAsNoLongerNeeded(model)
        cb(ped)
    end)
end

function requestModel(modelName, cb)
    if type(modelName) ~= 'number' then
        modelName = GetHashKey(modelName)
    end

    local breaker = 0

    RequestModel(modelName)

    while not HasModelLoaded(modelName) do
        Citizen.Wait(1)
        breaker = breaker + 1
        if breaker >= 100 then
            break
        end
    end

    if breaker >= 100 then
        cb(false)
    else
        cb(true)
    end
end

RegisterNetEvent('plutorp-arcade:playArcade')
AddEventHandler('plutorp-arcade:playArcade', function(args)
    local args = tonumber(args)
    if args == 1 then 
        SendNUIMessage({
            type = "on",
            game = 'http://xogos.robinko.eu/PACMAN/',
            gpu = Config.GPUList[2],
            cpu =  Config.CPUList[2],
            SetNuiFocus(true, true)
        })
        elseif args == 2  then
            SendNUIMessage({
                type = "on",
                game = 'http://xogos.robinko.eu/TETRIS/',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[2],
                SetNuiFocus(true, true)
            })
        elseif args == 3 then
            SendNUIMessage({
                type = "on",
                game = 'http://xogos.robinko.eu/PONG/',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[2],
                SetNuiFocus(true, true)
            })
        elseif args == 4 then
            SendNUIMessage({
                type = "on",
                game = 'http://lama.robinko.eu/fullscreen.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[2],
                SetNuiFocus(true, true)
            })
        elseif args == 5 then
            SendNUIMessage({
                type = "on",
                game = 'http://uno.robinko.eu/fullscreen.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[2],
                SetNuiFocus(true, true)
            })
        elseif args == 6 then
            SendNUIMessage({
                type = "on",
                game = 'http://ants.robinko.eu/fullscreen.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[2],
                SetNuiFocus(true, true)
            })
        elseif args == 7 then
            SendNUIMessage({
                type = "on",
                game = 'http://xogos.robinko.eu/FlappyParrot/',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[2],
                SetNuiFocus(true, true)
            })
        else  
            SendNUIMessage({
                type = "on",
                game = 'http://zoopaloola.robinko.eu/Embed/fullscreen.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[2],
                SetNuiFocus(true, true)
            })
    end
end) 

function openComputerMenu(listGames, computer_)
    local computer = computer_
    local index = 0
    if not gotTicket and computer.isInGamingHouse then
        TriggerEvent('DoLongHudText', 'You do not have a ticket', 2)
        return
    end
    TriggerEvent('plutorp-context:sendMenu', {
        {
            id = 1,
            header = "Game Selection",
            txt = ""
        },

        {
            id = 2,
            header = "Play Pacman",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '1'
            }
        },

        {
            id = 3,
            header = "Play Tetris",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '2'

            }
        },

        {
            id = 4,
            header = "Play PingPong",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '3'

            }
        },

        {
            id = 5,
            header = "Play Slide a Lama",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '4'

            }
        },


        {
            id = 6,
            header = "Play Uno",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '5'

            }
        },
        {
            id = 7,
            header = "Play Ants",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '6'

            }
        },

        {
            id = 8,
            header = "Play FlappyParrot",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '7'

            }
        },

        {
            id = 9,
            header = "Play Zoopaloola",
			txt = "",
			params = {
                event = "plutorp-arcade:playArcade",
                args = '8'

            }
        },


        {
            id = 10,
            header = "Cancel Menu",
			txt = "",
			params = {
                event = ""
            }
        },
    })
end

function hasPlayerRunOutOfTime()
    return (minutes == 0 and seconds <= 1)
end

function countTime()
    seconds = seconds - 1
    if seconds == 0 then
        seconds = 59
        minutes = minutes - 1
    end

    if minutes == -1 then
        minutes = 0
        seconds = 0
    end
end

function displayTime()
    showSubtitle(_U("time_left_count", minutes, seconds), 1001)
end