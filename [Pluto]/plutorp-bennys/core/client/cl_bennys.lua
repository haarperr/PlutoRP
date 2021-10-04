--[[
cl_bennys.lua
Functionality that handles the player for Benny's.
Handles applying mods, etc.
]]

--#[Global Variables]#--
isPlyInBennys = false

--#[Local Variables]#--
local plyFirstJoin = false
local disabled = false


local nearDefault = false
local inmenu = false

local bennyLocation = vector3(546.61352539062, -189.59159851074, 53.77131652832)
local bennyLocation2 = vector3(-32.74, -1068.19, 27.79)
local bennyLocationBridge = vector3(727.74, -1088.95, 22.17)
local billyLocationPaleto = vector3(110.8, 6626.46, 31.89)

local bennyLocationMRPD = vector3(450.01, -976.04, 25.03)
local bennyLocationTunershop = vector3(938.37, -970.82, 39.499755859375)
local bennyLocationTunershop2 = vector3(921.81, -984.47, 39.499755859375)
local bennyLocationHayes = vector3(-1417.38, -445.79, 35.30)
local bennyLocationHayes2 = vector3(-1424.19, -449.48, 35.30)
local bennyLocationAutoExotic = vector3(547.25244140625, -189.45771789551, 53.88774871826)

local civrepairbennys = vector3(-38.980415344238, -1054.4558105469, 27.67400932312) -- Repair shop for civs in bennys


local bennyHeading = 87.96134185791

local originalCategory = nil
local originalMod = nil
local originalPrimaryColour = nil
local originalSecondaryColour = nil
local originalPearlescentColour = nil
local originalWheelColour = nil
local originalDashColour = nil
local originalInterColour = nil
local originalWindowTint = nil
local originalWheelCategory = nil
local originalWheel = nil
local originalWheelType = nil
local originalCustomWheels = nil
local originalNeonLightState = nil
local originalNeonLightSide = nil
local originalNeonColourR = nil
local originalNeonColourG = nil
local originalNeonColourB = nil
local originalXenonColour = nil
local originalOldLivery = nil
local originalPlateIndex = nil

local attemptingPurchase = false
local isPurchaseSuccessful = false

--#[Local Functions]#--
local function isNear(pos1, pos2, distMustBe)
    local diff = pos2 - pos1
	local dist = (diff.x * diff.x) + (diff.y * diff.y)

	return (dist < (distMustBe * distMustBe))
end

local function saveVehicle()
    local plyPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(plyPed, false)
    local vehicleMods = {
        neon = {},
        colors = {},
        extracolors = {},
        dashColour = -1,
        interColour = -1,
        lights = {},
        tint = GetVehicleWindowTint(veh),
        wheeltype = GetVehicleWheelType(veh),
        platestyle = GetVehicleNumberPlateTextIndex(veh),
        mods = {},
        smokecolor = {},
        xenonColor = -1,
        oldLiveries = 24,
        extras = {},
        plateIndex = 0,
    }

    vehicleMods.xenonColor = GetCurrentXenonColour(veh)
    vehicleMods.lights[1], vehicleMods.lights[2], vehicleMods.lights[3] = GetVehicleNeonLightsColour(veh)
    vehicleMods.colors[1], vehicleMods.colors[2] = GetVehicleColours(veh)
    vehicleMods.extracolors[1], vehicleMods.extracolors[2] = GetVehicleExtraColours(veh)
    vehicleMods.smokecolor[1], vehicleMods.smokecolor[2], vehicleMods.smokecolor[3] = GetVehicleTyreSmokeColor(veh)
    vehicleMods.dashColour = GetVehicleInteriorColour(veh)
    vehicleMods.interColour = GetVehicleDashboardColour(veh)
    vehicleMods.oldLiveries = GetVehicleLivery(veh)
    vehicleMods.plateIndex = GetVehicleNumberPlateTextIndex(veh)

    for i = 0, 3 do
        vehicleMods.neon[i] = IsVehicleNeonLightEnabled(veh, i)
    end

    for i = 0,16 do
        vehicleMods.mods[i] = GetVehicleMod(veh,i)
    end

    for i = 17, 22 do
        vehicleMods.mods[i] = IsToggleModOn(veh, i)
    end

    for i = 23, 48 do
        vehicleMods.mods[i] = GetVehicleMod(veh,i)
    end

    for i = 1, 12 do
        local ison = IsVehicleExtraTurnedOn(veh, i)
        if 1 == tonumber(ison) then
            vehicleMods.extras[i] = 1
        else
            vehicleMods.extras[i] = 0
        end
    end
    TriggerServerEvent('updateVehicle',vehicleMods,GetVehicleNumberPlateText(veh))  
