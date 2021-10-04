bMenuOpen = false 

function ToggleUI()
    bMenuOpen = not bMenuOpen

    if (not bMenuOpen) then
        if (nearATM() and not bMenuOpen) then
            SetNuiFocus(false, false)
            financialAnimation(true, false)
        else
            SetNuiFocus(false, false)
            financialAnimation(false, false)
        end
    else
        TriggerServerEvent("banking:get:data")
    end
end


RegisterNetEvent("banking:recieve:data", function(data, friends, transactions)
    local PlayerBanks = json.encode(data)
    local FriendsData = {}

    if (friends and #friends >= 1) then
        FriendsData = friends
    end

    SetNuiFocus(true, true)
    SendNUIMessage({type = 'OpenUI', accounts = PlayerBanks, friends = json.encode(FriendsData), transactions = json.encode(transactions), name = exports['plutorp_manager']:isPed("fullname")})
end)

RegisterNUICallback("CloseATM", function()
    ToggleUI()
end)

RegisterNUICallback("DepositCash", function(data, cb)
    if (not data or not data.account or not data.amount) then
        return
    end

    if (tonumber(data.amount) <= 0) then
        return
    end

    if (data.account == "friend" and not data.steamid) then
        return
    end


    TriggerServerEvent("Pluto:Bank:Deposit", data.account, data.amount, (data.note ~= nil and data.note or ""), (data.steamid ~= nil and data.steamid or ""))
end)

RegisterNUICallback("WithdrawCash", function(data, cb)
    if (not data or not data.account or not data.amount) then
        return
    end

    if(tonumber(data.amount) <= 0) then
        return
    end

    if (data.account == "friend" and not data.steamid) then
        return
    end

    TriggerServerEvent("Pluto:Bank:Withdraw", data.account, data.amount, (data.note ~= nil and data.note or ""), (data.steamid ~= nil and data.steamid or ""))
end)

RegisterNUICallback("TransferCash", function(data, cb)
    if (not data or not data.account or not data.amount or not data.target) then
        return
    end

    if(tonumber(data.amount) <= 0) then
        return
    end

    if(tonumber(data.target) <= 0) then
        return
    end

    TriggerServerEvent("Pluto:Bank:Transfer", data.target, data.account, data.amount, (data.note ~= nil and data.note or ""), (data.steamid ~= nil and data.steamid or ""))
end)

-- RegisterNUICallback("RemoveAccess", function(data, cb)
--     if (not data or not data.target or not data.player) then
--         return
--     end

--     TriggerServerEvent("Pluto:Bank:RemoveAccess", data.target, data.player)
-- end)

-- RegisterNUICallback("EditAccount", function(data, cb)
--     TriggerServerEvent("banking:get:GetBankAuths", "personal")
-- end)


-- RegisterNetEvent("banking:get:auths", function(auths)
--     if (auths and #auths >= 1) then
--         SendNUIMessage({type = 'edit_account', auths = json.encode(auths)})
--     else
--         SendNUIMessage({type = 'notification', msg_type = "error", message = "Nobody has access to your bank account!"})
--     end
-- end)


--// Net Events \\--
RegisterNetEvent("Pluto:Bank:Notify")
AddEventHandler("Pluto:Bank:Notify", function(type, msg)
    if (bMenuOpen) then
        SendNUIMessage({type = 'notification', msg_type = type, message = msg})
    end
end)

RegisterNetEvent("Pluto:Bank:UpdateTransactions")
AddEventHandler("Pluto:Bank:UpdateTransactions", function(transactions)
    if (bMenuOpen) then
        SendNUIMessage({type = 'update_transactions', transactions = json.encode(transactions)})
    end
end)


RegisterNetEvent("Pluto:Bank:RefreshAccounts")
AddEventHandler("Pluto:Bank:RefreshAccounts", function()
    SetNuiFocus(false, false)
    TriggerServerEvent("banking:get:data")
end)


-- RegisterNetEvent('esx:setJob')
-- AddEventHandler('esx:setJob', function(job)
--     SendNUIMessage({type = "refresh_accounts"})
-- end) 