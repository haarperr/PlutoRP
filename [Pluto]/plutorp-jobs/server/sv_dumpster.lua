local dumpsterItems = {
    [1] = {chance = 4, id = 'sandwich', quantity = math.random(1,1)},
    [2] = {chance = 5, id = 'water', quantity = math.random(1,1)},
    [3] = {chance = 7, id = 'lockpick', quantity = math.random(1,1)},
    [4] = {chance = 6, id = '2508868239', quantity = math.random(1,1)},
    [5] = {chance = 6, id = 'advlockpick', quantity = math.random(1,1)},
    [6] = {chance = 70, id = 'plastic', quantity = math.random(1,3)},
    [7] = {chance = 8, id = 'joint2', quantity = math.random(1,2)},
    [8] = {chance = 8, id = 'pistolammo', quantity = math.random(1,2)},
    [9] = {chance = 15, id = 'armor', quantity = math.random(1,1)},
    [10] = {chance = 8, id = 'firstaid', quantity = math.random(1,1)},
 --   [11] = {chance = 150, id = '-771403250', quantity = 1},
    [12] = {chance = 9, id = 'oxy', quantity = math.random(1,4)},
    [13] = {chance = 9, id = 'chloroform', quantity = math.random(1,5)},
    [14] = {chance = 10, id = 'dye', quantity = math.random(1,4)},
    [15] = {chance = 8, id = 'antifreeze', quantity = math.random(1,6)},
    [16] = {chance = 7, id = 'sudafed', quantity = math.random(1,6)},
    [17] = {chance = 7, id = 'acetone', quantity = math.random(1,6)},
    [18] = {chance = 9, id = 'carhood', quantity = math.random(1,2)},
    [19] = {chance = 8, id = 'carbattey', quantity = math.random(1,3)},
    [20] = {chance = 6, id = 'snakeskin', quantity = math.random(1,3)},
    [21] = {chance = 7, id = '2227010557', quantity = math.random(1,3)},
    [22] = {chance = 7, id = 'ace', quantity = math.random(1,2)},
    [23] = {chance = 6, id = 'action', quantity = math.random(1,1)},
    [24] = {chance = 8, id = 'blueb', quantity = math.random(1,1)},
    [25] = {chance = 9, id = 'bucket', quantity = math.random(1,1)},
    [26] = {chance = 9, id = 'cathat', quantity = math.random(1,2)},
    [27] = {chance = 9, id = 'bucket', quantity = math.random(1,1)},
    [28] = {chance = 7, id = 'dodo', quantity = math.random(1,1)},
    [29] = {chance = 9, id = 'fabric', quantity = math.random(1,1)},
    [30] = {chance = 6, id = 'fishingboot', quantity = math.random(1,1)},
    [31] = {chance = 8, id = 'petrock', quantity = math.random(1,1)},
    [31] = {chance = 4, id = 'stolenraybans', quantity = math.random(1,1)},
}


RegisterServerEvent('prp:startDumpsterTimer')
AddEventHandler('prp:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterServerEvent('prp:giveDumpsterReward')
AddEventHandler('prp:giveDumpsterReward', function()
    local source = tonumber(source)
    local item = {}
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local gotID = {}

    for i = 1, math.random (1,2) do
        item = dumpsterItems[math.random(1, #dumpsterItems)]
        if math.random(1, 10) >= item.chance then
            if tonumber(item.id) == 0 and not gotID[item.id] then
                gotID[item.id] = true
                user:addMoney(item.quantity)
                TriggerClientEvent('DoLongHudText',  source, 'You found $'..item.quantity , 1)
            elseif not gotID[item.id] then
                gotID[item.id] = true
                TriggerClientEvent('player:receiveItem', source, item.id, item.quantity)
                TriggerClientEvent('DoLongHudText', source, 'You found '..item.id, 1)
            end
        else
            TriggerClientEvent('DoLongHudText', source, 'You found nothing', 1)
        end
  end
end)

function startTimer(id, object)
    local timer = 10 * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            TriggerClientEvent('prp:removeDumpster', id, object)
        end
    end
end