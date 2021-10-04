RegisterNetEvent("plutorp_arcade:ticketResult")
AddEventHandler("plutorp_arcade:ticketResult", function(ticket)
    showNotification(_U("bought_ticket", ticket, Config.ticketPrice[ticket].time))

    -- Will set time player can be in arcade from Config
    seconds = 1
    minutes = Config.ticketPrice[ticket].time

    -- Tell the script that player has Ticket and can enter.
    gotTicket = true
end)

RegisterNetEvent("plutorp_arcade:nomoney")
AddEventHandler("plutorp_arcade:nomoney", function()
    TriggerEvent("DoLongHudText", "You dont have enough money!", 2)
end)

RegisterNUICallback('exit', function()
    SendNUIMessage({
        type = "off",
        game = "",
    })
    SetNuiFocus(false, false)
end)