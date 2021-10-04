local notified = false
local lastNotified = 0

local banks = {
	{name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
	{name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
	{name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
	{name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
	{name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
	{name="Bank", id=108, x=-351.534, y=-49.529, z=49.042},
	{name="Bank", id=106, x=241.727, y=220.706, z=106.286},
	{name="Bank", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
}	

local bModels = {
	[-1126237515] = true,
	[506770882] = true,
	[-870868698] = true,
	[150237004] = true,
	[-239124254] = true,
	[-1364697528]  = true,

}

local function nearBank()
	local player = PlayerPedId()
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 3 then
			return true
		end
	end

    return false
end

function nearATM()
	local xPlayer = PlayerPedId()
	local pos = GetEntityCoords(xPlayer, 0)
  
	for k,v in pairs(bModels) do
		ATMObject = GetClosestObjectOfType(pos, 4., k, false)
  
		if DoesEntityExist(ATMObject) then
			return true
		end
	end
	return false
end


RegisterNetEvent("bank:checkATM", function()
	if (nearATM() and not bMenuOpen) then
		financialAnimation(true, true)
		ToggleUI()
	end
end)

RegisterNetEvent("bank:openbank", function()
	if (nearBank() and not bMenuOpen) then
		financialAnimation(false, true)
		ToggleUI()
	end
end)

RegisterNetEvent("Pluto:Bank:ExtNotify")
AddEventHandler("Pluto:Bank:ExtNotify", function(msg)
	if (not msg or msg == "") then return end

	TriggerEvent("DoLongHudText", msg)
end)


RegisterNetEvent("bank:givecash")
AddEventHandler("bank:givecash", function(sender, reciever, amount)
        t, distance = GetClosestPlayer()
        if (distance ~= -1 and distance < 7.5) then
            if amount > 0 then
                if tonumber(reciever) == GetPlayerServerId(t) then
                    TriggerServerEvent("bank:givemecash", sender, reciever, amount)
                    TriggerEvent("animation:PlayAnimation", "id")
                else
                    TriggerEvent("DoLongHudText", "This player is not online", 2)
                end
            else
                TriggerEvent("DoLongHudText", "Nope.")
            end
        else
            TriggerEvent("DoLongHudText", "You are not near this player", 2)
        end
    end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function financialAnimation(pIsATM, pIsOpening)
	local playerId = PlayerPedId()
	if pIsATM then
	  loadAnimDict("amb@prop_human_atm@male@enter")
	  loadAnimDict("amb@prop_human_atm@male@exit")
	  loadAnimDict("amb@prop_human_atm@male@idle_a")
	  if pIsOpening then
		TaskPlayAnim(playerId, "amb@prop_human_atm@male@idle_a", "idle_b", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
		local finished = exports["plutorp-taskbar"]:taskBar(3000, "Inserting card")
		ClearPedSecondaryTask(playerId)
	  else
		ClearPedTasks(playerId)
		TaskPlayAnim(playerId, "amb@prop_human_atm@male@exit", "exit", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
		local finished = exports["plutorp-taskbar"]:taskBar(1000, "Retrieving Card")
		ClearPedTasks(playerId)
	  end
	else
	  loadAnimDict("mp_common")
	  if pIsOpening then
		ClearPedTasks()
		TaskPlayAnim(playerId, "mp_common", "givetake1_a", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
		local finished = exports["plutorp-taskbar"]:taskBar(1000, "Showing bank documentation")
		ClearPedTasks(playerId)
	  else
		TaskPlayAnim(playerId, "mp_common", "givetake1_a", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
		local finished = exports["plutorp-taskbar"]:taskBar(1000, "Collecting documentation")
		Citizen.Wait(1000)
		ClearPedTasks(playerId)
	  end
	end
end

function GetPlayers()
	local players = {}
	for i = 0, 256 do
	  if NetworkIsPlayerActive(i) then
		players[#players+1]= i
	  end
	end
  
	return players
  end
  
  
  function GetClosestPlayer()
	  local players = GetPlayers()
	  local closestDistance = -1
	  local closestPlayer = -1
	  local closestPed = -1
	  local ply = PlayerPedId()
	  local plyCoords = GetEntityCoords(ply, 0)
	for index,value in ipairs(players) do
	  local target = GetPlayerPed(value)
	  if(target ~= ply) then
		local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
		local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
		if(closestDistance == -1 or closestDistance > distance) then
		  closestPlayer = value
		  closestPed = target
		  closestDistance = distance
		end
	  end
	end
	
	return closestPlayer, closestDistance, closestPed
  
  end

--[[ Show Things ]]--
Citizen.CreateThread(function()
	for k,v in ipairs(banks) do
	  local blip = AddBlipForCoord(v.x, v.y, v.z)
	  SetBlipSprite(blip, v.id)
	  SetBlipDisplay(blip, 4)
	  SetBlipScale  (blip, 0.9)
	  SetBlipColour (blip, 2)
	  SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(tostring(v.name))
	  EndTextCommandSetBlipName(blip)
	end
end)

