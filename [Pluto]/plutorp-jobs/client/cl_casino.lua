RegisterNetEvent('casino:memb')
AddEventHandler('casino:memb', function()
	TriggerEvent("player:receiveItem",'casinomembership', 1)
end)

RegisterNetEvent("casino-menu")
AddEventHandler("casino-menu", function()
	TriggerEvent('plutorp-context:sendMenu', {
        {
			id = "1",
			header = "Casino",
            txt = ""
		},
        {
			id = "2",
			header = "Grab Casino Membership card!",
			txt = "Casino!!",
			params = {
				event = "casino:memb",
			}
		},
		{
			id = "3",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)