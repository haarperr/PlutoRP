local LastCoords, IsUsingPole = nil
local Player, PlayerCoords, NearbyPlayers
-- We check if the player is on the stage 
-- if so then we need to disable collision with nearby players
-- this is needed to prevent players from pushing the dancers away from the pole


Citizen.CreateThread(function()
    local insideStageArea = exports["plutorp-polyzone"]:AddPolyZone("vanilla_unicorn_stage", {
      vector2(110.1001739502, -1290.4718017578),
      vector2(109.52603912354, -1290.9528808594),
      vector2(106.32556915283, -1292.7944335938),
      vector2(106.49578857422, -1293.5419921875),
      vector2(106.50456237793, -1294.5799560547),
      vector2(106.15399932861, -1295.3686523438),
      vector2(105.43189239502, -1296.1444091797),
      vector2(103.70705413818, -1297.1472167969),
      vector2(99.502166748047, -1289.7625732422),
      vector2(101.21369171143, -1288.7757568359),
      vector2(102.29859924316, -1288.5831298828),
      vector2(103.15558624268, -1288.6680908203),
      vector2(103.99409484863, -1289.2835693359),
      vector2(104.40590667725, -1289.8004150391),
      vector2(107.80446624756, -1287.8553466797),
      vector2(108.67828369141, -1287.6324462891),
      vector2(109.44989776611, -1287.8408203125),
      vector2(110.04580688477, -1288.27734375),
      vector2(110.39547729492, -1288.9569091797),
      vector2(110.41469573975, -1289.6296386719)
    }, {
      minZ = 28.260948181152,
      maxZ = 32.260948181152,
      --debugGrid=true,
      gridDivisions=25
    })

    while true do
        local idle = 200
        Player = PlayerPedId()
        PlayerCoords = GetEntityCoords(Player)

        if IsOnStage then
          NearbyPlayers = GetClosestPlayers(PlayerCoords, 5.0)
          idle = 100
        end
        
        Citizen.Wait(idle)
    end
end)

AddEventHandler("plutorp-polyzone:enter", function(zone)
  if zone ~= "vanilla_unicorn_stage" then return end
  IsOnStage = true
end)

AddEventHandler("plutorp-polyzone:exit", function(zone)
  if zone ~= "vanilla_unicorn_stage" then return end
  IsOnStage = false
end)

Citizen.CreateThread(function()
    while true do
        local idle = 200
        if IsOnStage and NearbyPlayers ~= nil and #NearbyPlayers > 0 then
            for _, playerID in ipairs(NearbyPlayers) do
                local playerPed = GetPlayerPed(playerID)
                SetEntityNoCollisionEntity(Player, playerPed, 1)
            end
            idle = 0
        end
        Citizen.Wait(idle)
    end
end)

function GetClosestPlayers(coords, distance)
    local players = {}
    local currentID = PlayerId()
    for _, playerID in ipairs(GetActivePlayers()) do
        local playerCoords = GetEntityCoords(GetPlayerPed(playerID))
        if #(coords - playerCoords) <= distance and playerID ~=currentID then
            table.insert(players, playerID)
        end
    end
    return players
end

local poles = {
  [1] = vector3(108.79771423, -1289.2926025, 29.14),
  [2] = vector3(102.21952819, -1290.1522216, 29.14),
  [3] = vector3(104.77420806, -1294.4742431, 29.14),
}

RegisterNetEvent("poledance:toggle")
AddEventHandler("poledance:toggle", function()
  if IsOnStage then
    if not IsUsingPole then UsePole() else LeavePole() end
  end
end)


RegisterCommand("strip", function(source, args)
  TriggerEvent("poledance:toggle")
end)

function PoleDanceAnimation(pPole, npc, dance, blendIn, blendOut, flag)
  local library, animation, coords

  local selectDance = {
    [0] = function()
      library = 'mini@strip_club@pole_dance@stage_enter'
      animation = 'stage_enter'
      coords = {x = poles[pPole].x + 0.0, y = poles[pPole].y - 0.1, z = poles[pPole].z, h = -60}
    end,
    [1] = function()
      library = 'mini@strip_club@pole_dance@pole_dance1'
      animation = 'pd_dance_01'
      coords = {x = poles[pPole].x + 0.05, y = poles[pPole].y + 0.28, z = poles[pPole].z, h = -60}
    end,
    [2] = function()
      library = 'mini@strip_club@pole_dance@pole_dance2'
      animation = 'pd_dance_02'
      coords = {x = poles[pPole].x + 0.02, y = poles[pPole].y + 0.26, z = poles[pPole].z, h = -60}
    end,
    [3] = function()
      library = 'mini@strip_club@pole_dance@pole_dance3'
      animation = 'pd_dance_03'
      coords = {x = poles[pPole].x + 0.02, y = poles[pPole].y + 0.27, z = poles[pPole].z, h = -60}
    end,
    [4] = function()
      library = 'mini@strip_club@pole_dance@stage_exit'
      animation = 'stage_exit'
      coords = {x = poles[pPole].x + 0.0, y = poles[pPole].y - 0.1, z = poles[poleRandom].z, h = -60}
    end
  }
  local switch = selectDance[dance]
  if (switch) then switch() end
  RequestAnimDict(library)
  while not HasAnimDictLoaded(library) do Citizen.Wait(0) end
  TaskPlayAnimAdvanced(npc, library, animation, coords.x, coords.y, coords.z,
             0.0, 0.0, 0.0, blendIn, blendOut, -1, loop, 0.0, 0, 0)
  return {library, animation}
end

function PoleSequence(pClosestPole, NPC)
  while IsUsingPole do
    Citizen.Wait(0)
    local firstDance = PoleDanceAnimation(pClosestPole, NPC, 1, 8.0, 8.0, 0)
    while GetEntityAnimCurrentTime(NPC, firstDance[1], firstDance[2]) <
      0.999 do Citizen.Wait(0) end
    local secondDance = PoleDanceAnimation(pClosestPole, NPC, 2, 8.0, 8.0, 0)
    while GetEntityAnimCurrentTime(NPC, secondDance[1], secondDance[2]) <
      0.999 do Citizen.Wait(0) end
    local thirdDance = PoleDanceAnimation(pClosestPole, NPC, 3, 8.0, 8.0, 0)
    while GetEntityAnimCurrentTime(NPC, thirdDance[1], thirdDance[2]) <
      0.999 do Citizen.Wait(0) end
  end
end

function GetEntityControl(entity)
  if not NetworkHasControlOfEntity(entity) then
    NetworkRequestControlOfEntity(entity)
    local timedOut = false
    Citizen.SetTimeout(300, function() timedOut = true end)
    while not NetworkHasControlOfEntity(entity) and not timedOut do
      NetworkRequestControlOfEntity(entity)
      Citizen.Wait(10)
    end
  end
end

function UsePole()
  if IsUsingPole then return end
  local Player = PlayerPedId()
  LastCoords = GetEntityCoords(Player)
  IsUsingPole = true
  local closestPoleDist = #(poles[1] - PlayerCoords)
  local closestPole = 1
  for _, pole in pairs(poles) do
    local currentPoleDist = #(pole - PlayerCoords)
    if currentPoleDist < closestPoleDist then
      closestPoleDist = currentPoleDist
      closestPole = _
    end
  end
  PoleSequence(closestPole, Player)
end

function LeavePole()
  if not IsUsingPole then return end
  local Player = PlayerPedId()
  SetEntityCoords(Player, LastCoords.x, LastCoords.y, LastCoords.z, 0.0, 0.0, 0.0, 0)
  IsUsingPole = false
end
