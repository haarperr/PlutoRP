-- e
-- --	[2] = "prop_cs_package_01",

-- -- delivery / dump start.

-- -- local hotSpots = {
-- -- 	["Strawberry"] = { ["ratio"] = 0, ["zone"] = 1 },
-- -- 	["Rancho"] = { ["ratio"] = 0, ["zone"] = 1 },
-- -- 	["Chamberlain Hills"] = { ["ratio"] = 0, ["zone"] = 1 },
-- -- 	["Davis"] = { ["ratio"] = 0, ["zone"] = 1 },
-- -- 	["West Vinewood"] = { ["ratio"] = 0, ["zone"] = 2 },
-- -- 	["Downtown Vinewood"] = { ["ratio"] = 0, ["zone"] = 2 },
-- -- 	["San Andreas"] = { ["ratio"] = 0, ["zone"] = 3 },
-- -- 	["Sandy Shores"] = { ["ratio"] = 0, ["zone"] = 3 },

-- -- 	["Macdonald St"] = { ["ratio"] = 0, ["zone"] = 4 },
-- -- 	["Jamestown St"] = { ["ratio"] = 0, ["zone"] = 4 },
-- -- 	["Carson Ave"] = { ["ratio"] = 0, ["zone"] = 4 },
-- -- }
-- local plyId = PlayerPedId()
-- local plyCoords = GetEntityCoords(plyId)
-- local blnPlySpawned = false

-- Citizen.CreateThread( function()
-- 	while not blnPlySpawned
-- 	do
-- 		Citizen.Wait(100)
-- 	end

	
-- 	-- while true do 
-- 	-- 	plyId = PlayerPedId()
-- 	-- 	plyCoords = GetEntityCoords(plyId)
-- 	-- 	Citizen.Wait(200)
-- 	-- end
-- end)


-- RegisterNetEvent('drugs:hotSpots')
-- AddEventHandler('drugs:hotSpots', function(newhotSpots)
-- 	hotSpots = newhotSpots
-- end)
-- RegisterNetEvent('playerSpawned')
-- AddEventHandler('playerSpawned', function(newhotSpots)
-- 	blnPlySpawned = true
-- 	--TriggerServerEvent("weed:requestTable")
-- end)
-- --Strawberry
-- --Rancho
-- --Chamberlain Hills
-- --Davis
-- local pedsused = {}

-- -- local cocainetime = false
-- -- local cracktime = false
-- local sellingcocaine = false
-- local sellingcrack = false
-- local sellingweed = false
-- local sellingmeth = false
-- local sellingmethbad = false

-- function EndSelling()
-- 	cooldown = false
-- 	sellingweed = false
-- 	sellingcocaine = false
-- 	sellingcrack = false
-- 	sellingmethbad = false
-- 	sellingmeth = false
-- end


-- function GetRandomNPC()
--     local playerped = plyId
--     local playerCoords = plyCoords
--     local handle, ped = FindFirstPed()
--     local success
--     local rped = nil
--     local distanceFrom
--     repeat
--         local pos = GetEntityCoords(ped)
--         local distance = #(playerCoords - pos)
--         if canPedBeUsed(ped,true) and distance > 1.0 and distance < 5.0 and (distanceFrom == nil or distance < distanceFrom) then
--             distanceFrom = distance
--             rped = ped
--             success = false
--             pedsused["conf"..rped] = true
--         end
--         success, ped = FindNextPed(handle)
--     until not success
--     EndFindPed(handle)
--     return rped
-- end

-- function canPedBeUsed(ped,fresh)
--     if ped == nil then
--         return false
--     end
--     if pedsused["conf"..ped] and fresh then
--       return false
--     end
--     if ped == plyId then
--         return false
--     end

--     if not DoesEntityExist(ped) then
--         return false
--     end

--     if IsPedAPlayer(ped) then
--         return false
--     end

--     if IsPedFatallyInjured(ped) then
--         return false
--     end

--     if IsPedFleeing(ped) then
--         return false
--     end

--     if IsPedInCover(ped) or IsPedGoingIntoCover(ped) or IsPedGettingUp(ped) then
--         return false
--     end

--     if IsPedInMeleeCombat(ped) then
--         return false
--     end

--     if IsPedShooting(ped) then
--         return false
--     end

--     if IsPedDucking(ped) then
--         return false
--     end

--     if IsPedBeingJacked(ped) then
--         return false
--     end

--     if IsPedSwimming(ped) then
--         return false
--     end

--     if IsPedSittingInAnyVehicle(ped) or IsPedGettingIntoAVehicle(ped) or IsPedJumpingOutOfVehicle(ped) or IsPedBeingJacked(ped) then
--         return false
--     end

--     if IsPedOnAnyBike(ped) or IsPedInAnyBoat(ped) or IsPedInFlyingVehicle(ped) then
--         return false
--     end

--     local pedType = GetPedType(ped)
--     if pedType == 6 or pedType == 27 or pedType == 29 or pedType == 28 then
--         return false
--     end

--     return true
-- end






