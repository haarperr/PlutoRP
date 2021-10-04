RegisterNetEvent('plutorp-textui:ShowUI')
AddEventHandler('plutorp-textui:ShowUI', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

RegisterNetEvent('plutorp-textui:HideUI')
AddEventHandler('plutorp-textui:HideUI', function()
	SendNUIMessage({
		action = 'hide'
	})
end)

