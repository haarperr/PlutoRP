local modifiedWeapons = {
  ["weapon_bat"] = 0.4,
  ["weapon_knife"] = 0.5,
  ["weapon_flashlight"] = 0.4,
  ["weapon_nightstick"] = 0.4,
  -- ["weapon_dagger"] = 0.3,
  -- ["weapon_bottle"] = 0.3,
  -- ["weapon_crowbar"] = 0.3,
  -- ["weapon_unarmed"] = 0.3,
  -- ["weapon_golfclub"] = 0.3,
  -- ["weapon_hammer"] = 0.3,
  -- ["weapon_hatchet"] = 0.3,
  -- ["weapon_knuckle"] = 0.3,
  -- ["weapon_machete"] = 0.3,
  -- ["weapon_switchblade"] = 0.3,
  -- ["weapon_wrench"] = 0.3,
  -- ["weapon_battleaxe"] = 0.3,
  -- ["weapon_poolcue"] = 0.3,
  -- ["weapon_stone_hatchet"] = 0.3,
}

local meleeEffects = {
  ["weapon_bat"] = "knockdown",
  ["weapon_unarmed"] = "knockdownlowhp",
  ["weapon_brick"] = "knockdown",
  ["weapon_shoe"] = "knockdownlowhp",
}

CreateThread(function()
  for weapon, modifier in pairs(modifiedWeapons) do
    local hash = GetHashKey(weapon)
    SetWeaponDamageModifier(hash, modifier)
  end
  while true do
    Wait(1000)
    SetWeaponDamageModifier(-1813897027 --[[ Hash ]], 0.001)
  end
end)

local GrenadeHash = -1813897027

function DoFlashBang()
    StartScreenEffect("Dont_tazeme_bro", 0, true)
    TriggerEvent('InteractSound_CL:PlayOnOne','flashbang', 0.05)
    ShakeGameplayCam("HAND_SHAKE",2.0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 0.5)
    Wait(12500)
    ShakeGameplayCam("HAND_SHAKE",0.0)    
    StopScreenEffect("Dont_tazeme_bro")
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.00)
    StopGameplayCamShaking() 
end

AddEventHandler("DamageEvents:EntityDamaged", function(victim, attacker, pWeapon, isMelee)
  local playerPed = PlayerPedId()

  if victim ~= playerPed then
    return
  end

  if pWeapon == GrenadeHash then
    DoFlashBang()
    return
  end

  for weapon, effect in pairs(meleeEffects) do
    local hash = GetHashKey(weapon)

    if pWeapon == hash and effect == "knockdown" then
      local health = GetEntityHealth(PlayerPedId())
      local time = map_range(health, 0.0, 200.0, 3000, 0)
      PerformEffect(effect, ped, time)
      break
    end

    if pWeapon == hash and effect == "knockdownlowhp" then
      local health = GetEntityHealth(PlayerPedId())
      local time = map_range(health, 0.0, 150.0, 500, 0)
      PerformEffect("knockdown", ped, time)
      break
    end
  end
end)

local IsKnockedDown = false
function PerformEffect(effect, ped, time)
  local ped = PlayerPedId()
  if effect == "knockdown" then
    if time <= 0.0 then
      return
    end

    if not IsKnockedDown then
      IsKnockedDown = true

      Citizen.CreateThread(function()
        while IsKnockedDown do
          SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
          Citizen.Wait(50)
        end
      end)

      Citizen.Wait(time)

      IsKnockedDown = false
    end
  end
end

function map_range(s, a1, a2, b1, b2)
  return b1 + (s - a1) * (b2 - b1) / (a2 - a1)
end