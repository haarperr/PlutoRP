RegisterNetEvent('sellgamingpc')
AddEventHandler('sellgamingpc', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("gamingpc",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling gaming pc")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'gamingpc', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(320,610))
            TriggerEvent('DoLongHudText', 'You successfully sold a gaming pc.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a gaming pc to sell', 2)
    end
end)

RegisterNetEvent('sellgamingmouse')
AddEventHandler('sellgamingmouse', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("gamingmouse",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling gaming mouse")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'gamingmouse', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(100,265))
            TriggerEvent('DoLongHudText', 'You successfully sold a gaming mouse.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a gaming mouse to sell', 2)
    end
end)

RegisterNetEvent('sellgamingkeyboard')
AddEventHandler('sellgamingkeyboard', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("gamingkeyboard",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling gaming keyboard")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'gamingkeyboard', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(150,267))
            TriggerEvent('DoLongHudText', 'You successfully sold a gaming keyboard.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a gaming keyboard to sell', 2)
    end
end)

RegisterNetEvent('sellnitendos')
AddEventHandler('sellnitendos', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("nitendoswitch",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Nitendo Switch")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'nitendoswitch', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(200,356))
            TriggerEvent('DoLongHudText', 'You successfully sold a nitendo switch.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a nitendo switch to sell', 2)
    end
end)

RegisterNetEvent('sellps5')
AddEventHandler('sellps5', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("ps5",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling ps5")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'ps5', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(310,610))
            TriggerEvent('DoLongHudText', 'You successfully sold a ps5.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a ps5 to sell', 2)
    end
end)

-- Sell car parts

RegisterNetEvent('sellcarhood')
AddEventHandler('sellcarhood', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("carhood",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling car hood")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'carhood', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(330,960))
            TriggerEvent('DoLongHudText', 'You successfully sold a car hood.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a car hood to sell', 2)
    end
end)

RegisterNetEvent('sellcarbattery')
AddEventHandler('sellcarbattery', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("carbattery",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling car battery")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'carbattery', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(330,960))
            TriggerEvent('DoLongHudText', 'You successfully sold a car battery.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a car battery to sell', 2)
    end
end)

-- sell turtles

RegisterNetEvent('sellturtle')
AddEventHandler('sellturtle', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("turtle",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling turtle")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'turtle', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(90,120))
            TriggerEvent('DoLongHudText', 'You successfully sold a turtle.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a turtle to sell', 2)
    end
end)

RegisterNetEvent('sellbobross')
AddEventHandler('sellbobross', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("bobross",1,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Bob Ross")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'bobross', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(25,75))
            TriggerEvent('DoLongHudText', 'You successfully sold a Bob Ross.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have a Bob Ross to sell', 2)
    end
end)

--#########--
--#Fishing#--
--#########--

RegisterNetEvent("fishingmenu")
AddEventHandler("fishingmenu", function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
			id = "1",
			header = "Fishing Selling",
            txt = ""
		},
		{
			id = "2",
			header = "Sell Fish",
			txt = "Sell yo Fish",
			params = {
				event = "sellfish",
			}
		},
		{
			id = "3",
			header = "Sell Mackerel",
			txt = "Sell yo shit",
			params = {
				event = "sellmackerel",
			}
		},
		{
			id = "4",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)

RegisterNetEvent('sellfish')
AddEventHandler('sellfish', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("fish",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Fish")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'fish', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(50,150))
            TriggerEvent('DoLongHudText', 'You successfully sold a your fish!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have any fish to sell!', 2)
    end
end)

RegisterNetEvent('sellmackerel')
AddEventHandler('sellmackerel', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("fishingmackerel",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Mackerel")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'fishingmackerel', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(75,175))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Mackerel!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have any Mackerel to sell!', 2)
    end
end)