-- --[[
--  * p1 is anywhere from 4 to 7 in the scripts. Might be a weapon wheel group?
--  * ^It's kinda like that.
--  * 7 returns true if you are equipped with any weapon except your fists.
--  * 6 returns true if you are equipped with any weapon except melee weapons.
--  * 5 returns true if you are equipped with any weapon except the Explosives weapon group.
--  * 4 returns true if you are equipped with any weapon except Explosives weapon group AND melee weapons.
--  * 3 returns true if you are equipped with either Explosives or Melee weapons (the exact opposite of 4).
--  * 2 returns true only if you are equipped with any weapon from the Explosives weapon group.
--  * 1 returns true only if you are equipped with any Melee weapon.
--  * 0 never returns true.
--  * Note: When I say "Explosives weapon group", it does not include the Jerry can and Fire Extinguisher.
-- ]]--


-- local weaponTypes = {
--     ["2685387236"] = { "Unarmed", ["slot"] = 0 },
--     ["3566412244"] = { "Melee", ["slot"] = 1 },
--     ["-728555052"] = { "Melee", ["slot"] = 1 },
--     ["416676503"] = { "Pistol", ["slot"] = 2 },
--     ["3337201093"] = { "SMG", ["slot"] = 3 },
--     ["970310034"] = { "AssaultRifle", ["slot"] = 4 },
--     ["-957766203"] = { "AssaultRifle", ["slot"] = 4 },
--     ["3539449195"] = { "DigiScanner", ["slot"] = 4 },
--     ["4257178988"] = { "FireExtinguisher", ["slot"] = 0 },
--     ["1159398588"] = { "MG", ["slot"] = 4 },
--     ["3493187224"] = { "NightVision", ["slot"] = 0 },
--     ["431593103"] = { "Parachute", ["slot"] = 0 },
--     ["860033945"] = { "Shotgun", ["slot"] = 3 },
--     ["3082541095"] = { "Sniper", ["slot"] = 3 },
--     ["690389602"] = { "Stungun", ["slot"] = 1 },
--     ["2725924767"] = { "Heavy", ["slot"] = 4 },
--     ["1548507267"] = { "Thrown", ["slot"] = 0 },
--     ["1595662460"] = { "PetrolCan", ["slot"] = 1 }
-- }

-- function GetRandomMelee()
-- 	local ws = math.random(1,4)
-- 	if ws == 1 then
-- 		return `WEAPON_KNUCKLE`
-- 	elseif ws == 2 then 
-- 		return `WEAPON_KNIFE`
-- 	elseif ws == 3 then
-- 		return `WEAPON_KNIFE`
-- 	else 
-- 		return `WEAPON_CROWBAR`
-- 	end
-- end

-- function GetRandomPistol()
-- 	local ws = math.random(1,4)
-- 	if ws == 1 then
-- 		return `WEAPON_PISTOL`
-- 	elseif ws == 2 then 
-- 		return `WEAPON_COMBATPISTOL`
-- 	elseif ws == 3 then
-- 		return `WEAPON_APPISTOL`
-- 	else 
-- 		return `WEAPON_PISTOL50`
-- 	end
-- end

-- function GetRandomSmall()
-- 	local ws = math.random(1,4)
-- 	if ws == 1 then
-- 		return `WEAPON_MICROSMG`
-- 	elseif ws == 2 then 
-- 		return `WEAPON_SMG`
-- 	elseif ws == 3 then
-- 		return `WEAPON_ASSAULTSMG`
-- 	else 
-- 		return `WEAPON_PUMPSHOTGUN`
-- 	end
-- end

-- function GetRandomLarge()
-- 	local ws = math.random(1,4)
-- 	if ws == 1 then
-- 		return `WEAPON_ADVANCEDRIFLE`
-- 	elseif ws == 2 then 
-- 		return `WEAPON_ASSAULTSHOTGUN`
-- 	elseif ws == 3 then
-- 		return `WEAPON_BULLPUPRIFLE`
-- 	else 
-- 		return `WEAPON_AUTOSHOTGUN`
-- 	end
-- end



-- function DoRandomHostileAnimaiton(NPC)

-- 	PlayAmbientSpeech1(NPC, "Generic_Fuck_You", "Speech_Params_Force")
-- 	local dict = "mp_player_int_uppergrab_crotch"
-- 	local anim = "mp_player_int_grab_crotch"

-- 	local animNum = math.random(1,4)
-- 	if animNum == 1 then
-- 		dict = "mp_player_int_uppergang_sign_a"
-- 		anim = "mp_player_int_gang_sign_a"
-- 	elseif animNum == 2 then
-- 		dict = "mp_player_int_uppergang_sign_b"
-- 		anim = "mp_player_int_gang_sign_b"
-- 	elseif animNum == 3 then
-- 		dict = "mp_player_int_upperv_sign"
-- 		anim = "mp_player_int_v_sign"
-- 	end
--     TaskLookAtEntity(NPC, plyId, 5500.0, 2048, 3)
--     TaskTurnPedToFaceEntity(NPC, plyId, 5500)

-- 	 Wait(3000)

