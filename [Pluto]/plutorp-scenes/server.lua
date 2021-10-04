local scenes = {}

RegisterNetEvent('plutorp-scenes:fetch', function()
    local src = source
    TriggerClientEvent('plutorp-scenes:send', src, scenes)
end)

RegisterNetEvent('plutorp-scenes:add', function(coords, message, color, distance)
    table.insert(scenes, {
        message = message,
        color = color,
        distance = distance,
        coords = coords
    })
    TriggerClientEvent('plutorp-scenes:send', -1, scenes)
    TriggerEvent('plutorp-scenes:log', source, message, coords)
end)

RegisterNetEvent('plutorp-scenes:delete', function(key)
    table.remove(scenes, key)
    TriggerClientEvent('plutorp-scenes:send', -1, scenes)
end)


RegisterNetEvent('plutorp-scenes:log', function(id, text, coords)
    local f, err = io.open('sceneLogging.txt', 'a')
    if not f then return print(err) end
    f:write('Player: ['..id..'] Placed Scene: ['..text..'] At Coords = '..coords..'\n')
    f:close()
end)