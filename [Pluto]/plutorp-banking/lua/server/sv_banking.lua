function RefreshTransactions(source)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local characterId = user:getVar("character").id

    MySQL.Async.fetchAll("SELECT * FROM `transaction_history` WHERE `identifier` = @myID AND DATE(date) > (NOW() - INTERVAL "..SimpleBanking.Config["Days_Transaction_History"].." DAY) ORDER BY `id` ASC;",
    {
        ["@myID"] = characterId
    }, function(data)
        if (not data) then return end

        TriggerClientEvent("Pluto:Bank:UpdateTransactions", source, data)
    end)
end


RegisterServerEvent("banking:get:data", function()
    local pSrc = source

    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    local characterId = user:getVar("character").id

    local PlayerBank = user:getBalance() or 0


    local TransactionHistory = {}
    local TransactionRan = false
    local FriendAccounts = {}
    local FriendAccountsRan = false
    local tbl = {}

    tbl[1] = {
        type = "personal",
        amount = PlayerBank
    }



    exports.ghmattimysql:execute("SELECT `pass_type` FROM character_passes WHERE cid= ? AND rank >= 4", {characterId}, function(data)
        if data[1] then
            pbussinessName = data[1].pass_type
            exports.ghmattimysql:execute("SELECT `bank` FROM group_banking WHERE group_type= ?", {pbussinessName}, function(FData)

                tbl[#tbl + 1] = {
                    type = "business",
                    name = pbussinessName,
                    amount = FData[1].bank or 0
                }
            end)
        end

    end)

   

    MySQL.Async.fetchAll("SELECT * FROM `transaction_history` WHERE `identifier` = @myID AND DATE(date) > (NOW() - INTERVAL "..SimpleBanking.Config["Days_Transaction_History"].." DAY) ORDER BY `id` ASC;", {
        ["@myID"] = characterId,
    }, function(data)
        TransactionRan = true
        TransactionHistory = data
    end)

    repeat
        Wait(0)
    until 
        TransactionRan
    Citizen.Wait(200)
    TriggerClientEvent("banking:recieve:data", pSrc, tbl, FriendAccounts, TransactionHistory)
    TriggerClientEvent("banking:updateBalance", pSrc, user:getBalance())
    TriggerClientEvent('banking:updateCash', pSrc, user:getCash())
    TriggerClientEvent('banking:updateCasino', pSrc, user:getCasino())
end)


RegisterServerEvent("banking:get:GetBankAuths", function(account)
    local pSrc = source

    if (not account or account ~= "personal") then
        TriggerClientEvent("Pluto:Bank:Notify", source, "error", "You can only edit your own bank!")
        return 
    end
    
    MySQL.Async.fetchAll("SELECT * FROM `banking_access` WHERE `owner_identifier` = @myID", {
        ["@myID"] = xPlayerID
    }, function(data)
        TriggerClientEvent("banking:get:auths", pSrc, data)
    end)
end)


RegisterServerEvent("society:update", function(amt, account, case)
    local pAmount = tonumber(amt)
    if case == "remove" then
        exports.ghmattimysql:execute("SELECT `bank` FROM group_banking WHERE group_type = ?", {account}, function(data)	
            local NewAmount = data[1].bank - pAmount
            exports.ghmattimysql:execute("UPDATE group_banking SET `bank` = ? WHERE group_type = ?", {NewAmount, account})
        end)
    elseif case == "add" then
        exports.ghmattimysql:execute("SELECT `bank` FROM group_banking WHERE group_type = ?", {account}, function(data)	
            local NewAmount = data[1].bank + pAmount
            exports.ghmattimysql:execute("UPDATE group_banking SET `bank` = ? WHERE group_type = ?", {NewAmount, account})
        end)
    end
end)
  
RegisterServerEvent('bank:givemecash')
AddEventHandler('bank:givemecash', function(sender, reciever, amount)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(sender)
    local player = exports["plutorp-core"]:getModule("Player"):GetUser(tonumber(reciever))
    if tonumber(amount) <= user:getCash() then
        user:removeMoney(amount)
        player:addMoney(amount)    
        TriggerClientEvent("DoLongHudText", user.source, "You have handed $" ..amount.. " to ID: " ..reciever)
        TriggerClientEvent("DoLongHudText", player.source, "You have been handed $"..amount.." from ID: " ..sender)
        pLogData = "Sender: " ..GetPlayerName(sender) .. " | HANDED | Receiver: " .. GetPlayerName(reciever) .. "    | $"..amount
        exports['plutorp-core']:k_log(sender, "give_cash", pLogData)
    else
        TriggerClientEvent('DoShortHudText', sender, 'Not enough money', 2)
    end
end)

RegisterServerEvent("cash:remove", function(pSrc, pAmount)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    user:removeMoney(amt)
    Wait(50)
    TriggerClientEvent('isPed:UpdateCash', pSrc, user:getCash())
end)

RegisterServerEvent("banking-loaded-in", function()
    local pSrc = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    TriggerClientEvent('isPed:UpdateCash', pSrc, user:getCash())
end)


function UpdateSociety(amt, account, case)
    if account == "car_shop" and case == "add" then
        local pNewAmt = math.ceil(amt / 3)
        TriggerEvent('society:update', pNewAmt, account, case)
    else
        TriggerEvent('society:update', amt, account, case)
    end
end

exports('UpdateSociety', UpdateSociety)

RegisterCommand("cash", function(source, args, raw)
    local pSrc = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    TriggerClientEvent('banking:updateCash', pSrc, user:getCash(), true)
end)
  
  
RegisterCommand("bank", function(source, args, raw)
    local pSrc = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    TriggerClientEvent('banking:updateBalance', pSrc, user:getBalance(), true)

end)

RegisterCommand('givecash', function(source, args)
    if tonumber(args[2]) then
        TriggerClientEvent("bank:givecash", source, source, args[1], tonumber(args[2]))
    end
end)
  