--     if ( DoesEntityExist( NPC ) and not IsEntityDead( NPC ) ) then 
--         loadAnimDict( dict )
--         TaskPlayAnim( NPC, dict, anim, 8.0, 1.0, -1, 16, 0, 0, 0, 0 )  
--     end

--     PlayAmbientSpeech1(NPC, "Generic_Fuck_You", "Speech_Params_Force")

-- 	Wait(1500)
-- 	PlayAmbientSpeech1(NPC, "Generic_Fuck_You", "Speech_Params_Force")
-- end



-- RegisterNetEvent('armed:success')
-- AddEventHandler('armed:success', function(wp,sc)

-- 	local p = plyId
-- 	local hp = GetRandomHostile(sc,wp)
-- 	local h = 50

-- 	if IsPlayerFreeAiming(PlayerId()) then
-- 		h = h + 10
-- 	end

-- 	if IsPedRunning(p) or IsPedSprinting(p) then
-- 		h = h + 10
-- 	end

	

-- 	if hp then


-- 		local attack = false
-- 		local WeaponHash = 0
-- 		if (wp == 1 and math.random(h) > 10) or (wp == 5 and math.random(h) > 50) or (wp == 6 and math.random(h) > 5) then
-- 			attack = true
-- 			WeaponHash = GetRandomMelee()
-- 		--	--print("1 level Hostile")
-- 		elseif wp == 2 and math.random(h) > 15 then
-- 			attack = true
-- 			WeaponHash = GetRandomPistol()
-- 		--	--print("2 level Hostile")
-- 		elseif wp == 3 and math.random(h) > 25 then
-- 			attack = true
-- 			WeaponHash = GetRandomSmall()
-- 		--	--print("3 level Hostile")
-- 		elseif wp == 4  and math.random(h) > 32 then
-- 			attack = true
-- 			WeaponHash = GetRandomLarge()
-- 		--	--print("4 level Hostile")
-- 		end

-- 		if attack then

-- 	        SetPedRelationshipGroupDefaultHash(hp,`AMBIENT_GANG_LOST`)
-- 	        SetPedRelationshipGroupHash(hp,`AMBIENT_GANG_LOST`)
-- 	       	RemoveAllPedWeapons(hp, true)
	       
-- 	       	DoRandomHostileAnimaiton(hp)

-- 			SetPedDropsWeaponsWhenDead(hp,false)
			
-- 		--	--print("weapoin given " .. WeaponHash)
-- 			GiveWeaponToPed(hp, WeaponHash, 120, 0, 1)
-- 			SetCurrentPedWeapon(hp, WeaponHash, true)
--     		TaskCombatPed(hp, plyId, 0, 16)

--     		Wait(60000)

--     		if not IsEntityDead( NPC ) then
--     			TaskWanderStandard(hp, 100.0, 100) 
--    			end

--     	end


-- 	end

-- end)


-- function GetRandomHostile(sc,wp)
--     local playerped = plyId
--     local playerCoords = GetEntityCoords(playerped)
--     local handle, ped = FindFirstPed()
--     local success
--     local rped = nil
--     local distanceFrom
--     repeat
--         local pos = GetEntityCoords(ped)
--         local distance = #(playerCoords - pos)
--         if GetPedRelationshipGroupHash(ped) == sc and canPedBeUsed(ped,true) and HasEntityClearLosToEntity(playerped,ped,17)  and distance > 3.0 and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
--             distanceFrom = distance
--             rped = ped
--             if wp == 5 or wp == 6 then
--             	if math.random(50) > 40 then
--             		 pedsused["conf"..rped] = true
--             	end
--             else
--             	pedsused["conf"..rped] = true
--             end
           
--         end
--         success, ped = FindNextPed(handle)
--     until not success
--     EndFindPed(handle)
--     return rped
-- end

-- -- Strawberry && Chamberlain Hills is North side
-- -- Davis is South Central
-- -- Rancho is East Side



-- -- 1166638144 -- ballas / north central

-- -- -1033021910 -- grove street - south central

-- -- 296331235 east side / mexican
-- -- GetPedRelationshipGroupHash(ped)
-- local gangSpots = {
-- 	["Strawberry"] = { ["Label"] = "North Side", ["zone"] = 1, ["GroupHashKey"] = 1166638144 },
-- 	["Rancho"] = { ["Label"] = "East Side", ["zone"] = 3, ["GroupHashKey"] = 296331235 },
-- 	["Chamberlain Hills"] = { ["Label"] = "North Side", ["zone"] = 1, ["GroupHashKey"] = 1166638144 },
-- 	["Davis"] = { ["Label"] = "South Central", ["zone"] = 2, ["GroupHashKey"] = -1033021910 },
-- } 

-- --Hawick Ave - Burton




