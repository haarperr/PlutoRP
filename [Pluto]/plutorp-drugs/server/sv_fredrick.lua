RegisterServerEvent('laptop1cash')
AddEventHandler('laptop1cash', function()
local src = source
local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(2500)
end)

RegisterServerEvent('jimpass')
AddEventHandler('jimpass', function()
local src = source
local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(2500)
end)

RegisterServerEvent('pay4bennys')
AddEventHandler('pay4bennys', function()
local src = source
local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    user:removeMoney(350)
end)