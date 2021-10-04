vanilla = {
  [1] = {}
}

RegisterServerEvent('vanilla:OrderComplete')
AddEventHandler("vanilla:OrderComplete", function(regID, price, comment)
  local insert = {
      owner = source, 
      price = price, 
      comment = comment,
      regID = regID
  }
  vanilla[regID] = {}
  table.insert(vanilla[regID], insert)
end)

RegisterServerEvent("vanilla:retreive:receipt")
AddEventHandler("vanilla:retreive:receipt", function(regID)
  local src = source
  local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
  local char = user:getCurrentCharacter()
  if vanilla[regID] then
      for i = 1, #vanilla[regID] do
          if vanilla[regID][i].regID == regID then
              local amount = vanilla[regID][i].price
              if (tonumber(user:getCash()) >= tonumber(amount)) then
                  user:removeMoney(tonumber(amount))
                  local owner = exports["plutorp-core"]:getModule("Player"):GetUser(vanilla[regID][i].owner)
                  local char = owner:getCurrentCharacter()
                  information = {
                      ["Price"] = tonumber(amount),
                      ["Creator"] = char.first_name .. " " ..char.last_name,
                      ["Comment"] = vanilla[regID][i].comment
                  }

                  TriggerClientEvent("player:receiveItem", vanilla[regID][i].owner, "ownerreceipt", 1, true, information)
                  TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at vanilla unicorn"})
                  TriggerEvent("vanilla:update:registers", regID)
              else
                  TriggerClientEvent("DoLongHudText", src, "You cant afford this purchase")
              end
          end
      end
  else
      TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
  end
end) 

RegisterServerEvent("vanilla:update:registers")
AddEventHandler("vanilla:update:registers", function(regID)
  for k, v in pairs(vanilla[regID]) do
      table.remove(vanilla[regID], k)
  end
end)


RegisterServerEvent("vanilla:update:pay")
AddEventHandler("vanilla:update:pay", function(cid)
  local src = source
  local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
  local characterId = user:getVar("character").id
  local invname = 'ply-'..characterId
  exports.ghmattimysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
      if data[1] then
          local slot = data[1].slot
          local jsonparse = json.decode(data[1].information)
          exports.ghmattimysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
              local before = old[1].paycheck
              exports.ghmattimysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                  ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                  ['@id'] = characterId
              })
              TriggerClientEvent("Yougotpaid", src, characterId)
              exports.ghmattimysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
          end)
      else
          TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
      end
  end)
end)