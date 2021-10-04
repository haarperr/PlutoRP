RegisterServerEvent('keys:send')
AddEventHandler('keys:send', function(player, data)
    TriggerClientEvent('keys:received', player, data)
end)

RegisterServerEvent('enteredMyVehicle')
AddEventHandler('enteredMyVehicle', function(plate)
  local source = tonumber(source)
  local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
  local char = user:getCurrentCharacter()
  exports.ghmattimysql:execute("SELECT * FROM characters_cars WHERE cid = @cid AND license_plate = @license_plate", {
    ['@cid'] = char.id,
    ['@license_plate'] = plate
  }, function(data)
    if data[1] ~= nil then
      TriggerClientEvent('veh.checkOwner',source,true)
    else
      TriggerClientEvent('veh.checkOwner',source,false)
      TriggerClientEvent('veh.getDegredation', source, plate)
    end
  end)
end)

RegisterServerEvent("login:get:keys", function(cid)
  local pSrc = source
  local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
  exports.ghmattimysql:execute("SELECT `license_plate` FROM characters_cars WHERE cid = ?", {cid}, function(data)
    if data[1] ~= nil then
      for i = 1, #data do
        TriggerClientEvent("keys:addNew:login", pSrc, data[i].license_plate)
      end
    end
  end)
end)

