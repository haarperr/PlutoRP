

RegisterServerEvent("plutorp_slots:BetsAndMoney")
AddEventHandler("plutorp_slots:BetsAndMoney", function(bets)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
        if bets % 50 == 0 and bets >= 50 then
            if user:getCasino() >= bets then
                user:removeCasino(bets)
                TriggerClientEvent("DoLongHudText", src, bets)
                TriggerClientEvent("plutorp_slots:UpdateSlots", src, bets)
            else
                TriggerClientEvent('DoLongHudText', src, "Not enought money")
            end
        else
            TriggerClientEvent('DoLongHudText', src, "You have to insert a multiple of 50. ex: 100, 350, 2500")
        end
end)

RegisterServerEvent("plutorp_slots:PayOutRewards")
AddEventHandler("plutorp_slots:PayOutRewards", function(amount)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
        amount = tonumber(amount)
        if amount > 0 then
            user.addCasino(amount)
            TriggerClientEvent('DoLongHudText', src, "Slots: You won $"..amount.." not bad at all!")
        else
            TriggerClientEvent('DoLongHudText',src, "Slots: Unfortunately you've lost all the money, maybe next time.")
        end
end)

CasinoSlots = true
RegisterServerEvent("slot:toggle")
AddEventHandler('slot:toggle', function(pAuto)
    if not pAuto then
        local pSrc = source
        TriggerClientEvent("DoLongHudText", pSrc, ('Spin To Win has been %s!'):format(CasinoSlots and 'Disabled' or 'Enabled')) 
        CasinoSlots = not CasinoSlots
    else
        CasinoSlots = not CasinoSlots
    end
end)


RegisterServerEvent("attempt:slot", function()
    local pSrc = source
    if CasinoSlots then
        TriggerClientEvent("plutorp_slots:UpdateSlots", pSrc, true)
    else
        TriggerClientEvent("DoLongHudText", pSrc, "Spin To Win is disabled, please contact a Casino Dealer!")
    end
end)

