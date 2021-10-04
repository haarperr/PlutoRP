RegisterNetEvent('veh.examine')
AddEventHandler('veh.examine', function(plate)
    local src = source
    if plate ~= nil then
        exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE license_plate = ?', {plate}, function(result) 
            if result[1] ~= nil then
                TriggerClientEvent('towgarage:triggermenu', src, result[1].degredation, result[1].engine_damage, result[1].body_damage)
            end
        end)
    end
end)

RegisterNetEvent('veh.callDegredation')
AddEventHandler('veh.callDegredation', function(plate)
    local _src = source
    exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE license_plate = @plate', {['@plate'] = plate}, function(data) 
        if data[1] then
            TriggerClientEvent('veh.getSQL', _src, data[1].degredation)
        end   
    end)
    
end)

RegisterNetEvent('veh.updateVehicleHealth')
AddEventHandler('veh.updateVehicleHealth', function(tempReturn)
    local src = source
    local plate = ""
    local engine_damage = 0
    local body_damage = 0
    local fuel = 0

    for k,v in pairs(tempReturn[1]) do
        if k == 1 then       
            plate = v
        elseif k == 2 then
            engine_damage = v
        elseif k == 3 then
            body_damage = v
        elseif k == 4 then
            fuel = v
        end
    end
    exports.ghmattimysql:execute("UPDATE characters_cars SET engine_damage = @engine_damage, body_damage = @body_damage, fuel = @fuel WHERE license_plate = @plate", {
        ['@engine_damage'] = engine_damage,
        ['@body_damage'] = body_damage,
        ['@fuel'] = fuel,
        ['plate'] = plate
    })

end)


RegisterNetEvent('veh.updateVehicleDegredationServer')
AddEventHandler('veh.updateVehicleDegredationServer', function(plate,br,ax,rad,cl,tra,elec,fi,ft)
    exports.ghmattimysql:execute('SELECT license_plate FROM characters_cars WHERE license_plate = @plate', {['@plate'] = plate}, function (result)
        if result[1] ~= nil then
            local degri = ""..br..","..ax..","..rad..","..cl..","..tra..","..elec..","..fi..","..ft..""  
            exports.ghmattimysql:execute("UPDATE characters_cars SET degredation = @degredation WHERE license_plate = @plate", {
                ['@degredation'] = tostring(degri),
                ['plate'] = plate
            })
        else
            local degri = ""..br..","..ax..","..rad..","..cl..","..tra..","..elec..","..fi..","..ft..""  
        end
    end)
end)