-- Citizen.CreateThread( function()

-- 	while true do 

-- 		while not plyCoords
-- 		do
-- 			Citizen.Wait(10)
-- 		end
		
-- 		local storagedist = #(vector3(83.31, -1635.9, 28.93) - plyCoords)

-- 		local p = plyId
-- 		if storagedist < 700 then
-- 		    local x, y, z = table.unpack(GetEntityCoords(p, true))
-- 		    local Area = GetLabelText(GetNameOfZone(x, y, z))

-- 			if not IsPedSittingInAnyVehicle(p) and gangSpots[Area] then

-- 				if gangSpots[Area]["zone"] then

-- 					local w = GetSelectedPedWeapon(plyId)
-- 					local wg = GetWeapontypeGroup(w)
-- 					local wp = 0

-- 					if weaponTypes[""..wg..""] then
-- 						wp = weaponTypes[""..wg..""]["slot"]
-- 					else 
-- 						if IsPedArmed(p,2) then
-- 							wp = 4
-- 						end
-- 						if IsPedArmed(p,4) then
-- 							wp = 3
-- 						end					
-- 					end

-- 					if (IsPedRunning(p) or IsPedSprinting(p)) and wp == 0  then
-- 						wp = 5
-- 					end


-- 					if (IsPedInMeleeCombat(plyId) or IsPedJacking(plyId)) and wp == 0 then
-- 						wp = 6
-- 					end

-- 					if wp > 0 then
-- 						TriggerEvent("armed:success",wp,gangSpots[Area]["GroupHashKey"])
-- 					end

-- 				end

-- 			else

-- 			end

-- 		end			

-- 		if storagedist > 1000 then
-- 			Citizen.Wait(math.ceil(storagedist*30))
-- 		else
-- 			Citizen.Wait(1000)
-- 		end

-- 	end

-- end)

-- local sellAmount = 1

-- local saleCrack = true
-- local saleCocaine = true
-- local saleMeth = true
-- local saleMethbad = true
-- RegisterNetEvent('drugs:corner:amount')
-- AddEventHandler('drugs:corner:amount', function(newAmount)
-- 	sellAmount = tonumber(newAmount)
-- 	if sellAmount > 3 then
-- 		TriggerEvent("DoShortHudText", "You can only set amount between 1-3, setting amount to 3",1)
-- 		sellAmount = 3
-- 	end
-- end)

-- local LockedAreas = {}


-- RegisterNetEvent('drugs:enabled')
-- AddEventHandler('drugs:enabled', function(weedallowed,crackallowed,cocaineallowed, methbadallowed, methallowed)
-- 	LockedAreas = weedallowed
-- 	saleCrack = crackallowed
-- 	saleCocaine = cocaineallowed
-- 	saleMeth = methallowed
-- 	saleMethbad = methbadallowed
-- end)

-- function CheckArea(street)
-- 	if LockedAreas[street] ~= nil then
-- 		if LockedAreas[street] > 40 then
-- 			return true
-- 		else
-- 			return false
-- 		end
-- 	else
-- 		return false
-- 	end
-- end
-- local MyStreetName = "NA"

