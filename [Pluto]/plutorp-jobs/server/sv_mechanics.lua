RegisterServerEvent('autoexotics:bill')
AddEventHandler("autoexotics:bill", function(TargetID, amount)
	local src = source
	local target = tonumber(TargetID)
	local cost = tonumber(amount)
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(target)
	local characterId = user:getCurrentCharacter().id
	if user ~= false then
		if cost > 0 then
			user:removeBank(cost)
			TriggerClientEvent('DoLongHudText', target, "You have been billed by an Auto Exotic Worker $"..cost, 1)
			TriggerClientEvent('DoLongHudText', src, "You have successfully wrote a bill for $"..cost, 1)
			exports["plutorp-banking"]:UpdateSociety(cost, "auto_exotics", "add")
		end
	end
end)