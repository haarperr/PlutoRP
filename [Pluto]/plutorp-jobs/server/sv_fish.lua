local DISCORD_WEBHOOK5 = "https://discord.com/api/webhooks/887869038645096539/vVh883x_xX_Aegtytlg1PBG_asb9N9VZODu5GQ_MT6VZqNNuCzlYsoo2seRTq2zipasI"
local DISCORD_NAME5 = "Fish Selling Logs"

local STEAM_KEY = "0C007CC382AB06D1D99D9B45EC3924B1"
local DISCORD_IMAGE = "https://i.imgur.com/zviw6oW.png" -- default is FiveM logo

PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

local cachedData = {}


RegisterServerEvent('plutorp-fish:sellfish')
AddEventHandler('plutorp-fish:sellfish', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
        if money > 45 then
        sendToDiscord5("Fish Selling Logs", "Player ID: ".. source ..", Steam: ".. player ..",  Just Received $".. money .." From Selling Fish.")
    end
end
end)

function sendToDiscord5(name, message, color)
  local connect = {
    {
      ["color"] = color,
      ["title"] = "**".. name .."**",
      ["description"] = message,
    }
  }
  PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end