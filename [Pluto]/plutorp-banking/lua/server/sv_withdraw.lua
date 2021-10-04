RegisterServerEvent('Pluto:Bank:Withdraw')
AddEventHandler('Pluto:Bank:Withdraw', function(account, amount, note, fSteamID)
    local source = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local char = user:getCurrentCharacter()
    local pName = char.first_name .. " " .. char.last_name
    local pSteam = GetPlayerName(source)
    if(not amount or tonumber(amount) <= 0) then
        TriggerClientEvent("Pluto:Bank:Notify", source, "error", "Invalid amount!") 
        return
    end

    amount = tonumber(amount)

    if(account == "personal") then
        if(amount > user:getBalance()) then
            TriggerClientEvent("Pluto:Bank:Notify", source, "error", "Your bank doesn't have this much money!") 
            return
        end

        user:addMoney(math.floor(amount))
        user:removeBank(math.floor(amount))
        RefreshTransactions(source)
        TriggerClientEvent("Pluto:Bank:Notify", source, "info", "You have withdrew $"..format_int(amount))
        TriggerEvent("Pluto:AddToMoneyLog", source, "personal", -amount, "withdraw", "N/A", (note ~= "" and note or "Withdrew $"..format_int(amount).." cash."))
        TriggerClientEvent("Pluto:Bank:RefreshAccounts", source)
        Citizen.Wait(500)
        TriggerClientEvent('isPed:UpdateCash', source, user:getCash())

        pLogData = pSteam .. " Withdrew $"..amount .. " [Personal Account]"
        exports['plutorp-core']:k_log(source, "withdraw", pLogData)
    end

    if(account == "business") then     
        exports.ghmattimysql:execute("SELECT `pass_type` FROM character_passes WHERE cid= ? AND rank >= 4", {char.id}, function(data)
            if data[1] then
                pbussinessName = data[1].pass_type
                exports['plutorp-banking']:UpdateSociety(amount, pbussinessName, "remove")            
                user:addMoney(amount)

                TriggerClientEvent("Pluto:Bank:Notify", source, "info", "You have withdrew $"..format_int(amount).." from ".. pbussinessName.."'s business account.") 
                TriggerEvent("Pluto:AddToMoneyLog", source, "business", -amount, "deposit", pbussinessName, (note ~= "" and note or "Withdrew $"..format_int(amount).." from ".. pbussinessName .."'s business account."))
                TriggerClientEvent("Pluto:Bank:RefreshAccounts", source)
            end
        end)
        pLogData = pSteam .. " Withdrew $"..amount .. " [Business Account: " .. pbussinessName .. "]"
        exports['plutorp-core']:k_log(source, "withdraw", pLogData)

    end
end)