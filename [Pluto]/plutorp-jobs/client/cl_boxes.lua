local searched = {12345}
local canSearch = true
local boxes = {218085040}
local boxes2 = {-191836989}
local boxes3 = {-188983024}

local searchTime = 14000

function checkforBoxes()
    for i = 1, #boxes do
      local objFound = GetClosestObjectOfType( GetEntityCoords(PlayerPedId()), 5.0, boxes[i], 0, 0, 0)
      if DoesEntityExist(objFound) then
        return true
      end
    end
    return false
end
  
RegisterNetEvent('plutorp-boxes')
AddEventHandler('plutorp-boxes', function() 
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local boxFound = false
    for i = 1, #boxes do
        local box = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, boxes[i], false, false, false)
        local boxPos = GetEntityCoords(box)
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, boxPos.x, boxPos.y, boxPos.z, true) then

  
            for i = 1, #searched do
                if searched[i] == box then
                    boxFound = true
                end
                if i == #searched and boxFound then
                    TriggerEvent('DoLongHudText', 'You have just searched this box!', 2)
                elseif i == #searched and not boxFound then
                    local dict = 'amb@prop_human_bum_bin@base'
                    LoadDict(dict)
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    TaskPlayAnim(GetPlayerPed(-1), dict, 'base', 3.0, -8, -1, 63, 0, 0, 0, 0 )
                    local finished = exports ['plutorp-taskbar']:taskBar(10000, 'searching box')
                    if (finished ==100) then
                        TriggerServerEvent('prp:giveboxReward')
                        TriggerServerEvent('prp:startboxTimer', box)
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                    end
                    table.insert(searched, box)

                end

                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        end

    end
end)

RegisterNetEvent('plutorp-boxes2')
AddEventHandler('plutorp-boxes2', function() 
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local boxFound = false
    for i = 1, #boxes2 do
        local box2 = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, boxes2[i], false, false, false)
        local boxPos = GetEntityCoords(box2)
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, boxPos.x, boxPos.y, boxPos.z, true) then

  
            for i = 1, #searched do
                if searched[i] == box2 then
                    boxFound = true
                end
                if i == #searched and boxFound then
                    TriggerEvent('DoLongHudText', 'You have just searched this box!', 2)
                elseif i == #searched and not boxFound then
                    local dict = 'amb@prop_human_bum_bin@base'
                    LoadDict(dict)
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    TaskPlayAnim(GetPlayerPed(-1), dict, 'base', 3.0, -8, -1, 63, 0, 0, 0, 0 )
                    local finished = exports ['plutorp-taskbar']:taskBar(10000, 'searching box')
                    if (finished ==100) then
                        TriggerServerEvent('prp:giveboxReward')
                        TriggerServerEvent('prp:startboxTimer', box2)
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                        ClearPedTasks(GetPlayerPed(-1))
                    end
                    table.insert(searched, box2)

                end
            end
        end

    end
end)

RegisterNetEvent('plutorp-boxes3')
AddEventHandler('plutorp-boxes3', function() 
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local boxFound = false
    for i = 1, #boxes3 do
        local box3 = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, boxes3[i], false, false, false)
        local boxPos = GetEntityCoords(box3)
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, boxPos.x, boxPos.y, boxPos.z, true) then

  
            for i = 1, #searched do
                if searched[i] == box3 then
                    boxFound = true
                end
                if i == #searched and boxFound then
                    TriggerEvent('DoLongHudText', 'You have just searched this box!', 2)
                elseif i == #searched and not boxFound then
                    local dict = 'amb@prop_human_bum_bin@base'
                    LoadDict(dict)
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    TaskPlayAnim(GetPlayerPed(-1), dict, 'base', 3.0, -8, -1, 63, 0, 0, 0, 0 )
                    local finished = exports ['plutorp-taskbar']:taskBar(10000, 'searching box')
                    if (finished ==100) then
                        TriggerServerEvent('prp:giveboxReward')
                        TriggerServerEvent('prp:startboxTimer', box3)
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                        ClearPedTasks(GetPlayerPed(-1))
                    end
                    table.insert(searched, box3)

                end
            end
        end

    end
end)

RegisterNetEvent('prp:removebox')
AddEventHandler('prp:removebox', function(object)
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