-- RegisterNetEvent('drugs:corner')
-- AddEventHandler('drugs:corner', function()
-- 	print("Run the corner selling shit.")
-- 	if cooldown then
-- 		TriggerEvent("DoShortHudText", "You can only set up on corner once every 1 minute.",1)
-- 		return
-- 	end

-- 	if sellingcocaine or sellingcrack or sellingweed or sellingmeth or sellingmethbad then
-- 		EndSelling()
-- 	end
	
--     local x, y, z = table.unpack(GetEntityCoords(plyId, true))
--     local Area = GetLabelText(GetNameOfZone(x, y, z))
--     local x, y, z = table.unpack(GetEntityCoords(plyId, true))

--     local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
--     MyStreetName = GetStreetNameFromHashKey(currentStreetHash)
--     local dst = #(vector3(plyCoords) - vector3(143.62,-1766.86,28.4))

--     if (MyStreetName == "Forum Dr" or MyStreetName == "Brouge Ave" or MyStreetName == "Grove St") and exports["plutorp-inventory"]:hasEnoughOfItem("weedq",1,false) and dst < 500.0 then

-- 	    TriggerEvent("DoShortHudText", "Corner Selling!",1)
-- 	    sellingweed = true
-- 	    cooldown = true

--     else
-- 	    if not hotSpots[Area] then
-- 	    	TriggerEvent("DoShortHudText", "You cant do that here..",2)
-- 	    	return
-- 	    end
	  
-- 	  	if hotSpots[Area]["zone"] == 1  then
-- 			if not saleCrack then
-- 				TriggerEvent("DoShortHudText", "Noones buying something, too much has been sold recently.",2)
-- 				return
-- 			end
-- 	    	TriggerEvent("DoShortHudText", "Corner Selling!",1)
-- 	    	sellingcrack = true
-- 	    	cooldown = true
-- 	    end

		
-- 		if hotSpots[Area]["zone"] == 2  then
-- 			if not saleMethbad then
-- 				TriggerEvent("DoShortHudText", "Noones buying something, too much has been sold recently.",2)
-- 				return
-- 			end
-- 	    	TriggerEvent("DoShortHudText", "Corner Selling!",1)
-- 	    	sellingmethbad = true
-- 	    	cooldown = true
-- 	    end

-- 		if hotSpots[Area]["zone"] == 3  then
-- 			if not saleMeth then
-- 				TriggerEvent("DoShortHudText", "Noones buying something, too much has been sold recently.",2)
-- 				return
-- 			end
-- 	    	TriggerEvent("DoShortHudText", "Corner Selling!",1)
-- 	    	sellingmeth = true
-- 	    	cooldown = true
-- 	    end

-- 		if hotSpots[Area]["zone"] == 4 then
-- 			if not saleCocaine then
-- 				TriggerEvent("DoShortHudText", "Noones buying something, too much has been sold recently.",2)
-- 				return
-- 			end
-- 	    	TriggerEvent("DoShortHudText", "Corner Selling!",1)
-- 	    	sellingcocaine = true
-- 	    	cooldown = true
-- 	    end

-- 	end

--     local plyStartCoords = plyCoords
--     TriggerEvent("increaseAI",true)
--     while sellingcocaine or sellingcrack or sellingweed or sellingmeth or sellingmethbad do

--     	Wait(15000)
--     	TriggerEvent("DoShortHudText", "Corner Selling Active.",1)
--     	local curCoords = plyCoords
-- 		local dstCheck = #(plyStartCoords - curCoords)
		
-- 		if dstCheck > 45.0 then
-- 			TriggerEvent("DoShortHudText","You moved too far and now we have reset your corner sales.")
-- 			EndSelling()
-- 		end
    	
--     	-- if sellingcocaine and not cocainetime then
--     	-- 	TriggerEvent("DoShortHudText","Cocaine time ran out, resetting corner sales.")
--     	-- 	EndSelling()
--     	-- end

--     	-- if sellingcrack and not cracktime then
--     	-- 	TriggerEvent("DoShortHudText","Crack time ran out, resetting corner sales.")
--     	-- 	EndSelling()
--     	-- end


-- 		local RandomNPC = GetRandomNPC()
-- 		local x, y, z = table.unpack(GetEntityCoords(plyId, true))
-- 	    local Area = GetLabelText(GetNameOfZone(x, y, z))
-- 	    local extraValue = 0
-- 	    if hotSpots[Area] then
-- 	    	extraValue = hotSpots[Area]["ratio"]
-- 	    end
-- 		local areaValue = extraValue -- fix this part DICK HEAD
-- 		local saleprice = 2

-- 		if sellingcocaine then
-- 			saleprice = math.random(10, 15)
-- 		elseif sellingweed then
-- 			saleprice = 1
-- 		elseif sellingcrack then
-- 			saleprice = math.random(4, 9)
-- 		elseif sellingmeth then
-- 			saleprice = math.random(8, 10)
-- 		elseif sellingmethbad then
-- 			saleprice = math.random(4, 8)
-- 		else
-- 			saleprice = 2
-- 		end

-- 		saleprice = saleprice * sellAmount

-- 		TriggerEvent("AllowSale", RandomNPC, saleprice, sellAmount)
 
--     end

--     TriggerEvent("DoShortHudText", "Sales Ended.",2)

--     TriggerEvent("increaseAI",false)

--     Wait(60000)
--     cooldown = false
-- end)

-- RegisterNetEvent('MovePed')
-- AddEventHandler("MovePed",function(p)
--     local usingped = p

--     local nm1 = math.random(6,9) / 100
--     local nm2 = math.random(6,9) / 100
--     nm1 = nm1 + 0.3
--     nm2 = nm2 + 0.3
--     if math.random(10) > 5 then
--       nm1 = 0.0 - nm1
--     end

--     if math.random(10) > 5 then
--       nm2 = 0.0 - nm2
--     end

--     local moveto = GetOffsetFromEntityInWorldCoords(plyId, nm1, nm2, 0.0)
--     TaskGoStraightToCoord(usingped, moveto, 1.0, 30.0, 0.0, 0.0)
--     SetPedKeepTask(usingped, true) 

--     local dist = #(moveto - GetEntityCoords(usingped))
--     local toolong = 0
--     local lastcheck = #(GetEntityCoords(usingped) - plyCoords)

--     while dist > 3.5 and toolong < 600 and #(GetEntityCoords(usingped) - plyCoords) > 1.5 do
--     	local dstmoved = lastcheck - #(GetEntityCoords(usingped) - plyCoords)
--     	if dstmoved < 0.5 then
--     		toolong = toolong + 20
--     	end
--       toolong = toolong + 1
--       TaskGoStraightToCoord(usingped, moveto, 1.0, 30.0, 0.0, 0.0)
--       dist = #(moveto - GetEntityCoords(usingped))
--       Citizen.Wait(1000)
--       lastcheck = #(GetEntityCoords(usingped) - plyCoords)
--     end

--     if toolong > 500 then
--     	TaskWanderStandard(usingped, 10.0, 10)
--     else 
    	
-- 	    TaskLookAtEntity(usingped, plyId, 5500.0, 2048, 3)
-- 	    TaskTurnPedToFaceEntity(usingped, plyId, 5500)
-- 	    if not sellingweed then
-- 		    TaskStartScenarioInPlace(usingped, "WORLD_HUMAN_BUM_STANDING", 0, 1)
-- 		end
--     end


-- end)

