
--666561306, -58485588, -206690185, 1511880420, 682791951
local searched = {3423423424}
local canSearch = true
local dumpsters = {218085040}
local dumpsters2 = {-58485588}
local dumpsters3 = {666561306}

local searchTime = 14000

function checkforGarbage()
    for i = 1, #dumpsters do
      local objFound = GetClosestObjectOfType( GetEntityCoords(PlayerPedId()), 5.0, dumpsters[i], 0, 0, 0)
      if DoesEntityExist(objFound) then
        return true
      end
    end
    return false
end
  
RegisterNetEvent('plutorp-dumpster')
AddEventHandler('plutorp-dumpster', function() 
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local dumpsterFound = false
    for i = 1, #dumpsters do
        local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters[i], false, false, false)
        local dumpPos = GetEntityCoords(dumpster)
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true) then

  
            for i = 1, #searched do
                if searched[i] == dumpster then
                    dumpsterFound = true
                end
                if i == #searched and dumpsterFound then
                    TriggerEvent('DoLongHudText', 'You have already searched this dumpster!', 2)
                elseif i == #searched and not dumpsterFound then
                    TriggerEvent('DoLongHudText', 'You begin searching the dumpster')
                    local dict = 'amb@prop_human_bum_bin@base'
                    LoadDict(dict)
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    TaskPlayAnim(GetPlayerPed(-1), dict, 'base', 3.0, -8, -1, 63, 0, 0, 0, 0 )
                    local finished = exports ['plutorp-taskbar']:taskBar(10000, 'searching dumpster')
                    if (finished ==100) then
                        TriggerServerEvent('prp:giveDumpsterReward')
                        TriggerServerEvent('prp:startDumpsterTimer', dumpster)
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                    end
                    table.insert(searched, dumpster)
                end
            end
        end

    end
end)

RegisterNetEvent('plutorp-dumpster2')
AddEventHandler('plutorp-dumpster2', function() 
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local dumpsterFound = false
    for i = 1, #dumpsters2 do
        local dumpster2 = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters2[i], false, false, false)
        local dumpPos = GetEntityCoords(dumpster2)
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true) then

  
            for i = 1, #searched do
                if searched[i] == dumpster2 then
                    dumpsterFound = true
                end
                if i == #searched and dumpsterFound then
                    TriggerEvent('DoLongHudText', 'You have already searched this dumpster!', 2)
                elseif i == #searched and not dumpsterFound then
                    TriggerEvent('DoLongHudText', 'You begin to search the dumpster')
                    local dict = 'amb@prop_human_bum_bin@base'
                    LoadDict(dict)
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    TaskPlayAnim(GetPlayerPed(-1), dict, 'base', 3.0, -8, -1, 63, 0, 0, 0, 0 )
                    local finished = exports ['plutorp-taskbar']:taskBar(10000, 'searching dumpster')
                    if (finished ==100) then
                        TriggerServerEvent('prp:giveDumpsterReward')
                        TriggerServerEvent('prp:startDumpsterTimer', dumpster2)
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                    table.insert(searched, dumpster2)
                    FreezeEntityPosition(GetPlayerPed(-1),false)
                    end
                end
            end
        end

    end
end)

RegisterNetEvent('plutorp-dumpster3')
AddEventHandler('plutorp-dumpster3', function() 
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local dumpsterFound = false
    for i = 1, #dumpsters3 do
        local dumpster3 = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters3[i], false, false, false)
        local dumpPos = GetEntityCoords(dumpster3)
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true) then

  
            for i = 1, #searched do
                if searched[i] == dumpster3 then
                    dumpsterFound = true
                end
                if i == #searched and dumpsterFound then
                    TriggerEvent('DoLongHudText', 'You have already searched this dumpster!', 2)
                elseif i == #searched and not dumpsterFound then
                    TriggerEvent('DoLongHudText', 'You begin to search the dumpster')
                    local dict = 'amb@prop_human_bum_bin@base'
                    LoadDict(dict)
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    TaskPlayAnim(GetPlayerPed(-1), dict, 'base', 3.0, -8, -1, 63, 0, 0, 0, 0 )
                    local finished = exports ['plutorp-taskbar']:taskBar(10000, 'searching dumpster')
                    if (finished ==100) then
                        TriggerServerEvent('prp:giveDumpsterReward')
                        TriggerServerEvent('prp:startDumpsterTimer', dumpster3)
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                    table.insert(searched, dumpster3)
                    end

                end
            end
        end

    end
end)

RegisterNetEvent('prp:removeDumpster')
AddEventHandler('prp:removeDumpster', function(object)
    for i = 1, #searched do
        if searched[i] == object then
            table.remove(searched, i)
        end
    end
end)

-- Functions

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end