end

--#[Global Functions]#--
function AttemptPurchase(type, upgradeLevel)
    local cheap = false

    if nearTuner or nearAutoExotics or nearHayes or nearHarmony then
        cheap = true
    end

    if upgradeLevel ~= nil then
        upgradeLevel = upgradeLevel + 2
    end
    TriggerServerEvent("plutorp-bennys:attemptPurchase",cheap, type, upgradeLevel)

    attemptingPurchase = true

    while attemptingPurchase do
        Citizen.Wait(1)
    end

    if not isPurchaseSuccessful then
        PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end

    return isPurchaseSuccessful
end

function RepairVehicle()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local finished = exports["plutorp-taskbar"]:taskBar(2000,"Repairing Engine",false,false,playerVeh)
    Citizen.Wait(1000)
    local finished = exports["plutorp-taskbar"]:taskBar(2000,"Repairing Body",false,false,playerVeh)
    if (finished == 100) then

    SetVehicleFixed(plyVeh)
    SetVehicleDirtLevel(plyVeh, 0.0)
    SetVehiclePetrolTankHealth(plyVeh, 4000.0)
    TriggerEvent('veh.randomDegredation',10,plyVeh,3)
    end
end

function GetCurrentMod(id)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local mod = GetVehicleMod(plyVeh, id)
    local modName = GetLabelText(GetModTextLabel(plyVeh, id, mod))

    return mod, modName
end

function GetCurrentWheel()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local wheel = GetVehicleMod(plyVeh, 23)
    local wheelName = GetLabelText(GetModTextLabel(plyVeh, 23, wheel))
    local wheelType = GetVehicleWheelType(plyVeh)

    return wheel, wheelName, wheelType
end

function GetCurrentCustomWheelState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local state = GetVehicleModVariation(plyVeh, 23)

    if state then
        return 1
    else
        return 0
    end
end

function GetOriginalWheel()
    return originalWheel
end

function GetOriginalCustomWheel()
    return originalCustomWheels
end

function GetCurrentWindowTint()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    return GetVehicleWindowTint(plyVeh)
end

function GetCurrentVehicleWheelSmokeColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local r, g, b = GetVehicleTyreSmokeColor(plyVeh)

    return r, g, b
end

function GetCurrentNeonState(id)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsVehicleNeonLightEnabled(plyVeh, id)

    if isEnabled then
        return 1
    else
        return 0
    end
end

function GetCurrentNeonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local r, g, b = GetVehicleNeonLightsColour(plyVeh)

    return r, g, b
end

function GetCurrentXenonState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsToggleModOn(plyVeh, 22)

    if isEnabled then
        return 1
    else
        return 0
    end
end

function GetCurrentXenonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    return GetVehicleHeadlightsColour(plyVeh)
end

function GetCurrentTurboState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsToggleModOn(plyVeh, 18)

    if isEnabled then
        return 1
    else
        return 0
    end
end

function GetCurrentExtraState(extra)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    return IsVehicleExtraTurnedOn(plyVeh, extra)
end

