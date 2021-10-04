RegisterNetEvent("gallery-menu")
AddEventHandler("gallery-menu", function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
			id = "1",
			header = "Gallery Insides",
            txt = ""
		},
		{
			id = "2",
			header = "Sell Rolex Watches",
			txt = "Sell Rolex Watches!",
			params = {
				event = "sellrolex",
			}
		},
		{
			id = "3",
			header = "Sell Gold Bar's",
			txt = "Money Money Money",
			params = {
				event = "sellgoldbar",
			}
		},
        {
			id = "4",
			header = "Sell Blue Diamond",
			txt = "Diamonds!",
			params = {
				event = "selldiamond",
			}
		},
        {
			id = "5",
			header = "Sell Ring",
			txt = "Ring!",
			params = {
				event = "sellring",
			}
		},
        {
			id = "6",
			header = "Sell Gold Chain 10ct Gold",
			txt = "Chains!",
			params = {
				event = "10ctgoldchain",
			}
		},
        {
			id = "7",
			header = "Sell Gold Chain 8ct Gold",
			txt = "Chains!",
			params = {
				event = "sellstolen8ctchain",
			}
		},
        {
			id = "8",
			header = "Sell Gold Chain 2ct Gold",
			txt = "Chains!",
			params = {
				event = "sellstolen2ctchain",
			}
		},
        {
			id = "9",
			header = "Sell Gold Coins!",
			txt = "Coin!!",
			params = {
				event = "sellgoldcoin",
			}
		},
        {
			id = "10",
			header = "Sell Anime Poster!",
			txt = "Anime!!",
			params = {
				event = "sellanime",
			}
		},
		{
			id = "11",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)

RegisterNetEvent('sellrolex')
AddEventHandler('sellrolex', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("rolexwatch",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Rolex Watches")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'rolexwatch', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(350,500))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Rolex Watchs!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Rolexs to sell!', 2)
    end
end)

RegisterNetEvent('sellgoldbar')
AddEventHandler('sellgoldbar', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("goldbar",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Gold Bars")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'goldbar', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(750,1500))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Gold Bars!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Gold Bars to sell!', 2)
    end
end)

RegisterNetEvent('selldiamond')
AddEventHandler('selldiamond', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("bdiamond",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling diamonds")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'bdiamond', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(1000,2000))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Blue Diamond!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Blue Diamond to sell!', 2)
    end
end)

RegisterNetEvent('sellring')
AddEventHandler('sellring', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("erpring",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Rings")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'erpring', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(1500,2500))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Rings!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Rings to sell!', 2)
    end
end)

RegisterNetEvent('10ctgoldchain')
AddEventHandler('10ctgoldchain', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("stolen10ctchain",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling 10ct Gold Chain")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolen10ctchain', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(1250,2250))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Chains!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Chains to sell!', 2)
    end
end)

RegisterNetEvent('sellstolen8ctchain')
AddEventHandler('sellstolen8ctchain', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("stolen8ctchain",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling 8ct Gold Chain")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolen8ctchain', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(750,1250))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Chains!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Chains to sell!', 2)
    end
end)

RegisterNetEvent('sellstolen2ctchain')
AddEventHandler('sellstolen2ctchain', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("stolen2ctchain",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling 2ct Gold Chain")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolen2ctchain', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(250,500))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Chains!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Chains to sell!', 2)
    end
end)

RegisterNetEvent('sellgoldcoin')
AddEventHandler('sellgoldcoin', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("goldcoin",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Gold Coin")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'goldcoin', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(250,500))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Golden Coins!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Golden Coins to sell!', 2)
    end
end)

RegisterNetEvent('sellanime')
AddEventHandler('sellanime', function()
    if exports["plutorp-inventory"]:hasEnoughOfItem("anime",5,false) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Selling Anime Poster")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'anime', 5)
            TriggerServerEvent( 'sk1c2:payout', math.random(100,350))
            TriggerEvent('DoLongHudText', 'You successfully sold a your Golden Coins!', 1)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont have 5x Anime Posters to sell!', 2)
    end
end)