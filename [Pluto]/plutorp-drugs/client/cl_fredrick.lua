RegisterNetEvent('speaktofredrick1')
AddEventHandler('speaktofredrick1', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("vpnxj",1,false) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        ExecuteCommand("e argue")
        local finished = exports["plutorp-taskbar"]:taskBar(13000,"Speaking to fredrick")
        if finished == 100 then
            FreezeEntityPosition(GetPlayerPed(-1),false)
            TriggerEvent("fredrickmenu")
            TriggerEvent('DoLongHudText', 'What are you in need of?', 1)
            ExecuteCommand("e c")
        else
            TriggerEvent('DoLongHudText', 'Fredrick - Fuck you then pussy', 2)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        end
    else
        TriggerEvent('DoLongHudText', 'A vpn could be useful for this!', 2)
    end
end)

-- laptop 1

RegisterNetEvent('basiclaptop1')
AddEventHandler('basiclaptop1', function()
	FreezeEntityPosition(GetPlayerPed(-1),true)
	ExecuteCommand("e think2")
	local finished = exports["plutorp-taskbar"]:taskBar(13000,"Fredrick - Give me a sec")
	if finished == 100 then
		FreezeEntityPosition(GetPlayerPed(-1),false)
		TriggerEvent("player:receiveItem", "jimpass", 1)
		TriggerServerEvent("jimpass")
		TriggerEvent("phone:addnotification", "Fredrick","i have located a seller behind pillbox in the corner of the bus station, head over and speak to him.")
		ExecuteCommand("e c")
	else
		TriggerEvent('DoLongHudText', 'Fredrick - Fuck you then pussy', 2)
		ExecuteCommand("e c")
		FreezeEntityPosition(GetPlayerPed(-1),false)
	end
end)

RegisterNetEvent('jim:laptop1')
AddEventHandler('jim:laptop1', function()
	if exports["plutorp-inventory"]:hasEnoughOfItem("jimpass",1,false) then
		FreezeEntityPosition(GetPlayerPed(-1),true)
		ExecuteCommand("e think")
		TriggerEvent("mt:missiontext", "Yo dawg you want a laptop?", "1")
		Citizen.Wait(5000)
		ClearPrints()
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ExecuteCommand("e c")
		TriggerEvent("jimmenu")
	else
		TriggerEvent("DoLongHudText", "Nice try you shitlord | You are missing 1 Step Go and find it!", 2)
	end

end)

RegisterNetEvent('fuckdhat')
AddEventHandler('fuckdhat', function()
	TriggerEvent('DoLongHudText', 'Fuck you then pussy!', 2)
end)

RegisterNetEvent('buy:laptop1')
AddEventHandler('buy:laptop1', function()
	FreezeEntityPosition(GetPlayerPed(-1),true)
	local finished = exports["plutorp-taskbar"]:taskBar(6000,"ight dawg slide me 2.5k")
	if finished == 100 then
		FreezeEntityPosition(GetPlayerPed(-1),false)
		TriggerServerEvent("laptop1cash")
		TriggerEvent('inventory:removeItem', 'jimpass', 1)
		TriggerEvent("player:receiveItem", "laptop1", 1)
	else 
		TriggerEvent('DoLongHudText', 'bro ur dumb!', 2)
		FreezeEntityPosition(GetPlayerPed(-1),false)
	end

end)

RegisterNetEvent('notyetbro')  -- need to write the other laptop's functions.
AddEventHandler('notyetbro', function()
	TriggerEvent('DoLongHudText', 'Currenly Have no sellers avalible!', 2)
end)

--  Main Menu

RegisterNetEvent("fredrickmenu")
AddEventHandler("fredrickmenu", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Basic Laptop",
			txt = "Yellow Laptop",
			params = {
				event = "basiclaptop1",
			}
		},
		{
			id = "5",
			header = "Close Menu",
			txt = "Fuck Fredrick",
			params = {
				event = "",
			}
		},
	})
end)

-- jim menu

RegisterNetEvent("jimmenu")
AddEventHandler("jimmenu", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Yer",
			txt = "Buy laptop",
			params = {
				event = "buy:laptop1",
			}
		},
        {
			id = "2",
			header = "na",
			txt = "no fuck the laptop",
			params = {
				event = "fuckdhat",
			}
		},
		{
			id = "5",
			header = "Close Menu",
			txt = "Stop speaking to fredrick",
			params = {
				event = "",
			}
		},
	})
end)

RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end)

RegisterCommand("1", function(source, args)
    TriggerEvent("mt:missiontext", "im gonna send you a location of where you need to go", "1")
	Citizen.Wait(1000)
	ClearPrints()
end)


-- VPN Menu

RegisterNetEvent("Karen-Menu")
AddEventHandler("Karen-Menu", function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
			id = "1",
			header = "Karen!",
            txt = ""
		},
		{
			id = "2",
			header = "Purchase VPN",
			txt = "Bring 250 Small roles and we can talk buisness",
			params = {
				event = "kaarensahhoe",
			}
		},
		{
			id = "3",
			header = "Close Menu",
			txt = "Broke Bitch",
			params = {
				event = "",
			}
		},
	})
end)

-- VPN Trade

RegisterNetEvent('kaarensahhoe')
AddEventHandler('kaarensahhoe', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("rollcash",250,false) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        ExecuteCommand("e think")
        local finished = exports["plutorp-taskbar"]:taskBar(13000,"Speaking to Karen")
        if finished == 100 then
			TriggerEvent('inventory:removeItem', 'rollcash', 250)
            FreezeEntityPosition(GetPlayerPed(-1),false)
			TriggerEvent("player:receiveItem", "vpnxj", 1)
            ExecuteCommand("e c")
        else
            TriggerEvent('DoLongHudText', 'Karen Lowkey thinks u weird', 2)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        end
    else
		TriggerEvent('DoLongHudText', 'You need 250 small rolls you shitlord idiot', 2)
	end
end)