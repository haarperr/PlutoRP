local activepolice, activeEMS = 0, 0

RegisterServerEvent('attemptduty')
AddEventHandler('attemptduty', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local jobs = exports["plutorp-core"]:getModule("JobManager")
	local job = pJobType and pJobType or 'police'
	jobs:SetJob(user, job, false, function()
		TriggerClientEvent('nowCopGarage', src)
		TriggerClientEvent("DoLongHudText", src, "10-41 and Restocked.", 17)
		TriggerEvent('badBlips:server:registerPlayerBlipGroup', src, 'police')
		TriggerClientEvent("startSpeedo",src)
		activepolice = activepolice + 1
		TriggerClientEvent("job:counts", -1, activepolice, activeEMS)
	end)
end)


RegisterServerEvent("police:officerOffDuty")
AddEventHandler("police:officerOffDuty", function()
	local src = source
	if activepolice > 1 then
		activepolice = activepolice - 1
	else
		activepolice = 0
	end
	TriggerClientEvent("job:counts", -1, activepolice, activeEMS)
	TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'police')
 	TriggerClientEvent("plutorp-jobmanager:playerBecameJob", src, "unemployed", "unemployed", true)
end)


RegisterServerEvent('attemptdutym')
AddEventHandler('attemptdutym', function(src)
	if src == nil or src == 0 then src = source end
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local jobs = exports["plutorp-core"]:getModule("JobManager")
	local job = 'ems'
	jobs:SetJob(user, job, false, function()
		TriggerEvent('badBlips:server:registerPlayerBlipGroup', src, 'ems')
		TriggerClientEvent("DoLongHudText", src, "You are 10-41!",1 )	
		activeEMS = activeEMS + 1
		TriggerClientEvent("job:counts", -1, activepolice, activeEMS)
		TriggerClientEvent("hasSignedOnEms", src)
	end)
end)

RegisterServerEvent('reset:blips')
AddEventHandler('reset:blips', function()
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local characterID = user:getCurrentCharacter().id
	exports.ghmattimysql:execute("SELECT * FROM character_passes WHERE cid = @cid", {['cid'] = characterID}, function(result)
        if result[1] then
			if  result[1].pass_type == "police" then
				TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'police')
				if activepolice > 1 then
					activepolice = activepolice - 1
				else
					activepolice = 0
				end
				TriggerClientEvent("job:counts", -1, activepolice, activeEMS)
			elseif result[1].pass_type == "ems" then
				if activeEMS > 1 then
					activeEMS = activeEMS - 1
				else
					activepoactiveEMSlice = 0
				end
				TriggerClientEvent("job:counts", -1, activepolice, activeEMS)
				TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'police')
			end
		end
	end)
end)

RegisterServerEvent("police:EMSOffDuty")
AddEventHandler("police:EMSOffDuty", function()
	local src = source
	TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'ems')
	if activeEMS > 1 then
		activeEMS = activeEMS - 1
	else
		activeEMS = 0
	end
	TriggerClientEvent("job:counts", -1, activepolice, activeEMS)
 	TriggerClientEvent("plutorp-jobmanager:playerBecameJob", src, "unemployed", "unemployed", true)
end)

RegisterServerEvent("duty:reset:number", function(pJob)
	if pJob == "ems" then
		activeEMS = activeEMS - 1
		Citizen.Wait(100)

		if activeEMS == 0 then
			TriggerEvent("ems:toggle", true)
		end
	elseif pJob == "police" then
		activepolice = activepolice - 1
	end

	Citizen.Wait(100)
	TriggerClientEvent("job:counts", -1, activepolice, activeEMS)
end)

