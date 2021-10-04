Citizen.CreateThread(function()
	if GetConvarInt('logs_enabled', 1) == 1 then
		print("^6(plutorp-core)^0 | ^5[anti-cheat]^0 | ^2Currently running and logging all components^0")		
	else
		print("^6(plutorp-core)^0 | ^5[anti-cheat]^0 | ^8Currently disabled / Dev Server^0")	
	end
end)


	AddEventHandler('entityCreating', function(entity)
		if GetConvarInt('logs_enabled', 1) == 1 then
			local model = GetEntityModel(entity)
			local pOwner = NetworkGetEntityOwner(entity)
			for i=1, #blockedItems do 
				if model == GetHashKey(blockedItems[i]) then
					local LogInfo = "Prop Hash: " .. model
					exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868687896432695/nY8bz9fM1kzpSYQwwp62VzvFa--qh2rIeAqfJr9snjJ8MTgY64uYoSZnm6YIC47ht7I2", pOwner, "Cheater: Spawned Blacklisted Prop", "Spawning Props", LogInfo)
					DropPlayer(pOwner, "[Anti-Cheat]: You have been permanently banned.")
					CancelEvent()
				end
			end
		end
	end)

	-- Send message when Player disconnects from the server
	AddEventHandler('playerDropped', function(reason)
		if GetConvarInt('logs_enabled', 1) == 1 then
			local pSrc = source
			local pName = GetPlayerName(pSrc)
			local LogInfo =  pName.. " Disconnected | Reason: " .. reason
			exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868738546860054/oHhD3HKim9P5JJRTP0S2RqM7azfLwpS8J36yyihWy9-KQZhhXVtpp-cGYsr-kqErPkBV", pSrc, "Player Disconnected", "", LogInfo)
		end
	end)


	RegisterServerEvent('player:dead')
	AddEventHandler('player:dead',function(killer, DeathReason, pWeapon)
		if GetConvarInt('logs_enabled', 1) == 1 then
			local pSrc = source
			local pName = GetPlayerName(pSrc)
			local tName = GetPlayerName(killer)

			local LogInfo = pName .. " was killed by " .. tName .. "  | Type: " ..DeathReason
			exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887871224305315861/UQM_-Zmr8GLESxE9tnI2RRGvZ1GeGSYcFn2uhxSZPj-K_oYuk-I7W6fuEvTDDJFT-2Ir", killer, "Combat Encounter", "", LogInfo)
		end
	end)


	RegisterServerEvent('player:damage:multi')
	AddEventHandler('player:damage:multi',function(attacker, weapon, dmg)
		local aName = GetPlayerName(attacker)
		local pName = GetPlayerName(source)
		local pLogData = "Attacker's Steam Name: " ..  aName .. " | ID: " .. attacker .. "\n Damage Modifier: " .. dmg .. "\n Victim's Name: " ..pName.. "\n Weapon: " .. weapon
		exports['plutorp-core']:k_log(attacker, "damage_multi", pLogData)
		DropPlayer(attacker, "Cheating | Damage Modifier | Perma Banned")
	end)


	function k_log(pSrc, LogType, LogInfo)
		if GetConvarInt('logs_enabled', 1) == 1 then
			if LogType == "Spawned:items" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868861800673351/_la56ItORf4XMavDDabFdUja2J7cBgnUS84dxg4OMzSYHNLxkrRLlRzdVMwETPzEr1bC", pSrc, "Spawned Item -> with admin menu", "", LogInfo)
			elseif LogType == "Spawned:car" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868826652381184/DpnSCKr3mG3EK-d0baGJ_eyrScFZ3-phxTJfpPaPSYBJEdxbCKAV28wnjvWhJmM5lP0B", pSrc, "Spawned Car -> with admin menu", "", LogInfo)
			elseif LogType == "Spectating" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/883560654022258689/5wUO76udRkGZim4ArjqdiJi_hKJJ5ZZZADQCMT9VnfT6iKPH0A8k77OTQcQC84W5_XDv", pSrc, "Spectating Toggled -> with admin menu", "", LogInfo)
			elseif LogType == "Searching" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868898081378344/r0FECJHQqI2gcOh3M9xUrslj0XAgbuuVOxIzxEi5sn4s7DhloPSjAkMbfaaYSDW5JRMq", pSrc, "Searching Toggled -> with admin menu", "", LogInfo)
			elseif LogType == "deposit" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868935372955768/SONNNjiy8CUzFBUzIVDiKcB1u0x95e9J9vdjeZ5L734xzRBWZjHQ7f0n4k4j0MEQnvsp", pSrc, "Banking Deposit", "", LogInfo)
			elseif LogType == "withdraw" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868935372955768/SONNNjiy8CUzFBUzIVDiKcB1u0x95e9J9vdjeZ5L734xzRBWZjHQ7f0n4k4j0MEQnvsp", pSrc, "Banking Withdraw", "", LogInfo)
			elseif LogType == "transfer" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887868935372955768/SONNNjiy8CUzFBUzIVDiKcB1u0x95e9J9vdjeZ5L734xzRBWZjHQ7f0n4k4j0MEQnvsp", pSrc, "Bank Transfer", "", LogInfo)
			elseif LogType == "give_cash" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/873848949709107231/en_IMNxq7gv26O7icKa9xaZk9t-A41SyS7oMSNe-8kmT74ZV9eu_mWXvUeUcoD7dJ6Gh", pSrc, "Give Cash", "", LogInfo)
			elseif LogType == "damage_multi" then
				exports['plutorp-core']:DiscordLog("https://discord.com/api/webhooks/887871344249811004/B-cD-uwaW75HPnjNFYB_-FXn9Lj5x5Q8H6qUonRHn0ucOJ_CQ9r7dVvu8PxcdeUFPtVu", pSrc, "Damage Modifier", "Cheating | Damage Modifier | Perma Banned", LogInfo)
			end
		end
	end
