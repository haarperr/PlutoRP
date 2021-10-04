
RegisterNetEvent("plutorp_arcade:buyTicket")
AddEventHandler("plutorp_arcade:buyTicket", function(ticket)
        local src = source
        local data = Config.ticketPrice[ticket]
        local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
        local moneyPlayer = tonumber(user:getCash())

        if moneyPlayer > data.price then
            user:removeMoney(data.price);
            TriggerClientEvent("plutorp_arcade:ticketResult", source, ticket);
        else
            TriggerClientEvent("plutorp_arcade:nomoney", source);
        end

end)

arcade = {
    [1] = {}
}

RegisterServerEvent('arcade_bar:OrderComplete')
AddEventHandler("arcade_bar:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    arcade[regID] = {}
    table.insert(arcade[regID], insert)
end)

RegisterServerEvent("arcade:retreive:receipt")
AddEventHandler("arcade:retreive:receipt", function(regID)
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if arcade[regID] then
        for i = 1, #arcade[regID] do
            if arcade[regID][i].regID == regID then
                local amount = arcade[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["plutorp-core"]:getModule("Player"):GetUser(arcade[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = arcade[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", arcade[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at arcadeMama"})
                    TriggerEvent("arcade_bar:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this purchase")
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("arcade_bar:update:registers")
AddEventHandler("arcade_bar:update:registers", function(regID)
    for k, v in pairs(arcade[regID]) do
        table.remove(arcade[regID], k)
    end
end)


RegisterServerEvent("arcade:update:pay")
AddEventHandler("arcade:update:pay", function(cid)
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