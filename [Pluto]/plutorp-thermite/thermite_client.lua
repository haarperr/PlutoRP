local currentFires = {}

RegisterNetEvent("thermite:StartClientFires")
AddEventHandler("thermite:StartClientFires", function(x,y,z,arg1,arg2)
  if #(vector3(x,y,z) - GetEntityCoords(PlayerPedId())) < 100 then
    local fire = StartScriptFire(x,y,z,arg1,arg2)
    currentFires[#currentFires+1]=fire
  end
end)

RegisterNetEvent("thermite:StopFiresClient")
AddEventHandler("thermite:StopFiresClient", function()
   for p,j in ipairs(currentFires) do
        RemoveScriptFire(j)
    end
end)

function startFireAtLocation(x,y,z,time)
      local rand = math.random(7,11)

        for j=1,rand do   

            local randy = randomFloat(0,0.4,5)
            local randx = randomFloat(0,0.4,5)

            if math.random(1,2) == 2 then
                y = y + randy
            else
                y = y - randy
            end

            if math.random(1,2) == 2 then
                x = x + randx
            else
                x = x - randx
            end

            TriggerServerEvent("thermite:StartFireAtLocation",x,y,z,24,false)
      end

      Citizen.Wait(time)
      TriggerServerEvent("thermite:StopFires")

end

function randomFloat(min, max, precision)
    local range = max - min
    local offset = range * math.random()
    local unrounded = min + offset

    if not precision then
        return unrounded
    end

    local powerOfTen = 10 ^ precision
    return math.floor(unrounded * powerOfTen + 0.5) / powerOfTen
end

local currentlyInGame = false
local passed = false;


-----------------
-- dropAmount , the amount of letters to drop for completion
-- Letter , the letter set , letterset 1 = [q,w,e] letterset 2 = [q,w,e,j,k,l] , the set is used to determain what letters will drop
-- speed , the speed that the letters move on the screen
-- inter , interval , the time between letter drops
----------------

function startGame(dropAmount,letter,speed,inter)
  openGui()
  play(dropAmount,letter,speed,inter)
  currentlyInGame = true
  while currentlyInGame do
    Wait(400)
    if exports["plutorp_manager"]:isPed("dead") then 
      closeGui()
    end 
  end

  return passed;
end



local gui = false

function openGui()
    gui = true
    SetNuiFocus(true,true)
    SendNUIMessage({openPhone = true})
end

function play(dropAmount,letter,speed,inter) 
  SendNUIMessage({openSection = "playgame", amount = dropAmount,letterSet = letter,speed = speed,interval = inter})
end

function CloseGui()
    currentlyInGame = false
    gui = false
    SetNuiFocus(false,false)
    SendNUIMessage({openPhone = false})
end

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  CloseGui()
  cb('ok')
end)

RegisterNUICallback('failure', function(data, cb)
  passed = false
  CloseGui()
  cb('ok')
end)

RegisterNUICallback('complete', function(data, cb)
  passed = true
  CloseGui()
  cb('ok')
end)


--fireworks--
local particleDict = "scr_indep_fireworks"
local AnimationDict = "anim@mp_fireworks"

RegisterNetEvent('fireworks:box')
AddEventHandler('fireworks:box', function()
  TriggerEvent('inventory:removeItem', "firework1", 1)

	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_3_box', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_03")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	--ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad4", x, y, z)

	Wait(18000)
	DeleteObject(prop)

end)
RegisterNetEvent("syncbad_cl4")
AddEventHandler("syncbad_cl4", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
	end
	
	UseParticleFxAssetNextCall(particleDict)
	local particle = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle6 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle7 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle8 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle9 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 1.8, false, false, false, false)
    Wait(4000)
	UseParticleFxAssetNextCall(particleDict)
    local particle10 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 1.8, false, false, false, false)
    Wait(4000)
	UseParticleFxAssetNextCall(particleDict)
    local particle11 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 1.8, false, false, false, false)
    Wait(4000)
	UseParticleFxAssetNextCall(particleDict)
    local particle12 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 1.8, false, false, false, false)
    Wait(4000)
	UseParticleFxAssetNextCall(particleDict)
    local particle13 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 1.8, false, false, false, false)
end)

RegisterNetEvent('fireworks:cone')
AddEventHandler('fireworks:cone', function()
  TriggerEvent('inventory:removeItem', "fountain", 1)

	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_4_cone', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_04")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	--ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad3", x, y, z)
	
	Wait(18000)
	DeleteObject(prop)

end)
RegisterNetEvent("syncbad_cl3")
AddEventHandler("syncbad_cl3", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
	end
	
	UseParticleFxAssetNextCall(particleDict)
	local particle = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle6 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
    Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
    local particle7 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
    Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
    local particle8 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
    Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
    local particle9 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
    Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
    local particle10 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)

end)

RegisterNetEvent('fireworks:cylinder')
AddEventHandler('fireworks:cylinder', function()
  TriggerEvent('inventory:removeItem', "firework2", 1)
	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_2_cylinder', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_02")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	--ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad2", x, y, z)
		
	Wait(18000)
	DeleteObject(prop)

end)
RegisterNetEvent("syncbad_cl2")
AddEventHandler("syncbad_cl2", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
	end
	
	UseParticleFxAssetNextCall(particleDict)
	local particle = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle6 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle7 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle8 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
end)

RegisterNetEvent('fireworks:rocket')
AddEventHandler('fireworks:rocket', function()
  TriggerEvent('inventory:removeItem', "rocket", 1)
	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_1_rocket', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_01")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	--ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad1", x, y, z)

	local veh = GetClosestVehicle(x,y,z, 100.0, 0, 70)
	SetVehicleAlarm(veh, true)	
	SetVehicleAlarmTimeLeft(veh, 8000)

	Wait(8500)
	DeleteObject(prop)
end)
RegisterNetEvent("syncbad_cl1")
AddEventHandler("syncbad_cl1", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
    end
    UseParticleFxAssetNextCall(particleDict)
    StartParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", x, y, z, 0.0, 0.0, 0.0, 2.5, false, false, false, false)
end)


RegisterNetEvent('fireworks:casino')
AddEventHandler('fireworks:casino', function()

	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords( 0.0, 0.5, -1.02))

	TriggerServerEvent("syncbad3", 1096.7969970703, 220.96501159668, -48.748603820801)
	Wait(18000)

end)
