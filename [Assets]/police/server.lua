local weapons = ""
local playerInjury = {}
local bones = {}
local multipledenominators = {}

local firstname = {
    'Mona',
    'Ray',
    'Sonny',
    'Don',
    'Jo',
    'Joe',
    'Dixon',
    'Ben',
    'Hugh G.',
    'Duncan',
    'Mike',
    'Mike',
    'Mike',
    'Ima',
    'Richard'
}

local lastname = {
    'Alott',
    'Gunn',
    'Day',
    'Key',
    'King',
    'Kane',
    'Uranus',
    'Dover',
    'Rection',
    'McOkiner',
    'Hawk',
    'Hunt',
    'Oxlong',
    'Pigg',
    'Head'
}

local logged = {}

RegisterServerEvent('police:multipledenominators')
AddEventHandler('police:multipledenominators', function(hasdenoms)
	local src = source
	if hasdenoms then
		multipledenominators[src] = true
	else
		multipledenominators[src] = nil
	end
end)

RegisterServerEvent('CrashTackle')
AddEventHandler('CrashTackle', function(player)
	TriggerClientEvent('playerTackled', player)
end)

RegisterServerEvent('police:targetCheckBank')
AddEventHandler('police:targetCheckBank', function(target)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(target)
	local char = user:getCurrentCharacter()
	balance = user:getBalance()
  	local strng = " Bank: "..balance
  	TriggerClientEvent("DoLongHudText", src, strng)
end)

RegisterServerEvent('checkLicensePlate')
AddEventHandler('checkLicensePlate', function(oof)
	local source = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(source)
	local char = user:getCurrentCharacter()
	local job = "Unemployed"
	local message = ""
	local phonenumber = char.phone_number
	local kekw = oof
        exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE `license_plate` = @plate', { ['@plate'] = kekw }, function(result)
        	if result[1] ~= nil then
				exports.ghmattimysql:execute('SELECT * FROM characters WHERE `id` = @cid', { ['@cid'] = result[1].cid }, function(data)
					exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE `owner` = @cid', { ['@cid'] = data[1].id }, function(penis)
						if penis[1] ~= nil then
							job = penis[1].job
							if job == "police" then
								job = "Police"
							elseif job == "ems" then
								job = "EMS"
							end
							local phoneNumber = string.sub(data[1].phone_number, 0, 3) .. '-' .. string.sub(data[1].phone_number, 4, 6) .. '-' .. string.sub(data[1].phone_number, 7, 10)
							-- TriggerClientEvent("chatMessage", source, "DISPATCH", 3, "10-74 (Negative) Name: " .. data[1].first_name .. " " .. data[1].last_name .. " Phone #: " .. phoneNumber .. ' Job: ' .. job)
							-- TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
						else
							-- TriggerClientEvent("chatMessage", source, "DISPATCH", 3, "10-74 (Negative) Name: " .. data[1].first_name .. " " .. data[1].last_name .. " Phone #: " .. phoneNumber .. ' Job: Unemployed')
							-- TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
						end
					end)
				end)
			elseif logged[#logged] ~= nil then
				for k,v in ipairs(logged) do
					if v.plate == kekw then
						-- TriggerClientEvent("chatMessage", source, "DISPATCH", 3, "10-74 (Negative) Name: " .. v.firstname .. " " .. v.lastname .. " Phone #: " .. math.random(000, 999) .. '-' .. math.random(000, 999) .. '-' .. math.random(0000, 9999) .. ' Job: Unemployed')
					end
				end
			else
				local insert = {
					plate = kekw,
					firstname = firstname[math.random(1,5)],
					lastname = lastname[math.random(1,5)]
				}
				-- TriggerClientEvent("chatMessage", source, "DISPATCH", 3, "10-74 (Negative) Name: " .. insert.firstname .. " " .. insert.lastname .. " Phone #: " .. math.random(000, 999) .. '-' .. math.random(000, 999) .. '-' .. math.random(0000, 9999) .. ' Job: Unemployed')
				logged[#logged+1] = insert
				-- TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
	        end
		end)
end)

RegisterServerEvent('dragPlayer:disable')
AddEventHandler('dragPlayer:disable', function()
	TriggerClientEvent('drag:stopped', -1, source)
end)

RegisterServerEvent('dr:releaseEscort')
AddEventHandler('dr:releaseEscort', function(releaseID)
	TriggerClientEvent('dr:releaseEscort', tonumber(releaseID))
end)

