RegisterServerEvent('NewsStandCheckFinish')
AddEventHandler('NewsStandCheckFinish', function(strg, strg2)
  local src = source
TriggerClientEvent('NewsStandCheckFinish', src, strg, strg2)
end)

local recentconvictions = {}


RegisterServerEvent('lastconviction')
AddEventHandler('lastconviction', function(newconv)
  print(newconv)
  recentconvictions[#recentconvictions+1] = newconv
  TriggerClientEvent("lastconvictionlist",-1,recentconvictions)
end)


RegisterServerEvent('currentconvictions')
AddEventHandler('currentconvictions', function(newconv)
  TriggerClientEvent("lastconvictionlist",-1,recentconvictions)
end)


RegisterCommand('news', function(source)
  local src = source
  TriggerClientEvent('NewsStandCheck', src)
end)
    

RegisterServerEvent("stringGangGlobalReputations")
AddEventHandler("stringGangGlobalReputations", function()
  local src = source
  TriggerClientEvent("stringGangGlobalReputations", src)
end)