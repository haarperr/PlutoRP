RegisterNetEvent('softdrink')
AddEventHandler('softdrink', function()
    ExecuteCommand('e type')
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Making Soft Drink")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'softdrink', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make soft drink', 2)
    end
end)

RegisterNetEvent('fries')
AddEventHandler('fries', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Cooking Fries")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'fries', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make fries', 2)
    end
end)

RegisterNetEvent('eggsbacon')
AddEventHandler('eggsbacon', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Cooking Eggs & Bacon")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'eggsbacon', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make Eggs & Bacon', 2)
    end
end)

RegisterNetEvent('donut')
AddEventHandler('donut', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Making Donut")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'donut', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make a Donut', 2)
    end
end)

RegisterNetEvent('churro')
AddEventHandler('churro', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Making Churro")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'churro', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make a Churro', 2)
    end
end)

RegisterNetEvent('hotdog')
AddEventHandler('hotdog', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Cooking Hotdog")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'hotdog', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make a Hotdog', 2)
    end
end)

RegisterNetEvent('coffee')
AddEventHandler('coffee', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Making Coffee")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'coffee', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make a Coffee', 2)
    end
end)

RegisterNetEvent('greencow')
AddEventHandler('greencow', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    local finished = exports["plutorp-taskbar"]:taskBar(10000,"Making Green Cow")
    if finished == 100 then
        TriggerEvent('player:receiveItem', 'greencow', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
    else
        FreezeEntityPosition(GetPlayerPed(-1),false)
        TriggerEvent('DoLongHudText', 'Failed to make a Green Cow', 2)
    end
end)

RegisterNetEvent("caseys_drinks")
AddEventHandler("caseys_drinks", function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
			id = "1",
			header = "Gallery Insides",
            txt = ""
		},
        {
			id = "2",
			header = "Make Coffee",
			txt = "Coffee",
			params = {
				event = "coffee",
			}
		},
        {
			id = "3",
			header = "Make Soft Drink",
			txt = "Soft Drink",
			params = {
				event = "softdrink",
			}
		},
        {
			id = "4",
			header = "Make Green Cow",
			txt = "Green Cow",
			params = {
				event = "greencow",
			}
		},
		{
			id = "5",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)