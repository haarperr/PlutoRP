local _wheel = nil
local _lambo = nil
local _isShowCar = false
local _wheelPos = vector3(1109.5465087891, 228.99925231934, -49.635803222656)


local _baseWheelPos = vector3(1111.0855712891, 229.8528137207, -49.737197875977)

        local _isRolling = false
        local model = GetHashKey('vw_prop_vw_luckywheel_02a')
        local baseWheelModel = GetHashKey('vw_prop_vw_luckywheel_01a')
        --local carmodel = GetHashKey('XA21')
        --print("I AM LOADING NOW!")

        Citizen.CreateThread(function()
            -- Base wheel
            --RequestModel(baseWheelModel)
            --while not HasModelLoaded(baseWheelModel) do
            --    Citizen.Wait(0)
            --end

            --_basewheel = CreateObject(baseWheelModel, _baseWheelPos.x, _baseWheelPos.y, _baseWheelPos.z, false, false, true)
            --SetEntityHeading(_basewheel, 0.0)
            --SetModelAsNoLongerNeeded(baseWheelModel)

            -- Wheel
            RequestModel(model)

            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end
            _wheel = CreateObject(model, 1111.052, 229.851, -50.35, false, false, true)
            SetEntityHeading(_wheel,358.35986328125)
            SetModelAsNoLongerNeeded(model)
            
            -- Car
            --RequestModel(carmodel)
            --while not HasModelLoaded(carmodel) do
            --    Citizen.Wait(0)
            --end

            --local vehicle = CreateVehicle(carmodel, 963.42102050781,47.945358276367,75.568389892578, 0.0, false, false)
            
            --SetModelAsNoLongerNeeded(carmodel)
            

            -- RequestCollisionAtCoord(1100.39, 220.09, -48.75)

            -- while not HasCollisionLoadedAroundEntity(vehicle) do
            --     RequestCollisionAtCoord(1100.39, 220.09, -48.75)
            --     Citizen.Wait(0)
            -- end

            -- SetVehRadioStation(vehicle, 'OFF')
           -- FreezeEntityPosition(vehicle, true)
            --local _curPos = GetEntityCoords(vehicle)
            --SetEntityCoords(vehicle, _curPos.x, _curPos.y, _curPos.z + 1, false, false, true, true)
            --_lambo = vehicle
            
        end)

Citizen.CreateThread(function() 
    while true do
        if _lambo ~= nil then
            local _heading = GetEntityHeading(_lambo)
            local _z = _heading - 0.3
            SetEntityHeading(_lambo, _z)
        end
        Citizen.Wait(5)
    end
end)


RegisterNetEvent("plutorp_luckywheel:doRoll")
AddEventHandler("plutorp_luckywheel:doRoll", function(_priceIndex) 
    _isRolling = true
	SetEntityHeading(_wheel, 358.35986328125)
    Citizen.CreateThread(function()
        local speedIntCnt = 0.2
        local rollspeed = 0.2
        local _winAngle = (_priceIndex - 1 * 18)
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                    
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 30
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
			SetEntityHeading(_wheel, 358.35986328125)
            SetEntityRotation(_wheel, 0.0, _y, 358.35986328125, 2, true)
            Citizen.Wait(5)
        end
    end)
end)

RegisterNetEvent("plutorp_luckywheel:rollFinished")
AddEventHandler("plutorp_luckywheel:rollFinished", function() 
    _isRolling = false
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function doRoll()
    if not _isRolling then
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
        if IsPedMale(playerPed) then
            _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        end
        local lib, anim = _lib, 'enter_right_to_baseidle'
            loadAnimDict(lib)
            local _movePos = vector3(1110.2459716797, 228.84452819824, -49.635841369629)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  312.2,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
                    Citizen.Wait(0)
                    DisableAllControlActions(0)
            end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                DisableAllControlActions(0)
            end
            TriggerServerEvent("plutorp_luckywheel:getLucky")
            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
        
    end
end

-- Menu Controls
-- Citizen.CreateThread(function()
-- 	while true do
--         Citizen.Wait(1)
--         local coords = GetEntityCoords(PlayerPedId())
--         if(GetDistanceBetweenCoords(coords, _wheelPos.x, _wheelPos.y, _wheelPos.z, true) < 1.5) and not _isRolling then
--             if IsControlJustReleased(0, 38) then
--                 doRoll()
--             end
--         end		
-- 	end
-- end)
-- local enabled = true
RegisterNetEvent("plutorp_luckywheel:spinit")
AddEventHandler("plutorp_luckywheel:spinit", function() 
    if not _isRolling  then
        doRoll()

    end		
end)


-- RegisterCommand("spin_toggle", function(source, args)
--     local myJob = exports["plutorp_manager"]:isPed("myJob")
--     if myJob == "casino_dealer" then
--         enabled = not enabled
--         TriggerEvent("DoLongHudText", ('Luckywheel has been %s!'):format(enabled and 'Enabled' or 'Disabled')) 
--     end
-- end)
RegisterNetEvent('attempt:spin-in', function()
    TriggerServerEvent("attempt:spin")
end)



RegisterNetEvent("attempt:change:spin", function()
	if exports['plutorp_manager']:isPed("myjob") == "casino_dealer" then
		TriggerServerEvent("spin:toggle")
	else
		TriggerEvent("DoLongHudText", "This is only for Casino Dealer to use.", 2)
	end
end)