RegisterServerEvent('police:IsTargetCuffed')
AddEventHandler('police:IsTargetCuffed', function(playerID)
	local src = source
	TriggerClientEvent("police:IsPlayerCuffed", playerID, src)
end)


RegisterServerEvent('police:showID')
AddEventHandler('police:showID', function(itemInfo)
	local src = source
	local fuck = json.decode(itemInfo)
	local data = {
		['DOB'] = fuck.DOB,
		['Name'] = fuck.Name,
		['Surname'] = fuck.Surname,
		['Sex'] = fuck.Sex,
		['Identifier'] = fuck.identifier,
		['pref'] = "sex"
	}

	if data.Sex == 0 then
		data = {
			['DOB'] = fuck.DOB,
			['Name'] = fuck.Name,
			['Surname'] = fuck.Surname,
			['Sex'] = "M",
			['Identifier'] = fuck.identifier,
			['pref'] = "Male"
		}
	elseif data.Sex == 1 then
		data = {
			['DOB'] = fuck.DOB,
			['Name'] = fuck.Name,
			['Surname'] = fuck.Surname,
			['Sex'] = "F",
			['Identifier'] = fuck.identifier,
			['pref'] = "Female"
		}
	end
	TriggerClientEvent("chat:showCID", -1, data, src)
end)


RegisterServerEvent('police:jailGranted')
AddEventHandler('police:jailGranted', function(args)
	local src = source
	local player = tonumber(args[1])
	local target = exports["plutorp-core"]:getModule("Player"):GetUser(player)
	local character = target:getCurrentCharacter()
	local playerName = character.first_name .. ' ' .. character.last_name

	local pdunit = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	if not pdunit:getVar("job") == "police" then
		local steamid, name = pdunit:getVar("name"), pdunit:getVar("steamid")

		exports["plutorp-core"]:AddLog("Exploiter", pdunit, "User Attempted to jail player while not on pd", {target = playerName, cid = cid, time = tonumber(args[2]), src= src})
		DropPlayer(src, "")

		return
	end

	TriggerClientEvent('beginJail', player, false, args[2], playerName, character.id, date)
	local date = os.date("%c")
	TriggerClientEvent("drawScaleformJail", -1,tonumber(args[2]),playerName,character.id,date)
	TriggerEvent("lastconviction", playerName .. " has been sentenced to " ..tonumber(args[2]) .. " months")
	exports["plutorp-core"]:getModule("JobManager"):SetJob(target, "unemployed", true)
end)


RegisterServerEvent('police:gsrGranted')
AddEventHandler('police:gsrGranted', function(t)
    local copId = source
    TriggerClientEvent("DoLongHudText", t, 'You have been GSR tested',1)
    TriggerClientEvent('police:hasShotRecently', t, copId)
end)

RegisterServerEvent('police:hasShotRecently')
AddEventHandler('police:hasShotRecently', function(shotRecently, copId)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local msg = string.format("%s has returned %s for GSR testing", character.id, shotRecently and "positive" or "negative")
	
    TriggerClientEvent("chatMessage", copId, "", {255,0,0}, msg)
end)

RegisterServerEvent('police:fingerPrintAsk')
AddEventHandler('police:fingerPrintAsk', function(t, v)
	local src = source
	TriggerClientEvent("DoLongHudText", src, 'Finger Printing..', 1)
	TriggerClientEvent("DoLongHudText", t, 'You have ben Finger Print tested', 1)
	TriggerClientEvent('police:fingerPrintVeh', t, v)
end)

RegisterServerEvent('police:remmaskGranted')
AddEventHandler('police:remmaskGranted', function(targetplayer)
    TriggerClientEvent('police:remmaskAccepted', targetplayer)
end)

RegisterServerEvent('unseatAccepted')
AddEventHandler('unseatAccepted', function(targetplayer,x,y,z)
    TriggerClientEvent('unseatPlayerFinish', targetplayer,x,y,z)
end)

RegisterServerEvent("police:targetCheckInventory")
AddEventHandler("police:targetCheckInventory", function(target, status)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(target)
	local char = user:getCurrentCharacter()
	TriggerClientEvent("server-inventory-open", source, "1", "ply-"..char.id)
end)

RegisterServerEvent('police:SeizeCash')
AddEventHandler('police:SeizeCash', function(target)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
	local userz = exports["plutorp-core"]:getModule("Player"):GetUser(target)
	if not user.job.name == 'police' then
		return
	end

	local cash = userz:getCash()
	userz:removeMoney(cash)
	user:addMoney(cash)
	TriggerClientEvent('DoLongHudText', target, 'Your cash and Marked Bills was seized',1)
	TriggerClientEvent('DoLongHudText', src, 'Seized persons cash', 1)
end)


