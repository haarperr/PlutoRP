RegisterServerEvent('Pluto:Bank:Deposit')
AddEventHandler('Pluto:Bank:Deposit', function(account, amount, note, fSteamID)
    local source = source
    -- local xPlayer = ESX.GetPlayerFromId(source)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local char = user:getCurrentCharacter()
    local pSteam = GetPlayerName(source)
    if(not source or source == -1) then
        return
    end

    if(not amount or tonumber(amount) <= 0) then
        TriggerClientEvent("Pluto:Bank:Notify", source, "error", "Invalid Amount!") 
        return
    end

    amount = tonumber(amount)
    if(math.floor(amount) > user:getCash()) then
        TriggerClientEvent("Pluto:Bank:Notify", source, "error", "You can't afford this!") 
        return
    end

    if(account == "personal") then
        local amt = math.floor(amount)

        user:removeMoney(amt)
        Wait(500)
        user:addBank(amt)
        RefreshTransactions(source)
        TriggerClientEvent("Pluto:Bank:Notify", source, "info", "You have deposited $"..format_int(amount)) 
        TriggerEvent("Pluto:AddToMoneyLog", source, "personal", amount, "deposit", "N/A", (note ~= "" and note or "Deposited $"..format_int(amount).." cash."))
        TriggerClientEvent("Pluto:Bank:RefreshAccounts", source)
        Citizen.Wait(500)
        TriggerClientEvent('isPed:UpdateCash', source, user:getCash())


        pLogData = pSteam .. " Deposited $"..amount .. " [Personal Account]"
        exports['plutorp-core']:k_log(source, "deposit", pLogData)
        return
    end

    if(account == "business") then     
        exports.ghmattimysql:execute("SELECT `pass_type` FROM character_passes WHERE cid= ? AND rank >= 4", {char.id}, function(data)
            if data[1] then
                pbussinessName = data[1].pass_type
                user:removeMoney(amount)
                Wait(500)   
                exports['plutorp-banking']:UpdateSociety(amount, pbussinessName, "add")
                TriggerClientEvent("Pluto:Bank:Notify", source, "info", "You have deposited $"..format_int(amount).." into ".. pbussinessName.."'s business account.") 
                TriggerEvent("Pluto:AddToMoneyLog", source, "business", amount, "deposit", pbussinessName, (note ~= "" and note or "Deposited $"..format_int(amount).." cash into ".. pbussinessName .."'s business account."))
                TriggerClientEvent("Pluto:Bank:RefreshAccounts", source)

                pLogData = pSteam .. " Deposited $"..amount .. " [Business Account: " .. pbussinessName .. "]"
                exports['plutorp-core']:k_log(source, "deposit", pLogData)

                
            end
        end)
    end
end)