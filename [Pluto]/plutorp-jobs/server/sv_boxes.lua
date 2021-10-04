local boxItems = {
    [1] = {chance = 15, id = 'band', quantity = math.random(1,12)},
    [2] = {chance = 25, id = 'vpnxj', quantity = math.random(1,1)},
    [3] = {chance = 4, id = 'chloroform', quantity = math.random(1,6)},
    [4] = {chance = 4, id = 'dye', quantity = math.random(1,6)},
    [5] = {chance = 4, id = 'antifreeze', quantity = math.random(1,6)},
    [6] = {chance = 4, id = 'sudafed', quantity = math.random(1,6)},
    [7] = {chance = 4, id = 'acetone', quantity = math.random(1,6)},
}


RegisterServerEvent('prp:startboxTimer')
AddEventHandler('prp:startboxTimer', function(box)
    startTimer(source, box)
end)

RegisterServerEvent('prp:giveboxReward')
AddEventHandler('prp:giveboxReward', function()
    local source = tonumber(source)
    local item = {}
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local gotID = {}

    for i = 1, math.random (1,2) do
        item = boxItems[math.random(1, #boxItems)]
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
            TriggerClientEvent('prp:removebox', id, object)
        end
    end
end