RegisterServerEvent('erp:idcard')
AddEventHandler('erp:idcard', function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    if (tonumber(user:getCash()) >= 50) then
        user:removeMoney(50)
        TriggerClientEvent('courthouse:idbuy', src)
    else
        TriggerClientEvent("DoLongHudText", src, "You need $50", 2)
    end
end)

RegisterServerEvent('cash:remove')
AddEventHandler('cash:remove', function(pSrc, amount)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(tonumber(pSrc))
	if (tonumber(user:getCash()) >= amount) then
		user:removeMoney(amount)
	end
end)