-- Controlkey = {["generalUse"] = {38,"E"},["generalUseSecondaryWorld"] = {23,"F"}} 
-- RegisterNetEvent('event:control:update')
-- AddEventHandler('event:control:update', function(table)
-- 	Controlkey["generalUse"] = table["generalUse"]
-- 	Controlkey["generalUseSecondaryWorld"] = table["generalUseSecondaryWorld"]
-- end)


-- -- RegisterNetEvent('AllowSale') 
-- -- AddEventHandler('AllowSale', function(NPC,saleprice, amount)

-- -- 	local timer = 0
-- -- 	TriggerEvent("MovePed",NPC)
-- -- 	local startdst = #(GetEntityCoords(NPC) - plyCoords)

-- -- 	while true do
-- -- 		if not canPedBeUsed(NPC,false) then
-- -- 			--print("Oops, the NPC died or some shit.")
-- -- 			return
-- -- 		end 
-- -- 		local curdst = #(GetEntityCoords(NPC) - plyCoords)
-- -- 		if curdst-4 > startdst then

-- -- 			TaskWanderStandard(NPC, 10.0, 10)
-- -- 			return
-- -- 		end
-- -- 		local x,y,z=table.unpack(GetEntityCoords(NPC))
-- -- 		DrawText3DTest(x,y,z, "[" ..Controlkey["generalUse"][2].. "] to sell drugs for " .. saleprice .. " roll(s) [".. Controlkey["generalUseSecondaryWorld"][2] .. "] to shoo")
-- -- 		if IsControlJustReleased(2, Controlkey["generalUse"][1]) and #(plyCoords - vector3(x,y,z)) < 2.0 then
-- -- 			if IsPedModel(NPC,416176080) then
-- -- 				TriggerEvent("shop:isNearPed")
-- -- 			end

-- -- 			-- e stroke
-- -- 			ClearPedTasks(NPC)
-- -- 			ClearPedSecondaryTask(NPC)

-- -- 			TaskTurnPedToFaceEntity(NPC, plyId, 1.0)

-- -- 			SellDrugs(NPC,saleprice, amount)
-- -- 			return
-- -- 		end
-- -- 		if IsControlJustReleased(2, Controlkey["generalUseSecondaryWorld"][1]) and #(plyCoords - vector3(x,y,z)) < 5.0 then
-- -- 			-- h stroke
-- -- 			TaskWanderStandard(NPC, 10.0, 10)
-- -- 			return
-- -- 		end
-- -- 		timer = timer + 1
-- -- 		if timer > 60000 then
-- -- 			TaskWanderStandard(NPC, 10.0, 10)
-- -- 			return
-- -- 		end
-- -- 		Wait(1)
-- -- 	end

-- -- end)

-- function loadAnimDict( dict )
--     while ( not HasAnimDictLoaded( dict ) ) do
--         RequestAnimDict( dict )
--         Citizen.Wait( 5 )
--     end
-- end 



-- function giveAnim(NPC)

--     if ( DoesEntityExist( NPC ) and not IsEntityDead( NPC ) ) then 
    	