function CheckValidMods(category, id, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local tempMod = GetVehicleMod(plyVeh, id)
    local tempWheel = GetVehicleMod(plyVeh, 23)
    local tempWheelType = GetVehicleWheelType(plyVeh)
    local tempWheelCustom = GetVehicleModVariation(plyVeh, 23)
    local validMods = {}
    local amountValidMods = 0
    local hornNames = {}

    if wheelType ~= nil then
        SetVehicleWheelType(plyVeh, wheelType)
    end

    if id == 14 then
        for k, v in pairs(vehicleCustomisation) do 
            if vehicleCustomisation[k].category == category then
                hornNames = vehicleCustomisation[k].hornNames

                break
            end
        end
    end

    local modAmount = GetNumVehicleMods(plyVeh, id)
    for i = 1, modAmount do
        local label = GetModTextLabel(plyVeh, id, (i - 1))
        local modName = GetLabelText(label)

        if modName == "NULL" then
            if id == 14 then
                if i <= #hornNames then
                    modName = hornNames[i].name
                else
                    modName = "Horn " .. i
                end
            else
                modName = category .. " " .. i
            end
        end

        validMods[i] = 
        {
            id = (i - 1),
            name = modName
        }

        amountValidMods = amountValidMods + 1
    end

    if modAmount > 0 then
        table.insert(validMods, 1, {
            id = -1,
            name = "Stock " .. category
        })
    end

    if wheelType ~= nil then
        SetVehicleWheelType(plyVeh, tempWheelType)
        SetVehicleMod(plyVeh, 23, tempWheel, tempWheelCustom)
    end

    return validMods, amountValidMods
end

function RestoreOriginalMod()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleMod(plyVeh, originalCategory, originalMod)
    SetVehicleDoorsShut(plyVeh, true)

    originalCategory = nil
    originalMod = nil
end

function RestoreOriginalWindowTint()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleWindowTint(plyVeh, originalWindowTint)

    originalWindowTint = nil
end

function RestoreOriginalColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleColours(plyVeh, originalPrimaryColour, originalSecondaryColour)
    SetVehicleExtraColours(plyVeh, originalPearlescentColour, originalWheelColour)
    SetVehicleDashboardColour(plyVeh, originalDashColour)
    SetVehicleInteriorColour(plyVeh, originalInterColour)

    originalPrimaryColour = nil
    originalSecondaryColour = nil
    originalPearlescentColour = nil
    originalWheelColour = nil
    originalDashColour = nil
    originalInterColour = nil
end

function RestoreOriginalWheels()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    SetVehicleWheelType(plyVeh, originalWheelType)

    if originalWheelCategory ~= nil then
        SetVehicleMod(plyVeh, originalWheelCategory, originalWheel, originalCustomWheels)
        
        if GetVehicleClass(plyVeh) == 8 then --Motorcycle
            SetVehicleMod(plyVeh, 24, originalWheel, originalCustomWheels)
        end

        originalWheelType = nil
        originalWheelCategory = nil
        originalWheel = nil
        originalCustomWheels = nil
    end
end

function RestoreOriginalNeonStates()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleNeonLightEnabled(plyVeh, originalNeonLightSide, originalNeonLightState)

    originalNeonLightState = nil
    originalNeonLightSide = nil
end

function RestoreOriginalNeonColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleNeonLightsColour(plyVeh, originalNeonColourR, originalNeonColourG, originalNeonColourB)

    originalNeonColourR = nil
    originalNeonColourG = nil
    originalNeonColourB = nil
end

function RestoreOriginalXenonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleHeadlightsColour(plyVeh, originalXenonColour)
    SetVehicleLights(plyVeh, 0)

    originalXenonColour = nil
end

function RestoreOldLivery()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleLivery(plyVeh, originalOldLivery)
end

function RestorePlateIndex()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleNumberPlateTextIndex(plyVeh, originalPlateIndex)
end

function PreviewMod(categoryID, modID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalMod == nil and originalCategory == nil then
        originalCategory = categoryID
        originalMod = GetVehicleMod(plyVeh, categoryID)
    end

    if categoryID == 39 or categoryID == 40 or categoryID == 41 then
        SetVehicleDoorOpen(plyVeh, 4, false, true)
    elseif categoryID == 37 or categoryID == 38 then
        SetVehicleDoorOpen(plyVeh, 5, false, true)
    end

    SetVehicleMod(plyVeh, categoryID, modID)
end

function PreviewWindowTint(windowTintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalWindowTint == nil then
        originalWindowTint = GetVehicleWindowTint(plyVeh)
    end

    SetVehicleWindowTint(plyVeh, windowTintID)
end

function PreviewColour(paintType, paintCategory, paintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleModKit(plyVeh, 0)
    if originalDashColour == nil and originalInterColour == nil and originalPrimaryColour == nil and originalSecondaryColour == nil and originalPearlescentColour == nil and originalWheelColour == nil then
        originalPrimaryColour, originalSecondaryColour = GetVehicleColours(plyVeh)
        originalPearlescentColour, originalWheelColour = GetVehicleExtraColours(plyVeh)
        originalDashColour = GetVehicleDashboardColour(plyVeh)
        originalInterColour = GetVehicleInteriorColour(plyVeh)
    end
    if paintType == 0 then --Primary Colour
        if paintCategory == 1 then --Metallic Paint
            SetVehicleColours(plyVeh, paintID, originalSecondaryColour)
            SetVehicleExtraColours(plyVeh, originalPearlescentColour, originalWheelColour)
        else
            SetVehicleColours(plyVeh, paintID, originalSecondaryColour)
        end
    elseif paintType == 1 then --Secondary Colour
        SetVehicleColours(plyVeh, originalPrimaryColour, paintID)
    elseif paintType == 2 then --Pearlescent Colour
        SetVehicleExtraColours(plyVeh, paintID, originalWheelColour)
    elseif paintType == 3 then --Wheel Colour
        SetVehicleExtraColours(plyVeh, originalPearlescentColour, paintID)
    elseif paintType == 4 then --Dash Colour
        SetVehicleDashboardColour(plyVeh, paintID)
    elseif paintType == 5 then --Interior Colour
        SetVehicleInteriorColour(plyVeh, paintID)
    end
end

function PreviewWheel(categoryID, wheelID, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    if originalWheelCategory == nil and originalWheel == nil and originalWheelType == nil and originalCustomWheels == nil then
        originalWheelCategory = categoryID
        originalWheelType = GetVehicleWheelType(plyVeh)
        originalWheel = GetVehicleMod(plyVeh, 23)
        originalCustomWheels = GetVehicleModVariation(plyVeh, 23)
    end

    SetVehicleWheelType(plyVeh, wheelType)
    SetVehicleMod(plyVeh, categoryID, wheelID, doesHaveCustomWheels)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, wheelID, doesHaveCustomWheels)
    end
end

function PreviewNeon(side, enabled)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalNeonLightState == nil and originalNeonLightSide == nil then
        if IsVehicleNeonLightEnabled(plyVeh, side) then
            originalNeonLightState = 1
        else
            originalNeonLightState = 0
        end

        originalNeonLightSide = side
    end

    SetVehicleNeonLightEnabled(plyVeh, side, enabled)
end

function PreviewNeonColour(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalNeonColourR == nil and originalNeonColourG == nil and originalNeonColourB == nil then
        originalNeonColourR, originalNeonColourG, originalNeonColourB = GetVehicleNeonLightsColour(plyVeh)
    end

    SetVehicleNeonLightsColour(plyVeh, r, g, b)
end

function PreviewXenonColour(colour)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalXenonColour == nil then
        originalXenonColour = GetVehicleHeadlightsColour(plyVeh)
    end

    SetVehicleLights(plyVeh, 2)
    SetVehicleHeadlightsColour(plyVeh, colour)
end

function PreviewOldLivery(liv)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalOldLivery == nil then
        originalOldLivery = GetVehicleLivery(plyVeh)
    end

    SetVehicleLivery(plyVeh, tonumber(liv))
end

function PreviewPlateIndex(index)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalPlateIndex == nil then
        originalPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    end

    SetVehicleNumberPlateTextIndex(plyVeh, tonumber(index))
end

function ApplyMod(categoryID, modID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if categoryID == 18 then
        ToggleVehicleMod(plyVeh, categoryID, modID)
    elseif categoryID == 11 or categoryID == 12 or categoryID== 13 or categoryID == 15 or categoryID == 16 then --Performance Upgrades
        ToggleVehicleMod(plyVeh, categoryID, modID)
        originalCategory = categoryID
        originalMod = modID

        SetVehicleMod(plyVeh, categoryID, modID)
    else
        originalCategory = categoryID
        originalMod = modID

        SetVehicleMod(plyVeh, categoryID, modID)
    end
end


local function playSoundEffect(soundEffect, volume)
    SendNUIMessage({
        playSoundEffect = true,
        soundEffect = soundEffect,
        volume = volume
    })
end

RegisterNetEvent("plutorp:bennys:checkupgrades")
AddEventHandler("plutorp:bennys:checkupgrades", function()
    GetCurrentMod(id)
    TriggerEvent('DoLongHudText','Performance =', 1)
    Wait(1000)
    TriggerEvent('DoLongHudText', modID, 1)
    Wait(1500)
    TriggerEvent('DoLongHudText','Performance Name =', 1)
    Wait(1000)
    TriggerEvent('DoLongHudText', modAmount, 1)
    Wait(1000)
end)


function ApplyExtra(extraID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsVehicleExtraTurnedOn(plyVeh, extraID)
    if isEnabled == 1 then
        SetVehicleExtra(plyVeh, tonumber(extraID), 1)
        SetVehiclePetrolTankHealth(plyVeh,4000.0)
    else
        SetVehicleExtra(plyVeh, tonumber(extraID), 0)
        SetVehiclePetrolTankHealth(plyVeh,4000.0)
    end
end

function ApplyWindowTint(windowTintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalWindowTint = windowTintID

    SetVehicleWindowTint(plyVeh, windowTintID)
end

function ApplyColour(paintType, paintCategory, paintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(plyVeh)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(plyVeh)

    if paintType == 0 then --Primary Colour
        if paintCategory == 1 then --Metallic Paint
            SetVehicleColours(plyVeh, paintID, vehSecondaryColour)
            -- SetVehicleExtraColours(plyVeh, paintID, vehWheelColour)
            SetVehicleExtraColours(plyVeh, originalPearlescentColour, vehWheelColour)
            originalPrimaryColour = paintID
            -- originalPearlescentColour = paintID
        else
            SetVehicleColours(plyVeh, paintID, vehSecondaryColour)
            originalPrimaryColour = paintID
        end
    elseif paintType == 1 then --Secondary Colour
        SetVehicleColours(plyVeh, vehPrimaryColour, paintID)
        originalSecondaryColour = paintID
    elseif paintType == 2 then --Pearlescent Colour
        SetVehicleExtraColours(plyVeh, paintID, vehWheelColour)
        originalPearlescentColour = paintID
    elseif paintType == 3 then --Wheel Colour
        SetVehicleExtraColours(plyVeh, vehPearlescentColour, paintID)
        originalWheelColour = paintID
    elseif paintType == 4 then --Dash Colour
        SetVehicleDashboardColour(plyVeh, paintID)
        originalDashColour = paintID
    elseif paintType == 5 then --Interior Colour
        SetVehicleInteriorColour(plyVeh, paintID)
        originalInterColour = paintID
    end
end

function ApplyWheel(categoryID, wheelID, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    originalWheelCategory = categoryID
    originalWheel = wheelID
    originalWheelType = wheelType

    SetVehicleWheelType(plyVeh, wheelType)
    SetVehicleMod(plyVeh, categoryID, wheelID, doesHaveCustomWheels)
    
    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, wheelID, doesHaveCustomWheels)
    end
end

function ApplyCustomWheel(state)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleMod(plyVeh, 23, GetVehicleMod(plyVeh, 23), state)
    
    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, GetVehicleMod(plyVeh, 24), state)
    end
end

function ApplyNeon(side, enabled)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalNeonLightState = enabled
    originalNeonLightSide = side

    SetVehicleNeonLightEnabled(plyVeh, side, enabled)
end

function ApplyNeonColour(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalNeonColourR = r
    originalNeonColourG = g
    originalNeonColourB = b

    SetVehicleNeonLightsColour(plyVeh, r, g, b)
end

function ApplyXenonLights(category, state)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    ToggleVehicleMod(plyVeh, category, state)
end

function ApplyXenonColour(colour)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalXenonColour = colour

    SetVehicleHeadlightsColour(plyVeh, colour)
end

function ApplyOldLivery(liv)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalOldLivery = liv

    SetVehicleLivery(plyVeh, liv)
end

function ApplyPlateIndex(index)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    originalPlateIndex = index
    SetVehicleNumberPlateTextIndex(plyVeh, index)
end

function ApplyTyreSmoke(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    ToggleVehicleMod(plyVeh, 20, true)
    SetVehicleTyreSmokeColor(plyVeh, r, g, b)
end

function ExitBennys()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    saveVehicle()

    DisplayMenuContainer(false)

    FreezeEntityPosition(plyVeh, false)
    SetEntityCollision(plyVeh, true, true)

    SetTimeout(100, function()
        DestroyMenus()
    end)
    disabled = false

    isPlyInBennys = false
    TriggerEvent('plutorp-textui:HideUI')
end





RegisterNetEvent('event:control:bennys')
AddEventHandler('event:control:bennys', function(useID)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        bennyHeading = 87.4
        if useID == 1 and not isPlyInBennys then -- Bennys
            enterLocation(bennyLocation)
        elseif useID == 4 and not isPlyInBennys then -- Bennys
            bennyHeading = 269.73135375977
            enterLocation(bennyLocationBridge)
        elseif useID == 5 and not isPlyInBennys then -- Bennys
            bennyHeading = 44.22135375977
            enterLocation(billyLocationPaleto)
        elseif useID == 6 and not isPlyInBennys then -- Bennys
            bennyHeading = 90.5
            enterLocation(bennyLocationMRPD)
        elseif useID == 7 and not isPlyInBennys then -- Tunershop
            bennyHeading = 95.978652954102
            enterLocation(bennyLocationTunershop)
        elseif useID == 8 and not isPlyInBennys then -- Bennys2
            bennyHeading = 160.64
            enterLocation(bennyLocation2)
        elseif useID == 10 and not isPlyInBennys then -- Tuners Performance
            bennyHeading = 273.99
            enterLocation(bennyLocationTunershop2)
        elseif useID == 11 and not isPlyInBennys then -- Hayes 
            bennyHeading = 30.19
            enterLocation(bennyLocationHayes)
        elseif useID == 12 and not isPlyInBennys then -- Hayes
            bennyHeading = 30.19
            enterLocation(bennyLocationHayes2)
        elseif useID == 13 and not isPlyInBennys then -- Auto Exotics
            bennyHeading = 86.091331481934
            enterLocation(bennyLocationAutoExotic)
        end
    end
end)


RegisterNetEvent('enter:benny:bridge')
AddEventHandler('enter:benny:bridge', function()
    TriggerEvent('event:control:bennys', 4)
    disabled = true
    disableControls()
end)

RegisterNetEvent('enter:benny')
AddEventHandler('enter:benny', function()
    TriggerEvent('event:control:bennys', 1)
    disabled = true
    disableControls()
end)

RegisterNetEvent('enter:benny:paleto')
AddEventHandler('enter:benny:paleto', function()
    TriggerEvent('event:control:bennys', 5)
    disabled = true
    disableControls()
end)

RegisterNetEvent('enter:benny:mrpd')
AddEventHandler('enter:benny:mrpd', function()
    local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "police") then
    TriggerEvent('event:control:bennys', 6)
    disabled = true
      disableControls()
    end 
end)

RegisterNetEvent('enter:benny:tunershop')
AddEventHandler('enter:benny:tunershop', function()
    local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "tuner_shop") then
    TriggerEvent('event:control:bennys', 7)
    disabled = true
      disableControls()
    else
        TriggerEvent('DoLongHudText','You Need A TunerShop Worker To Help You', 2)
    end
end)


RegisterNetEvent('enter:benny:autoexotic')
AddEventHandler('enter:benny:autoexotic', function()
    local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "auto_exotics") then
    TriggerEvent('event:control:bennys', 13)
    disabled = true
      disableControls()
    else
        TriggerEvent('DoLongHudText','You Need An Auto Exotic Worker To Help You', 2)
    end
end)

RegisterNetEvent('enter:benny:bennys2')
AddEventHandler('enter:benny:bennys2', function()
    local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "car_shop") then
        TriggerEvent('event:control:bennys', 8)
        TriggerEvent('DoLongHudText','Soon', 2)
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("[BackSpace] To Exit"))

        isPlyInBennys = true

        disabled = true
            disableControls()
        else
            TriggerEvent('DoLongHudText','Only Bennys Workers Can Access This', 2)
        end
end)

RegisterNetEvent('enter:benny:tuners2')
AddEventHandler('enter:benny:tuners2', function()
    local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "tuner_shop") then
        TriggerEvent('event:control:bennys', 10)
        TriggerEvent('DoLongHudText','Soon', 2)
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("[BackSpace] To Exit"))

        isPlyInBennys = true

        disabled = true
            disableControls()
        else
            TriggerEvent('DoLongHudText','Only Tuner Workers Can Access This', 2)
        end
end)

RegisterNetEvent('enter:benny:hayes2')
AddEventHandler('enter:benny:hayes2', function()
    local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "hayes_autos") then
        TriggerEvent('event:control:bennys', 12)
        isPlyInBennys = true
        disabled = true
        disableControls()
        else
            TriggerEvent('DoLongHudText','Only Hayes Workers Can Use This', 2)
        end
end)


-- RegisterNetEvent('enter:benny')
-- AddEventHandler('enter:benny', function()
--     TriggerEvent('event:control:bennys', 1)
--     disabled = true
--     disableControls()
-- end)

RegisterNetEvent('enter:benny:hayes')
AddEventHandler('enter:benny:hayes', function()
    local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "harmony_autos") then
    TriggerEvent('event:control:bennys', 11)
    TriggerEvent('DoLongHudText','Soon', 2)
    disabled = true
      disableControls()
    else
        TriggerEvent('DoLongHudText','You Need A Hayes Worker To Help You', 2)
    end
end)

function enterLocation2(locationsPos)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isMotorcycle = false

    SetVehicleModKit(plyVeh, 0)
    Wait(1)
    SetEntityCoords(plyVeh, locationsPos)
    Wait(1)
    SetEntityHeading(plyVeh, bennyHeading)
    FreezeEntityPosition(plyVeh, true)
    SetEntityCollision(plyVeh, false, true)

end

function enterLocation(locationsPos)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isMotorcycle = false

    SetVehicleModKit(plyVeh, 0)
    SetEntityCoords(plyVeh, locationsPos)
    SetEntityHeading(plyVeh, bennyHeading)
    FreezeEntityPosition(plyVeh, true)
    SetEntityCollision(plyVeh, false, true)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        isMotorcycle = true
    else
        isMotorcycle = false
    end

    InitiateMenus(isMotorcycle, GetVehicleBodyHealth(plyVeh))

    SetTimeout(100, function()
        if GetVehicleBodyHealth(plyVeh) < 1000.0 then
            DisplayMenu(true, "repairMenu")
        else
            DisplayMenu(true, "mainMenu")
        end
        
        DisplayMenuContainer(true)
        PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end)
    TriggerEvent('plutorp-textui:HideUI')
    isPlyInBennys = true
end


function disableControls()
    while disabled do
        Citizen.Wait(1)
        DisableControlAction(1, 38, true) --Key: E
        DisableControlAction(1, 172, true) --Key: Up Arrow
        DisableControlAction(1, 173, true) --Key: Down Arrow
        DisableControlAction(1, 177, true) --Key: Backspace
        DisableControlAction(1, 176, true) --Key: Enter
        DisableControlAction(1, 71, true) --Key: W (veh_accelerate)
        DisableControlAction(1, 72, true) --Key: S (veh_brake)
        DisableControlAction(1, 34, true) --Key: A
        DisableControlAction(1, 35, true) --Key: D
        DisableControlAction(1, 75, true) --Key: F (veh_exit)

        if IsDisabledControlJustReleased(1, 172) then --Key: Arrow Up
            MenuScrollFunctionality("up")
            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        end

        if IsDisabledControlJustReleased(1, 173) then --Key: Arrow Down
            MenuScrollFunctionality("down")
            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        end

        if IsDisabledControlJustReleased(1, 176) then --Key: Enter
            MenuManager(true)
            PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        end

        if IsDisabledControlJustReleased(1, 177) then --Key: Backspace
            MenuManager(false)
            PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        end
    end
end

-- #MarkedForMarker
--#[Citizen Threads]#--
-- Citizen.CreateThread(function()
--     while true do 
--         local plyPed = PlayerPedId()
--         local showing = false

--         if IsPedInAnyVehicle(plyPed, false) then
--             local plyPos = GetEntityCoords(plyPed)


--             nearDefault = isNear(plyPos, bennyLocation, 10) 
--             local nearDefaultDist = #(plyPos - bennyLocation)
-- --            nearImport = isNear(plyPos, bennyLocationImport, 10) 
--             nearBridge = isNear(plyPos, bennyLocationBridge, 10)
--             local nearBridgeDist = #(plyPos - bennyLocationBridge)
--             nearPaleto = isNear(plyPos, billyLocationPaleto, 10)
--             local nearPaletoDist = #(plyPos - billyLocationPaleto)

--             if nearDefault or nearImport or nearBridge or nearPaleto then

--                 local rankCar = exports["plutorp_manager"]:GroupRank("repairs_harmony")

--                 -- if not isPlyInBennys and nearDefault then
--                 --     exports["plutorp-textui"]:showInteraction("Benny's")
--                 --     -- DrawMarker(21, bennyLocation.x, bennyLocation.y, bennyLocation.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
--                 -- end

--                 -- if not isPlyInBennys and nearBridge then
--                 --     exports["plutorp-textui"]:showInteraction("Benny's")
--                 --     -- DrawMarker(21, bennyLocationBridge.x, bennyLocationBridge.y, bennyLocationBridge.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
--                 -- end

--                 -- if not isPlyInBennys and nearPaleto then
--                 --     exports["plutorp-textui"]:showInteraction("Benny's")
--                 --     -- DrawMarker(21, billyLocationPaleto.x, billyLocationPaleto.y, billyLocationPaleto.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
--                 -- end



--                 if nearDefault then
--                     if not isPlyInBennys then
--                         showing = true
--                         exports["plutorp-textui"]:showInteraction("Benny's")
--                         -- Draw3DText(bennyLocation.x, bennyLocation.y, bennyLocation.z + 0.5, "[Press ~p~E~w~ - Enter Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
--                     else
--                         disableControls()
--                     end
--                 end

--                 if nearBridge then
--                     if not isPlyInBennys then
--                         showing = true 
--                         exports["plutorp-textui"]:showInteraction("Benny's")
--                         -- Draw3DText(bennyLocationBridge.x, bennyLocationBridge.y, bennyLocationBridge.z + 0.5, "[Press ~p~E~w~ - Enter Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
--                     else
--                         disableControls()
--                     end
--                 end

--                 if nearPaleto then
--                     if not isPlyInBennys then
--                         showing = true
--                         exports["plutorp-textui"]:showInteraction("Benny's")
--                         -- Draw3DText(billyLocationPaleto.x, billyLocationPaleto.y, billyLocationPaleto.z + 0.5, "[Press ~p~E~w~ - Enter Billy's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
--                     else
--                         disableControls()
--                     end
--                 end

--                 if nearDefaultDist > 7 and nearDefaultDist < 10 or nearBridgeDist > 7 and nearBridgeDist < 10 or nearPaletoDist > 7 and nearPaletoDist < 10 or isPlyInBennys then
--                     showing = false
--                     exports["plutorp-textui"]:hideInteraction()
--                 end

--             else
--                 Wait(1000)
--             end
--         else
--             Wait(2000)
--         end

--         Citizen.Wait(1)
--     end
-- end)

Citizen.CreateThread(function()
    --FISHING
    exports["plutorp-polyzone"]:AddBoxZone("bennyslocation", vector3(-39.5, -1054.39, 28.4), 6, 4, {
        name="bennyslocation",
        heading=340,
        -- debugPoly=true,
        minZ=27.0,
        maxZ=31.0
    }) 
    exports["plutorp-polyzone"]:AddBoxZone("benny2", vector3(731.46, -1088.81, 22.17), 5.2, 11.2, {
        name="benny2",
        heading=359,
        --debugPoly=true,
        minZ=21.17,
        maxZ=25.17
    }) 
    -- Chicken
    exports["plutorp-polyzone"]:AddBoxZone("benny3", vector3(110.11, 6626.67, 31.84), 7.0, 7.4, {
        name="benny3",
        heading=315,
        --debugPoly=true,
        minZ=30.04,
        maxZ=33.84
    })
    
    exports["plutorp-polyzone"]:AddBoxZone("benny5", vector3(938.37, -970.82, 39.76), 10, 5, { --Tunershop 
        name="benny5",
        heading=39.51,
        --debugPoly=true,
        minZ=38.70,
        maxZ=41.23
    })
      
    exports["plutorp-polyzone"]:AddBoxZone("benny4", vector3(450.16, -975.93, 25.7), 10, 5, {
        name="benny4",
        heading=270,
        --debugPoly=true,
        minZ=24.7,
        maxZ=28.7
      })
      
    exports["plutorp-polyzone"]:AddBoxZone("benny6", vector3(-32.74, -1068.19, 27.79), 10, 5, {
        name="benny6",
        heading=270,
        --debugPoly=true,
        minZ=24.7,
        maxZ=28.7
      })

    exports["plutorp-polyzone"]:AddBoxZone("benny7", vector3(921.81, -984.47, 38.89), 10, 5, {
        name="benny7",
        heading=270,
        --debugPoly=true,
        minZ=38.70,
        maxZ=41.23
      })

    exports["plutorp-polyzone"]:AddBoxZone("benny8", vector3(-1424.19, -449.48, 35.30), 10, 5, {
        name="benny8",
        heading=270,
        --debugPoly=true,
        minZ=38.70,
        maxZ=41.23
      })

    exports["plutorp-polyzone"]:AddBoxZone("benny9", vector3(-1417.38, -445.79, 35.30), 10, 5, {
        name="benny9",
        heading=270,
        --debugPoly=true,
        minZ=34.70,
        maxZ=37.23
      })

    exports["plutorp-polyzone"]:AddBoxZone("benny10", vector3(547.25, -189.457, 53.88), 10, 5, {
        name="benny10",
        heading=270,
        --debugPoly=true,
        minZ=51.24,
        maxZ=55.78
      })
      
end)



AddEventHandler('plutorp-polyzone:enter', function(name)
    if name == "bennyslocation" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Benny's")) 
    elseif name == "benny2" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Benny's")) 
    elseif name == "benny3" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Benny's")) 
    elseif name == "benny4" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Benny's"))
    elseif name == "benny5" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("TunerShop")) 
    elseif name == "benny6" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Benny's (Workers Only)")) 
    elseif name == "benny7" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("TunerShop (Workers Only)")) 
    elseif name == "benny8" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Harmony (Workers Only)")) 
    elseif name == "benny9" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Hayes Autos")) 
    elseif name == "benny10" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("Auto Exotic")) 
    end
end)


--#[Event Handlers]#--
RegisterNetEvent("plutorp-bennys:purchaseSuccessful")
AddEventHandler("plutorp-bennys:purchaseSuccessful", function()
    isPurchaseSuccessful = true
    attemptingPurchase = false
end)

RegisterNetEvent("plutorp-bennys:purchaseFailed")
AddEventHandler("plutorp-bennys:purchaseFailed", function()
    isPurchaseSuccessful = false
    attemptingPurchase = false
end)

RegisterNetEvent("bennys:civ:repair:cl", function()
    local car = GetVehiclePedIsIn(PlayerPedId(), false)
    if car ~= 0 then
        FreezeEntityPosition(car, true)
        local finished = exports["plutorp-taskbar"]:taskBar(2000,"Repairing Engine",false,false,playerVeh)
        Citizen.Wait(1000)
        local finished = exports["plutorp-taskbar"]:taskBar(2000,"Repairing Body",false,false,playerVeh)
        if (finished == 100) then
            TriggerServerEvent("pay4bennys")
            SetVehicleFixed(car)
            SetVehicleDirtLevel(car, 0)
            SetVehicleDeformationFixed(car)
            SetVehicleUndriveable(car, false)
            FreezeEntityPosition(car, false)
        else
            FreezeEntityPosition(car, false)
        end
    end
end)