--- POLICE SEXTION -------------------------------

RegisterServerEvent('police:cuffGranted2')
AddEventHandler('police:cuffGranted2', function(t,softcuff)
	local src = source
    
	TriggerClientEvent('menu:setCuffState', t, true)
	TriggerEvent('police:setCuffState2', t, true)
	if softcuff then
        TriggerClientEvent('handCuffedWalking', t)
    else
		TriggerClientEvent('police:getArrested2', t, src)
		TriggerClientEvent('police:cuffTransition',src)
	end
end)

RegisterServerEvent('police:cuffGranted')
AddEventHandler('police:cuffGranted', function(t)
	local src = source
	
		TriggerEvent('police:setCuffState', t, true)
		TriggerClientEvent('menu:setCuffState', t, true)
		TriggerClientEvent('police:getArrested', t, src)
		TriggerClientEvent('police:cuffTransition',src)
end)

RegisterServerEvent('police:escortAsk')
AddEventHandler('police:escortAsk', function(target)
	TriggerClientEvent('dr:escort', target,source)
end)


RegisterServerEvent('falseCuffs')
AddEventHandler('falseCuffs', function(t)
	TriggerClientEvent('falseCuffs',t)
	TriggerClientEvent('menu:setCuffState', t, false)
end)

RegisterServerEvent('police:setCuffState')
AddEventHandler('police:setCuffState', function(t,state)
	TriggerClientEvent('police:currentHandCuffedState',t,true)
	TriggerClientEvent('menu:setCuffState', t, true)
end)

RegisterServerEvent('police:forceEnterAsk')
AddEventHandler('police:forceEnterAsk', function(target,netid)
		TriggerClientEvent('police:forcedEnteringVeh', target, netid)
		TriggerClientEvent('notification', source, 'Seating Player',1)
end)

RegisterServerEvent('ped:forceTrunkAsk')
AddEventHandler('ped:forceTrunkAsk', function(targettrunk)
	TriggerClientEvent('ped:forcedEnteringVeh', targettrunk)
end)

RegisterServerEvent('Evidence:GetWounds')
AddEventHandler('Evidence:GetWounds', function(t)
	TriggerClientEvent('Evidence:GiveWounds',t,source)
end)

RegisterServerEvent('Evidence:GiveWoundsFinish')
AddEventHandler('Evidence:GiveWoundsFinish', function(CurrentDamageList,id,bones)
	local src = source
	TriggerClientEvent('Evidence:CurrentDamageListTarget',id,CurrentDamageList,bones,src)
end)

RegisterServerEvent('evidence:bleeder')
AddEventHandler('evidence:bleeder', function(isBleeding)
	local src = source
	TriggerClientEvent('bleeder:alter',src,isBleeding)
end)

RegisterServerEvent('bones:server:updateServer')
AddEventHandler('bones:server:updateServer', function(bones)
	local src = source

	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local characterId = user:getVar("character").id
	local pastebones = json.encode(bones)
	local bones = json.encode(bones)

	exports.ghmattimysql:execute("UPDATE characters SET `bones` = @bones WHERE id = @identifier", {['bones'] = bones, ['identifier'] = characterId})
end)

RegisterServerEvent('police:bill:player')
AddEventHandler("police:bill:player", function(TargetID, amount)
	local src = source
	local target = tonumber(TargetID)
	local fine = tonumber(amount)
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(target)
	local characterId = user:getCurrentCharacter().id
	if user ~= false then
		if fine > 0 then
			user:removeBank(fine)
			TriggerClientEvent('DoLongHudText', target, "You have been billed for $"..fine, 1)
			TriggerClientEvent('DoLongHudText', src, "You have successfully wrote a bill for $"..fine, 1)
			exports["plutorp-banking"]:UpdateSociety(fine, "police", "add")
		end
	end
end)

RegisterServerEvent('reviveGranted')
AddEventHandler('reviveGranted', function(t)
	TriggerClientEvent('reviveFunction', t)
end)

RegisterServerEvent('ems:healplayer')
AddEventHandler('ems:healplayer', function(t)
	TriggerClientEvent('DoLongHudText', source, "Healing Player", 1)
	TriggerClientEvent('DoLongHudText', t, "You are starting to feel better!", 1)
	TriggerClientEvent('ems:healpassed',t)
end)


