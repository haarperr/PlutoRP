RegisterServerEvent("grandmas:attemt:checkin", function()
  local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
  if (user:getBalance() >= 1000) then
    TriggerClientEvent("grandmas:success:attemt", src)
  else
    TriggerClientEvent("DoLongHudText", src, "You need $1000 in your bank account")
  end
end)

RegisterServerEvent("grandmas:bill", function()
  local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
  user:removeBank(1000)
end)