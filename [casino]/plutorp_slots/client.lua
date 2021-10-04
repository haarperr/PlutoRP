local open 						= false

-------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------
local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function CreateBlip()
	if Config.blipsEnabled then
		for k,v in ipairs(Config.Slots)do
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(blip, 436)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, 1.0)
			SetBlipColour(blip, 49)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Pacanele")
			EndTextCommandSetBlipName(blip)
		end
	end
end

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

-------------------------------------------------------------------------------
-- NET EVENTS
-------------------------------------------------------------------------------
RegisterNetEvent("plutorp_slots:enterBets")
AddEventHandler("plutorp_slots:enterBets", function ()
    local bets = exports["plutorp-applications"]:KeyboardInput({
        header = "Bet Amount",
        rows = {
            {
                id = 1,
                txt = ""
            }
        }
    })
    if bets then
        bets = tonumber(bets[1].input) 
        if bets > 0 then
            currentBetAmount = bets
        end
        if tonumber(currentBetAmount) >= 0 then
			TriggerServerEvent('plutorp_slots:BetsAndMoney', tonumber(bets))

        else
			TriggerEvent('DoLongHudText', "You need to enter numbers (9999 is max bet).")
        end
    end
end)



RegisterNetEvent("plutorp_slots:UpdateSlots")
AddEventHandler("plutorp_slots:UpdateSlots", function(lei)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

-------------------------------------------------------------------------------
-- NUI CALLBACKS
-------------------------------------------------------------------------------
RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerServerEvent("plutorp_slots:PayOutRewards", data.coinAmount)
end)

-------------------------------------------------------------------------------
-- THREADS
-------------------------------------------------------------------------------
Citizen.CreateThread(function ()
	SetNuiFocus(false, false)
	open = false

	local wTime = 500
	local x = 1
	while true do
		Citizen.Wait(wTime)
		machine = false

		for i=1, #Config.Slots, 1 do
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.Slots[i].x, Config.Slots[i].y, Config.Slots[i].z, true) < 1 then
				x = i
				wTime = 0
				machine = true
			elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.Slots[x].x, Config.Slots[x].y, Config.Slots[x].z, true) > 1 then
				wTime = 500
			end
		end
	end
end)
local enabled = true
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1)
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		elseif IsControlJustReleased(0, 38) and machine then
			TriggerEvent('plutorp_slots:enterBets')
		else
			TriggerEvent('DoLongHudText', 'Its closed', 2)
		end
	end
end)

-- RegisterCommand("slot_toggle", function(source, args)
--     local myJob = exports["plutorp_manager"]:isPed("myJob")
--     if myJob == "best_buds" then
--         enabled = not enabled
--         TriggerEvent("DoLongHudText", ('Slot has been %s!'):format(enabled and 'Enabled' or 'Disabled')) 
--     end
-- end)

RegisterNetEvent('attempt:slot-in', function()
    TriggerServerEvent("attempt:slot")
end)



RegisterNetEvent("attempt:change:slot", function()
	if exports['plutorp_manager']:isPed("myjob") == "casino_dealer" then
		TriggerServerEvent("slot:toggle")
	else
		TriggerEvent("DoLongHudText", "This is only for Casino Dealer to use.", 2)
	end
end)
