Citizen.CreateThread(function()
    TriggerEvent("inv:playerSpawned");
end)

RegisterServerEvent("server-item-quality-update")
AddEventHandler("server-item-quality-update", function(player, data)
    if data.quality < 1 then
        exports.ghmattimysql:execute("UPDATE user_inventory2 SET `quality` = @quality WHERE name = @name AND slot = @slot AND item_id = @item_id", {
            ['quality'] = "0", 
            ['name'] = 'ply-' ..player, 
            ['slot'] = data.slot,
            ['item_id'] = data.itemid
        })
    end
end)


RegisterServerEvent('people-search')
AddEventHandler('people-search', function(target)
    local source = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(target)
    local characterId = user:getVar("character").id
	TriggerClientEvent("server-inventory-open", source, "1", 'ply-'.. characterId)
end)

RegisterServerEvent('Stealtheybread')
AddEventHandler('Stealtheybread', function(target)
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local targetply = exports["plutorp-core"]:getModule("Player"):GetUser(target)
    user:addMoney(targetply:getCash())
    targetply:removeMoney(targetply:getCash())
end)


RegisterNetEvent('plutorp-weapons:getAmmo')
AddEventHandler('plutorp-weapons:getAmmo', function()
    local ammoTable = {}
    local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT type, ammo FROM characters_weapons WHERE id = @id", {['id'] = char.id}, function(result)
        for i = 1, #result do
            if ammoTable["" .. result[i].type .. ""] == nil then
                ammoTable["" .. result[i].type .. ""] = {}
                ammoTable["" .. result[i].type .. ""]["ammo"] = result[i].ammo
                ammoTable["" .. result[i].type .. ""]["type"] = ""..result[i].type..""
            end
        end
        TriggerClientEvent('plutorp-items:SetAmmo', src, ammoTable)
    end)
end)

RegisterNetEvent('plutorp-weapons:updateAmmo')
AddEventHandler('plutorp-weapons:updateAmmo', function(newammo,ammoType,ammoTable)
    local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute('SELECT ammo FROM characters_weapons WHERE type = @type AND id = @identifier',{['@type'] = ammoType, ['@identifier'] = char.id}, function(result)
        if result[1] == nil then
            exports.ghmattimysql:execute('INSERT INTO characters_weapons (id, type, ammo) VALUES (@identifier, @type, @ammo)', {
                ['@identifier'] = char.id,
                ['@type'] = ammoType,
                ['@ammo'] = newammo
            }, function()
            end)
        else
            exports.ghmattimysql:execute('UPDATE characters_weapons SET ammo = @newammo WHERE type = @type AND ammo = @ammo AND id = @identifier', {
                ['@identifier'] = char.id,
                ['@type'] = ammoType,
                ['@ammo'] = result[1].ammo,
                ['@newammo'] = newammo
            }, function()
            end)
        end
    end)
end)

RegisterServerEvent("inventory:deg:item", function(pItem)
    local pSrc = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    local char = user:getCurrentCharacter()
    local pInventoryName = "ply-"..char.id

    if not pItem then
        return
    end

    exports.ghmattimysql:execute('SELECT quality, creationDate FROM user_inventory2 WHERE item_id = ? AND name = ?',{pItem, pInventoryName}, function(data)
        if data[1] ~= nil then
            if data[1].quality > 15 then
                local NewQuality = data[1].quality - 20
                local pOldCreation = data[1].creationDate
                exports.ghmattimysql:execute('UPDATE user_inventory2 SET quality = @quality, creationDate = @cd WHERE name = @name', {
                    ['@name'] = pInventoryName,
                    ['@cd'] = pOldCreation - 5000000,
                    ['@quality'] = NewQuality
                }, function()
                end)

                Citizen.Wait(500)
                exports.ghmattimysql:execute('SELECT quality FROM user_inventory2 WHERE item_id = ? AND name = ?',{pItem, pInventoryName}, function(data)
                    if data[1].quality < 20 then
                        TriggerClientEvent("DoLongHudText", pSrc, "The laptop stop working..", 1)
                        TriggerClientEvent("inventory:removeItem", pSrc, pItem, 1)
                    end
                end)
            else
                TriggerClientEvent("inventory:removeItem", pSrc, pItem, 1)
            end
        else
            return                          
        end
    end)
end)