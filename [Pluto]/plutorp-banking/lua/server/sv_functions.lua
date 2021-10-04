RegisterNetEvent("Pluto:AddToMoneyLog")
AddEventHandler("Pluto:AddToMoneyLog", function(source, sAccount, iAmount, sType, sReceiver, sMessage)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
    local char = user:getCurrentCharacter()


    local iTransactionID = math.random(1000, 100000)

    MySQL.Async.execute("INSERT INTO `transaction_history` (`identifier`, `trans_id`, `account`, `amount`, `trans_type`, `receiver`, `message`) VALUES(@myID, @transid, @account, @amount, @type, @receiver, @message);", {
        ["@myID"] = char.id,
        ["@transid"] = iTransactionID,
        ["@account"] = sAccount,
        ["@amount"] = iAmount,
        ["@type"] = sType,
        ["@receiver"] = sReceiver,
        ["@message"] = sMessage
    })
end)

function GetBankByID(id)
    local queryRan, queryValue = false, 0

    MySQL.Async.fetchAll("SELECT * FROM `characters` WHERE `id` = @id",
    {
        ["@id"] = id
    }, function(data)
        if (data and #data >= 1) then
            queryValue = data[1].bank
        end

        queryRan = true
    end)

    repeat
        Wait(0)
    until
        queryRan

    return queryRan, queryValue 
end

function AddOfflineTransaction(sID, sAccount, iAmount, sType, sReceiver, sMessage)
    local iTransactionID = math.random(1000, 100000)
    
    MySQL.Async.execute("INSERT INTO `transaction_history` (`identifier`, `trans_id`, `account`, `amount`, `trans_type`, `receiver`, `message`) VALUES(@tIdentifier, @transid, @account, @amount, @type, @receiver, @message);", {
        ["@tIdentifier"] = sID,
        ["@transid"] = iTransactionID,
        ["@account"] = sAccount,
        ["@amount"] = iAmount,
        ["@type"] = sType,
        ["@receiver"] = sReceiver,
        ["@message"] = sMessage
    })
end