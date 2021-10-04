Citizen.CreateThread(function()
    while true do
        Wait(1000)
        TriggerClientEvent('plutorp-doors:states',-1, IRP_DOORS)
    end
end)

RegisterNetEvent('plutorp-doors:changeLock-status')
AddEventHandler('plutorp-doors:changeLock-status', function(doorId,state)
    IRP_DOORS[doorId]["lock"] = state
    if doorId == 93 or doorId == 94 then
        IRP_DOORS[doorId]["lock"] = false
        IRP_DOORS[doorId]["forceUnlocked"] = true
    else
        TriggerClientEvent('plutorp-doors:changeLock-status',-1,tonumber(doorId),state,true)
    end
end)


RPC.register("GetEmploymentInformation", function (params, ret, player)
    local cid = params['character'].id
    exports.ghmattimysql:execute('SELECT * FROM character_passes WHERE cid = @cid', {['cid'] = cid}, function(result)
        if result[1] ~= nil then
            pDataPass = {
                code = result[1].pass_type,
                permissions = "property_keys"
            }
        end
    end)

    Citizen.Wait(100)
    return pDataPass
end)

