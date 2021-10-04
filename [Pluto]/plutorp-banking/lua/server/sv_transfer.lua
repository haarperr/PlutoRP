RegisterServerEvent('Pluto:Bank:Transfer')
AddEventHandler('Pluto:Bank:Transfer', function(target, account, amount, note, fSteamID)
    local source = source
    local pPlayer = exports["plutorp-core"]:getModule("Player"):GetUser(tonumber(source))
    local pchar = pPlayer:getCurrentCharacter()
    local pName = pchar.first_name .. " " .. pchar.last_name
    local pSteam = GetPlayerName(source)
    local TargetSteam = GetPlayerName(target)

    target = (target ~= nil and tonumber(target) or nil)
    if (not target or target <= 0 or target == source) then
        return
    end

    target = tonumber(target)
    amount = tonumber(amount)


    local tPlayer = exports["plutorp-core"]:getModule("Player"):GetUser(target)
    local tchar = tPlayer:getCurrentCharacter()
    local tName = tchar.first_name .. " " .. tchar.last_name

    if tPlayer == false then
        return
    end

    if (target == source) then
        return
    end

    if (not amount or amount <= 0) then
        return
    end

    if (account == "personal") then
        local balance = pPlayer:getBalance()

        if (amount > balance) then
            return
        end

        pPlayer:removeBank(amount)
        tPlayer:addBank(amount)
        TriggerClientEvent("Pluto:Bank:Notify", source, "info", "You have transfered $" .. format_int(amount) .. " to " .. tName .. "'s account")
        TriggerEvent("Pluto:AddToMoneyLog", source, "personal", -amount, "transfer", tName, "Transfered $" .. format_int(amount) .. " to " .. tName)
        TriggerEvent("Pluto:AddToMoneyLog", target, "personal", amount, "transfer", pName, "Received $" .. format_int(amount) .. " from " .. pName)
        TriggerClientEvent("Pluto:Bank:RefreshAccounts", source)

        pLogData = pSteam .. " transferred $"..amount .. " to " .. TargetSteam .. " [Personal Account]"
        exports['plutorp-core']:k_log(source, "transfer", pLogData)


    end

    if (account == "business") then
        exports.ghmattimysql:execute("SELECT `pass_type` FROM character_passes WHERE cid= ? AND rank >= 4", {pchar.id}, function(data)
            pbussinessName = data[1].pass_type
            if data[1] then
                
                tPlayer:addBank(amount)
                Wait(50)   
                exports['plutorp-banking']:UpdateSociety(amount, pbussinessName, "remove")
                TriggerClientEvent("Pluto:Bank:Notify", source, "info", "You have transfered $" .. format_int(amount) .. " from " .. pbussinessName .. "'s account")
                TriggerEvent("Pluto:AddToMoneyLog", source, "personal", -amount, "transfer", tName, "Transfered $" .. format_int(amount) .. " to " .. tName .. " from " .. pbussinessName .. "'s account")
                TriggerEvent("Pluto:AddToMoneyLog", target, "personal", amount, "transfer", pName, "Received $" .. format_int(amount) .. " from " .. pName .. " of " .. pbussinessName)
                TriggerClientEvent("Pluto:Bank:RefreshAccounts", source)
                pLogData = pSteam .. " transferred $"..amount .. " to " .. TargetSteam .. " [Business Account: " .. pbussinessName .. "]"
                exports['plutorp-core']:k_log(source, "transfer", pLogData)

            end
        end)
    end
end)