RegisterServerEvent("911")
AddEventHandler("911", function(args)
	local src = source

	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local job = user:getVar("job")
	local message = ""

	local phonenumber = char.phone_number

	for k,v in ipairs(args) do
		message = message .. " " .. v
	end
	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	TriggerClientEvent("GPSTrack:Create", src)
	TriggerClientEvent("animation:phonecall", src)
	TriggerClientEvent("chatMessage", src, "911 | " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 3, tostring(message))

	local users = exports["plutorp-core"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["plutorp-core"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("callsound", v)
		TriggerClientEvent("chatMessage", v, "911 | (" .. tonumber(src) .. ") " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 3, tostring(message))
	end
end)

RegisterServerEvent("311")
AddEventHandler("311", function(args)
	local src = source

	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local job = user:getVar("job")
	local message = ""

	local phonenumber = char.phone_number

	for k,v in ipairs(args) do
		message = message .. " " .. v
	end
	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	-- TriggerClientEvent("GPSTrack:Create", src)
	TriggerClientEvent("animation:phonecall", src)
	TriggerClientEvent("chatMessage", src, "311 | " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, { 33, 118, 255 }, tostring(message))

	local users = exports["plutorp-core"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["plutorp-core"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("callsound", v)
		TriggerClientEvent("chatMessage", v, "311 | (" .. tonumber(src) .. ") " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, { 33, 118, 255 }, tostring(message))
	end
end)

RegisterServerEvent("fire:serverStopFire")
AddEventHandler("fire:serverStopFire", function(x,y,z, radius)
	TriggerClientEvent("fire:stopClientFires", -1, x,y,z, radius)
end)

RegisterServerEvent("911r")
AddEventHandler("911r", function(args)
	local src = source
	-- table.remove(args, 1)

	if not args[1] or not tonumber(args[1]) then return end
	local target = args[1]

	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	local job = user:getVar("job")

	local canRun = (job == "police" or job == "ems") and true or false
	if not canRun then return end

	local message = ""

	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	for k,v in ipairs(args) do
		if k > 1 then
			message = message .. " " .. v
		end
	end
	TriggerClientEvent("animation:phonecall", src)

	local users = exports["plutorp-core"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["plutorp-core"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("chatMessage", v, "911r -> " .. target .. " | " .. char.first_name .. ' ' .. char.last_name, 3, tostring(message))
	end

	TriggerClientEvent("chatMessage", target, "911r | (" .. tonumber(src) ..")", 3, tostring(message))
end)


RegisterServerEvent("311r")
AddEventHandler("311r", function(args)
	local src = source
	-- table.remove(args, 1)

	if not args[1] or not tonumber(args[1]) then return end
	local target = args[1]

	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	local job = user:getVar("job")

	local canRun = (job == "police" or job == "ems") and true or false
	if not canRun then return end

	local message = ""

	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	for k,v in ipairs(args) do
		if k > 1 then
			message = message .. " " .. v
		end
	end
	TriggerClientEvent("animation:phonecall", src)

	local users = exports["plutorp-core"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["plutorp-core"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("chatMessage", v, "311r -> " .. target .. " | " .. char.first_name .. ' ' .. char.last_name, { 33, 118, 255 }, tostring(message))
	end

	TriggerClientEvent("chatMessage", target, "311r | (" .. tonumber(src) ..")", { 33, 118, 255 }, tostring(message))
end)
--user:getVar("steamid")


RegisterServerEvent("police:dnaAsk")
AddEventHandler("police:dnaAsk", function(t)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(t)
	local character = user:getCurrentCharacter()
	local dna = character.first_name.. ' ' ..character.last_name
	TriggerClientEvent("evidence:addDnaSwab", src, dna)
	TriggerClientEvent("evidence:swabNotify", t)
end)




RegisterServerEvent("police:targetCheckInventory")
AddEventHandler("police:targetCheckInventory", function(t)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(t)
	local character = user:getCurrentCharacter()
	local cid = character.id
	TriggerClientEvent("server-inventory-open", src, "1", 'ply-'..cid)
	TriggerClientEvent("DoLongHudText", t, "You were searched")
end)



 RegisterServerEvent('police:grantFirearms')
 AddEventHandler('police:grantFirearms', function(t)
 	local src = source
 	local user = exports["plutorp-core"]:getModule("Player"):GetUser(t)
 	local character = user:getCurrentCharacter()
 		if presearch[1] then
 			exports.ghmattimysql:execute('SELECT * FROM user_licenses WHERE `owner`= ? AND `type` = ? AND `status` = ?', {character.id, "Firearm", "0"}, function(data)
 				if data[1] then
 					exports.ghmattimysql:execute("UPDATE user_licenses SET `status` = @status WHERE `owner` = @owner AND `type` = @type", { ['status'] = "1", ['owner'] = character.id, ['type'] = "Firearm"})
 					TriggerClientEvent('DoLongHudText', src, 'You have successfully validated their firearms license.', 1)
 					TriggerClientEvent('DoLongHudText', t, 'Your\'re firearms license has been validated.', 1)
 					TriggerClientEvent("wtflols", t, 1)

					-- finalize Payment
 					user:removeBank(5000)
					exports["plutorp-banking"]:UpdateSociety(5000, "police")
					
 				else
 					TriggerClientEvent('DoLongHudText', src, 'They already have a active firearms license.', 2)
 				end
 			end)
		end
	end)

RegisterServerEvent('police:RevokeFirearms')
AddEventHandler('police:RevokeFirearms', function(t)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(t)
	local character = user:getCurrentCharacter()
	exports.ghmattimysql:execute('SELECT * FROM user_licenses WHERE `owner`= ? AND `type` = ? AND `status` = ?', {character.id, "Firearm", "1"}, function(data)
		if data[1] then
			exports.ghmattimysql:execute("UPDATE user_licenses SET `status` = @status WHERE `owner` = @owner AND `type` = @type", { ['status'] = "0", ['owner'] = character.id, ['type'] = "Firearm"})
			TriggerClientEvent('DoLongHudText', src, 'You have successfully revoked their firearms license.', 1)
			TriggerClientEvent('DoLongHudText', t, 'Your\'re firearms license was revoked.', 1)
			TriggerClientEvent("wtflols", t, 0)
		else
			TriggerClientEvent('DoLongHudText', src, 'They dont have a active firearms license.', 2)
		end
	end)
end)



RegisterServerEvent('police:grantHunting')
AddEventHandler('police:grantHunting', function(t)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	exports.ghmattimysql:execute('SELECT * FROM user_licenses WHERE `owner`= ? AND `type` = ? AND `status` = ?', {character.id, "Hunting", "0"}, function(data)
		if data[1] then
			exports.ghmattimysql:execute("UPDATE user_licenses SET `status` = @status WHERE `owner` = @owner AND `type` = @type", { ['status'] = "1", ['owner'] = character.id, ['type'] = "Hunting"})
			TriggerClientEvent('DoLongHudText', src, 'Your\'re Hunting license has been validated.', 1)
			TriggerClientEvent("plutorp-hunting:allowed", src, true)
			user:removeBank(250)
		else
			TriggerClientEvent('DoLongHudText', src, 'You already have a active hunting license.', 2)
		end
	end)
end)


-- RegisterServerEvent('police:grantFishing')
-- AddEventHandler('police:grantFishing', function(t)
-- 	local src = source
-- 	local user = exports["plutorp-core"]:getModule("Player"):GetUser(t)
-- 	local character = user:getCurrentCharacter()
-- 	exports.ghmattimysql:execute('SELECT * FROM user_licenses WHERE `owner`= ? AND `type` = ? AND `status` = ?', {character.id, "Fishing", "0"}, function(data)
-- 		if data[1] then
-- 			exports.ghmattimysql:execute("UPDATE user_licenses SET `status` = @status WHERE `owner` = @owner AND `type` = @type", { ['status'] = "1", ['owner'] = character.id, ['type'] = "Fishing"})
-- 			TriggerClientEvent('DoLongHudText', src, 'You have successfully validated their Fishing license.', 1)
-- 			TriggerClientEvent('DoLongHudText', t, 'Your\'re Fishing license has been validated.', 1)
-- 			TriggerClientEvent("plutorp-fish:allowed", t, true)
-- 			user:removeBank(250)
-- 			exports.ghmattimysql:execute("SELECT * FROM group_banking WHERE group_type = @id", {['id'] = "police"}, function(result)
-- 				local updatedbalance = result[1].bank + "250"
-- 				exports.ghmattimysql:execute("UPDATE group_banking SET `bank` = @bank WHERE `group_type` = @id", { ['id'] = "police", ['bank'] = updatedbalance})
-- 			end)
-- 		else
-- 			TriggerClientEvent('DoLongHudText', src, 'They have a active fishing license.', 2)
-- 		end
-- 	end)
-- end)


-- RegisterServerEvent('police:RevokeFishing')
-- AddEventHandler('police:RevokeFishing', function(t)
-- 	local src = source
-- 	local user = exports["plutorp-core"]:getModule("Player"):GetUser(t)
-- 	local character = user:getCurrentCharacter()
-- 	exports.ghmattimysql:execute('SELECT * FROM user_licenses WHERE `owner`= ? AND `type` = ? AND `status` = ?', {character.id, "Hunting", "1"}, function(data)
-- 		if data[1] then
-- 			exports.ghmattimysql:execute("UPDATE user_licenses SET `status` = @status WHERE `owner` = @owner AND `type` = @type", { ['status'] = "0", ['owner'] = character.id, ['type'] = "Fishing"})
-- 			TriggerClientEvent('DoLongHudText', src, 'You have successfully revoked their Fishing license.', 1)
-- 			TriggerClientEvent('DoLongHudText', t, 'Your\'re Fishing license has been revoked.', 1)
-- 			TriggerClientEvent("plutorp-fish:allowed", t, false)
-- 		else
-- 			TriggerClientEvent('DoLongHudText', src, 'They dont have a active fishing license.', 2)
-- 		end
-- 	end)
-- end)

RegisterServerEvent("serials:insert")
AddEventHandler("serials:insert", function(srcID, serial)
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(srcID)
	local ply = user:getCurrentCharacter()
	local name = ply.first_name .. " " ..ply.last_name
	exports.ghmattimysql:execute('INSERT INTO weapon_serials (serial, owner) VALUES (@serial, @owner)', {
		['@serial'] = serial,
		['@owner'] = name
	}, function()
	end)
end)

RegisterServerEvent("serial:search:weapon")
AddEventHandler("serial:search:weapon", function(serial)
	local src = source
	if serial ~= nil then
		exports.ghmattimysql:execute('SELECT `owner` FROM weapon_serials WHERE `serial`= ?', {serial}, function(data)
			if data[1] then
				TriggerClientEvent("DoLongHudText", src, "Weapon database returns the owner to: "..data[1].owner)
			else
				TriggerClientEvent("DoLongHudText", src, "This serial is not active", 2)
			end
		end)
	end
end)

RegisterCommand("announce", function(source, args)
	local src = source
	local msg = ""
    for i = 1, #args do
      msg = msg .. " " .. args[i]
    end
	TriggerEvent("doj:announce", src, msg)
end)


RegisterServerEvent("doj:announce")
AddEventHandler("doj:announce", function(srcID, args)
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(srcID)
	local characterId = user:getCurrentCharacter().id
	exports.ghmattimysql:execute("SELECT `pass_type` FROM character_passes WHERE cid = @cid AND rank = 3", {['cid'] = characterId}, function(result)
		if result[1] then
			if result[1].pass_type == "DOJ" then
				TriggerClientEvent('chatMessage', -1, 'State Announcement', 4, args)
			else
				TriggerClientEvent("DoLongHudText", srcID, "You cannot do this!", 2)
			end
		end
	end)
end)



RegisterServerEvent("fire:event")
AddEventHandler("fire:event", function(pJob, Passid)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
	local characterId = user:getCurrentCharacter().id
	if Passid == characterId then
		TriggerClientEvent("DoLongHudText", src, "You cant fire yourself, my guy", 2)
		return
	end
	exports.ghmattimysql:execute("SELECT * FROM character_passes WHERE cid = @cid AND pass_type = @type AND rank >= 4", {['cid'] = characterId, ['type'] = pJob}, function(pre)
		if pre[1] then
			exports.ghmattimysql:execute("SELECT * FROM character_passes WHERE cid = @cid AND pass_type = @type", {['cid'] = Passid, ['type'] = pJob}, function(data)
				if data[1] then
					local name = data[1].name
					exports.ghmattimysql:execute('DELETE FROM character_passes WHERE `cid`= ? AND `pass_type`= ?', {Passid, pJob})
					exports.ghmattimysql:execute("SELECT * FROM jobs_whitelist WHERE cid = @cid AND job = @job", {['cid'] = Passid, ['job'] = pJob}, function(data2)
						if data2[1] then
							exports.ghmattimysql:execute('DELETE FROM jobs_whitelist WHERE `cid`= ? AND `job`= ?', {Passid, pJob})
						end
						TriggerClientEvent('fired:success', -1, Passid)
						TriggerClientEvent('DoLongHudText', src, ('You have fired %s!'):format(name))
					end)
				end
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You cant do this!")
		end
	end)
end)