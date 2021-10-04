RegisterNetEvent("autoexotics:bill")
AddEventHandler("autoexotics:bill", function()
    local bill = exports["plutorp-applications"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill then
        TriggerServerEvent("autoexotics:bill", bill[1].input, bill[2].input)
    end
end)

RegisterCommand('autoexoticsbill', function(source)
	local job = exports["plutorp_manager"]:isPed("myjob")
	if job == 'auto_exotics' then
		TriggerEvent('autoexotics:bill')
    else
        TriggerEvent('DoLongHudText', 'You dont work at Auto Exotics', 2)
	end
end)