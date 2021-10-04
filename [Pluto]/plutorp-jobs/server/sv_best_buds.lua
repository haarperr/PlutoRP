Best_buds = {
    [1] = {},
    [2] = {}
}

RegisterServerEvent('Best_buds:OrderComplete')
AddEventHandler("Best_buds:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Best_buds[regID] = {}
    table.insert(Best_buds[regID], insert)
end)

RegisterServerEvent("Best_buds:retreive:receipt")
AddEventHandler("Best_buds:retreive:receipt", function(regID)
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Best_buds[regID] then
        for i = 1, #Best_buds[regID] do
            if Best_buds[regID][i].regID == regID then
                local amount = Best_buds[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["plutorp-core"]:getModule("Player"):GetUser(Best_buds[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Best_buds[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Best_buds[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Best Buds"})
                    TriggerEvent("Best_buds:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this purchase")
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("Best_buds:update:registers")
AddEventHandler("Best_buds:update:registers", function(regID)
    for k, v in pairs(Best_buds[regID]) do
        table.remove(Best_buds[regID], k)
    end
end)


RegisterServerEvent("Best_buds:update:pay")
AddEventHandler("Best_buds:update:pay", function(cid)
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