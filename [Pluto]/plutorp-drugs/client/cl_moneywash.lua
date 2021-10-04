RegisterNetEvent('sk1c2:entersecret')
AddEventHandler('sk1c2:entersecret', function()
        ExecuteCommand('e lapdance')
        local cunt = exports["plutorp-taskbar"]:taskBar(13000,"Requesting Entry")
        if cunt == 100 then
                TriggerEvent("secret:enter")
                ExecuteCommand('e c')
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'Entering', 1)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand('e c')
    end
end)


-- Clean Roll Of Cash

RegisterNetEvent('wash:rollcash:10')
AddEventHandler('wash:rollcash:10', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("rollcash",5,false) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        ExecuteCommand("e mechanic")
        local twat = exports["plutorp-taskbar"]:taskBar(50000,"Washing rolls of cash")
        if twat == 100 then
            TriggerEvent("inventory:removeItem", "rollcash", 5)
            TriggerServerEvent('sk1c2:rollcashitem')
            TriggerEvent('DoLongHudText', 'You successfully washed 5x rolls of cash', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        end
    else
        TriggerEvent('DoLongHudText', 'You dont have 5 rolls of cash you shitlord idiot', 2)
    end
end)


RegisterNetEvent('process:rollcash:sk1c2')
AddEventHandler('process:rollcash:sk1c2', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    if exports["plutorp-inventory"]:hasEnoughOfItem("wetcash",5,false) then
        ExecuteCommand("e search")
        local sk1c2 = exports["plutorp-taskbar"]:taskBar(50000,"Processing rolls of cash")
        if sk1c2 == 100 then
            TriggerEvent("inventory:removeItem", "wetcash", 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(300,500))
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        else
            ExecuteCommand("e c")
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
       TriggerEvent('DoLongHudText', 'You do not have x5 Wet Rolls Of Cash', 2 )
        FreezeEntityPosition(GetPlayerPed(-1),false)
        ExecuteCommand("e c")
    end
end)


RegisterNetEvent("rollcash:menu")
AddEventHandler("rollcash:menu", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Clean roll of cash",
			txt = "Clean your Roll of cash you need 5x roles",
			params = {
				event = "wash:rollcash:10",
			}
		},
		{
			id = "2",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)


-- clean stack of cash


RegisterNetEvent("stackcash:menu")
AddEventHandler("stackcash:menu", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Clean stack of cash",
			txt = "Clean your stack of cash 5x required",
			params = {
				event = "wash:cashstack:sk1c2",
			}
		},
		{
			id = "2",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)

RegisterNetEvent('wash:cashstack:sk1c2')
AddEventHandler('wash:cashstack:sk1c2', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("cashstack",5,false) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        ExecuteCommand("e mechanic")
        local twat2 = exports["plutorp-taskbar"]:taskBar(50000,"Washing stack of cash")
        if twat2 == 100 then
            TriggerEvent("inventory:removeItem", "cashstack", 5)
            TriggerServerEvent('sk1c2:stackcashitem')
            TriggerEvent('DoLongHudText', 'You successfully washed 5x stacks of cash', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        end
    else
        TriggerEvent('DoLongHudText', 'You dont have 5 stacks of cash you shitlord idiot', 2)
    end
end)

RegisterNetEvent('process:cashstack:sk1c2')
AddEventHandler('process:cashstack:sk1c2', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    if exports["plutorp-inventory"]:hasEnoughOfItem("wetcash2",5,false) then
        ExecuteCommand("e search")
        local sk1c2 = exports["plutorp-taskbar"]:taskBar(50000,"Processing wet cash stack")
        if sk1c2 == 100 then
            TriggerEvent("inventory:removeItem", "wetcash2", 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(2500,3000))
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        else
            ExecuteCommand("e c")
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
       TriggerEvent('DoLongHudText', 'You do not have x5 Wet Cashstacks!', 2 )
        FreezeEntityPosition(GetPlayerPed(-1),false)
        ExecuteCommand("e c")
    end
end)

RegisterNetEvent('process:band:sk1c2')
AddEventHandler('process:band:sk1c2', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    if exports["plutorp-inventory"]:hasEnoughOfItem("wetcash3",5,false) then
        ExecuteCommand("e search")
        local sk1c2 = exports["plutorp-taskbar"]:taskBar(50000,"Processing wet band")
        if sk1c2 == 100 then
            TriggerEvent("inventory:removeItem", "wetcash3", 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(2000,3500))
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        else
            ExecuteCommand("e c")
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
       TriggerEvent('DoLongHudText', 'You do not have a 5x Wet Bands!', 2 )
        FreezeEntityPosition(GetPlayerPed(-1),false)
        ExecuteCommand("e c")
    end
end)


-- clean band of notes

RegisterNetEvent("bandnotes:menu")
AddEventHandler("bandnotes:menu", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Clean Band of notes",
			txt = "Clean band of notes 5x required",
			params = {
				event = "wash:bandofnotes:sk1c2",
			}
		},
		{
			id = "2",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)

RegisterNetEvent('wash:bandofnotes:sk1c2')
AddEventHandler('wash:bandofnotes:sk1c2', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("band",5,false) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        ExecuteCommand("e mechanic")
        local twat2 = exports["plutorp-taskbar"]:taskBar(50000,"Processing wet band of notes")
        if twat2 == 100 then
            TriggerEvent("inventory:removeItem", "band", 5)
            TriggerServerEvent('sk1c2:banditem')
            TriggerEvent('DoLongHudText', 'You successfully washed 5x bands of notes', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ExecuteCommand("e c")
        end
    else
        TriggerEvent('DoLongHudText', 'You dont have 5 bands of notes you shitlord idiot', 2)
    end
end)
