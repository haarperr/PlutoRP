local webhook = "https://discord.com/api/webhooks/883557132459454485/1b5uc6qR4tb-1htYcgOfMOVCh_LLfuLXpAiD9E5Bnbw6SH9RsNBiVh0gLxh2LwowcGnb"

RegisterServerEvent("cooltrigger")
AddEventHandler("cooltrigger", function()
    print('detekted ' .. GetPlayerName(source))
    sendToDiscord("Asshole Logged", GetPlayerName(source).." tried to use nui_devtools at "..os.time())
    DropPlayer(source, 'Haha, not on my watch get logged bitch')
end)

function sendToDiscord(name, args, color)
    local connect = {
          {
              ["color"] = 16711680,
              ["title"] = "".. name .."",
              ["description"] = args,
              ["footer"] = {
                  ["text"] = "Made by Pluto",
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "Asshole Log", embeds = connect, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end