-- 	        loadAnimDict( "random@mugging4" )
-- 	        TaskPlayAnim( NPC, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
-- 	        Wait(1000)


--         loadAnimDict( "mp_safehouselost@" )

--         TaskPlayAnim( NPC, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    
--     end
-- end

-- function SellDrugs(NPC,saleprice, amount)

-- 	local success = true

-- 	Citizen.Wait(500)

-- 	PlayAmbientSpeech1(NPC, "Chat_State", "Speech_Params_Force")
-- 	giveAnim(NPC)
-- 	Wait(1000)
-- 	local counter = math.random(100,300)
-- 	while counter > 0 do
-- 		counter = counter - 1
-- 		Citizen.Wait(1)
-- 	end

-- 	local crds = GetEntityCoords(NPC)
-- 	local crds2 = plyCoords

-- 	if #(crds - crds2) > 5.0 or not DoesEntityExist(NPC) or IsEntityDead(NPC) then

-- 		return
-- 	end

-- 	local crack = exports["plutorp-inventory"]:hasEnoughOfItem("1gcrack",5,false)
-- 	if crack and sellingcrack then
-- 		TriggerEvent("inventory:removeItem", "1gcrack", 5)
-- 	end

-- 	local meth = exports["plutorp-inventory"]:hasEnoughOfItem("1gmeth",5,false)
-- 	if meth and sellingmeth then
-- 		TriggerEvent("inventory:removeItem", "1gmeth", 5)
-- 	end

-- 	local methbad = exports["plutorp-inventory"]:hasEnoughOfItem("methbag",5,false)
-- 	if methbad and sellingmethbad then
-- 		TriggerEvent("inventory:removeItem", "methbag", 5)
-- 	end

-- 	local weedbaggies = exports["plutorp-inventory"]:hasEnoughOfItem("weedq",5,false)
-- 	if weedbaggies and sellingweed then
-- 		TriggerEvent("inventory:removeItem", "weedq", 5)
-- 	end


-- 	local cocaine = exports["plutorp-inventory"]:hasEnoughOfItem("1gcocaine",5,false) 
-- 	if cocaine and sellingcocaine then
-- 		TriggerEvent("inventory:removeItem", "1gcocaine", 5)
-- 	end

-- 	if not cocaine and not crack and not weedbaggies and not meth and not methbad then
-- 		EndSelling()
-- 		TaskWanderStandard(NPC, 10.0, 10)
-- 		return
-- 	end


-- 	if not weedbaggies and sellingweed then
-- 		 EndSelling()
-- 		 TaskWanderStandard(NPC, 10.0, 10)
-- 		 return
-- 	end	


-- 	if (not cocaine or not saleCocaine) and sellingcocaine then
-- 		 EndSelling()
-- 		 TaskWanderStandard(NPC, 10.0, 10)
		 
-- 		 return
-- 	end	

-- 	if (not crack or not saleCrack) and sellingcrack then
-- 		 EndSelling()
-- 		 TaskWanderStandard(NPC, 10.0, 10)
		 
-- 		 return
-- 	end	

-- 	if (not meth or not saleMeth) and sellingmeth then
-- 		EndSelling()
-- 		TaskWanderStandard(NPC, 10.0, 10)
		
-- 		return
--    end	

--     if (not methbad or not saleMethbad) and sellingmethbad then
-- 		EndSelling()
-- 		TaskWanderStandard(NPC, 10.0, 10)
	
-- 		return
-- 	end	

-- 	if sellingcrack or sellingcocaine or sellingweed or sellingmeth or sellingmethbad then


-- 		if math.random(24) < 5 then
-- 			TriggerEvent("plutorp-dispatch:drugsales")
-- 		end


-- 		if sellingweed then
-- 			TriggerServerEvent("sales:count","weedq",5,MyStreetName)
-- 		end	


-- 		if sellingcocaine then
-- 			TriggerServerEvent("sales:count","1gcocaine",5)
-- 		end	

-- 		if sellingcrack then
-- 			TriggerServerEvent("sales:count","1gcrack",5)
-- 		end	

		
-- 		if sellingmeth then
-- 			TriggerServerEvent("sales:count","1gmeth",5)
-- 		end	

		
-- 		if sellingmethbad then
-- 			TriggerServerEvent("sales:count","methbag",5)
-- 		end	





-- 		PlayAmbientSpeech1(NPC, "Generic_Thanks", "Speech_Params_Force_Shouted_Critical")

-- 		TriggerEvent("player:receiveItem","cashroll",saleprice)
-- 		TriggerEvent("client:newStress",true,50)

-- 		giveAnim(plyId)
-- 		Wait(4000)
-- 		TaskWanderStandard(NPC, 10.0, 10)

-- 	end

-- end



-- -- RegisterNetEvent('cocainetime')
-- -- AddEventHandler('cocainetime', function(pass)
-- -- 	cocainetime = pass
-- -- end)

-- -- RegisterNetEvent('cracktime')
-- -- AddEventHandler('cracktime', function(pass)
-- -- 	cracktime = pass	
-- -- end)


-- function DrawText3Ds(x,y,z, text)
--     local onScreen,_x,_y=World3dToScreen2d(x,y,z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())
--     SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(1)
--     AddTextComponentString(text)
--     DrawText(_x,_y)
--     local factor = (string.len(text)) / 370
--     DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
-- end


-- Citizen.CreateThread(function()
-- 	exports['plutorp-target']:AddBoxZone("smallshit",vector3(1509.13, 3573.66, 38.74), 0.8, 1, {
-- 		name="smallshit",
-- 		heading=350,
-- 		minZ=35.54,
-- 		maxZ=39.54
-- 	}, {
-- 		options = {
-- 			{
-- 				event = "break:smallcoke",
-- 				icon = "fas fa-hand-holding",
--                 label = "Hand Something Over"
-- 			},
-- 		},
-- 		job = {"all"},
-- 		distance = 1.5
-- 	})

-- 	exports['plutorp-target']:AddBoxZone("bigshit",	vector3(1795.01, 4602.61, 37.68), 1.5, 0.5, {
-- 		name="bigshit",
-- 		heading=275,
-- 		minZ=35.08,
-- 		maxZ=39.08
-- 	}, {
-- 		options = {
-- 			{
-- 				event = "break:bigcoke",
-- 				icon = "fas fa-hand-holding",
--                 label = "Hand Something Over"
-- 			},
-- 		},
-- 		job = {"all"},
-- 		distance = 1.5
-- 	})

-- 	exports['plutorp-target']:AddBoxZone("hoyabig",	vector3(-2176.28, 4295.2, 49.05), 1.4, 1, {
-- 		name="hoyabig",
-- 		heading=330,
-- 		minZ=46.65,
-- 		maxZ=50.65
-- 	}, {
-- 		options = {
-- 			{
-- 				event = "break:bigmeth",
-- 				icon = "fas fa-hand-holding",
--                 label = "Hand Something Over"
-- 			},
-- 		},
-- 		job = {"all"},
-- 		distance = 1.5
-- 	})

-- 	exports['plutorp-target']:AddBoxZone("hoyasmall",vector3(-31.04, 1955.23, 190.19), 0.7, 0.5, {
-- 		name="small meth",
-- 		heading=280,
-- 		minZ=186.99,
-- 		maxZ=190.99
-- 	}, {
-- 		options = {
-- 			{
-- 				event = "break:smallmeth",
-- 				icon = "fas fa-hand-holding",
--                 label = "Hand Something Over"
-- 			},
-- 		},
-- 		job = {"all"},
-- 		distance = 1.5
-- 	})

-- 	--coke--
-- 	modelHash = GetHashKey("a_m_m_tramp_01")
-- 	RequestModel(modelHash)
-- 	while not HasModelLoaded(modelHash) do
-- 		Wait(1)
-- 	end
-- 	ped = CreatePed(0, modelHash , 1508.9195556641, 3573.6394042969, 38.736469268799 - 1,true)
-- 	FreezeEntityPosition(ped, true)
-- 	SetEntityInvincible(ped, true)
-- 	SetEntityHeading(ped,268.67163085938)
-- 	SetBlockingOfNonTemporaryEvents(ped, true)
-- 	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_COFFEE", 0, true)

-- 	--meth
-- 	modelHash = GetHashKey("u_m_m_markfost")
-- 	RequestModel(modelHash)
-- 	while not HasModelLoaded(modelHash) do
-- 		Wait(1)
-- 	end
-- 	ped = CreatePed(0, modelHash , -31.101808547974, 1955.3785400391, 190.18621826172 - 1,true)
-- 	FreezeEntityPosition(ped, true)
-- 	SetEntityInvincible(ped, true)
-- 	SetEntityHeading(ped,198.75639343262)
-- 	SetBlockingOfNonTemporaryEvents(ped, true)
-- 	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_COFFEE", 0, true)
-- end)


-- RegisterNetEvent('break:smallcoke')
-- AddEventHandler('break:smallcoke', function()
-- 	if exports['plutorp-inventory']:hasEnoughOfItem('coke50g', 1) then
-- 		if exports['plutorp-inventory']:hasEnoughOfItem('drugbaggy', 20) then
-- 			amountofcrack = math.random(3, 7)
-- 			exports["plutorp-taskbar"]:taskBar(15000,"Dividing")
-- 			TriggerEvent("inventory:removeItem",'coke50g', 1)
-- 			Citizen.Wait(1000)
-- 			TriggerEvent("inventory:removeItem",'drugbaggy', 20)
-- 			Citizen.Wait(1000)
-- 			TriggerEvent('player:receiveItem', '1gcrack', amountofcrack)
-- 			TriggerEvent('DoLongHudText', "Later, homie!")
-- 		else
-- 			TriggerEvent('DoLongHudText', "You are missing something else!", 2)
-- 		end
-- 	else
-- 		TriggerEvent('DoLongHudText', "Get outta here.")
-- 	end
  
-- end)

-- RegisterNetEvent('break:bigcoke')
-- AddEventHandler('break:bigcoke', function()
-- 	if exports['plutorp-inventory']:hasEnoughOfItem('coke50g', 1) then
-- 		exports["plutorp-taskbar"]:taskBar(15000,"Dividing")
-- 		TriggerEvent("inventory:removeItem",'coke50g', 1)
-- 		TriggerEvent('player:receiveItem', '1gcocaine', 10)
-- 		TriggerEvent('DoLongHudText', "Later, homie!")
-- 	else
-- 		TriggerEvent('DoLongHudText', "You dont have the required materials.")
-- 	end
-- end)

-- RegisterNetEvent('break:smallmeth')
-- AddEventHandler('break:smallmeth', function()
-- 	if exports['plutorp-inventory']:hasEnoughOfItem('methbrick', 1) then
-- 		if exports['plutorp-inventory']:hasEnoughOfItem('drugbaggy', 20)  then
-- 			amountofmethbad = math.random(2, 4)
-- 			exports["plutorp-taskbar"]:taskBar(15000,"Dividing")
-- 			TriggerEvent("inventory:removeItem",'methbrick', 1)
-- 			Citizen.Wait(1000)
-- 			TriggerEvent("inventory:removeItem",'drugbaggy', 20)
-- 			Citizen.Wait(1000)
-- 			TriggerEvent('player:receiveItem', 'methbag', amountofmethbad)
-- 			TriggerEvent('DoLongHudText', "Later, homie!")
-- 		else 
-- 			TriggerEvent('DoLongHudText', "You are missing to pack it!")
-- 		end
-- 	else
-- 		TriggerEvent('DoLongHudText', "Get outta here.")
-- 	end
-- end)

-- RegisterNetEvent('break:bigmeth')
-- AddEventHandler('break:bigmeth', function()
-- 	if exports['plutorp-inventory']:hasEnoughOfItem('methbrick', 1) then
-- 		exports["plutorp-taskbar"]:taskBar(15000,"Dividing")
-- 		TriggerEvent("inventory:removeItem",'methbrick', 1)
-- 		TriggerEvent('player:receiveItem', '1gmeth', 6)
-- 		TriggerEvent('DoLongHudText', "Later, homie!")
-- 	else
-- 		TriggerEvent('DoLongHudText', "You dont have the required materials.")
-- 	end
-- end)


