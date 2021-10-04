local Banned = false

local Events = {
    "oxy",
    "vehicle:search",
    "taco:counter",
    "basic:food",
    "band",
    "rollcash",
}

-- RegisterServerEvent('mission:finished')
-- AddEventHandler('mission:finished', function(type, amount)    
--     local pSrc = source
--     local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
--     user:addMoney(amount)
--     local EventName = tonumber(type)
--     if EventName then
--         ConfirmedCheaterDawg(pSrc)
--         return
--     end


--     if not amount or not type then 
--         ConfirmedCheaterDawg(pSrc)
--         return
--     end
               
--     for i=1, #Events do 
--         if type == Events[i] then
--             if type == "oxy" and amount > 150 then
--                 ConfirmedCheaterDawg(pSrc)
--                 Banned = true
--             elseif type == "taco:counter" and amount > 110 then
--                 ConfirmedCheaterDawg(pSrc)
--                 Banned = true
--             elseif type == "basic:food" and amount > 80 then
--                 ConfirmedCheaterDawg(pSrc)
--                 Banned = true               
--             elseif type == "band" and amount > 380 then
--                 ConfirmedCheaterDawg(pSrc)
--                 Banned = true
--             elseif type == "rollcash" and amount > 180 then
--                 ConfirmedCheaterDawg(pSrc)
--                 Banned = true
--             end

--             if type == "oxy" then
--                 local itemChance = math.random(1, 100)
--                 if itemChance >= 75 then
--                     TriggerClientEvent("player:receiveItem", pSrc, "oxy", math.random(2, 4))
--                 end
--             end

--             if not Banned then
--                 user:addMoney(amount)
--             end
--         else
--             ConfirmedCheaterDawg(pSrc) -- If they try to make an event that does not already exist from the array.
--             return
--         end
--     end
-- end)


-- function ConfirmedCheaterDawg(pSrc)
--     local LogInfo = "Confirmed Cheater"
--     exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/840746349866647592/fumXXTs4swshcYYNW-R4qOaU5mk7DId18ibT5K1El4RfgWiv_2Eaiur8XjEZaIug-pFY", pSrc, "Triggering Events", "Triggering Events", LogInfo)
--     DropPlayer(pSrc, "[Anti-Cheat]: You have been permanently banned for [Triggering Events]")
--     return
-- end