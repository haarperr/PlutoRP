
RegisterNetEvent("plutorp-jobmanager:playerBecameJob")
AddEventHandler("plutorp-jobmanager:playerBecameJob", function(job, name, notify)
    local LocalPlayer = exports["plutorp-core"]:getModule("LocalPlayer")
    LocalPlayer:setVar("job", job)
    if notify ~= false then 
        TriggerEvent("DoLongHudText", job ~= "unemployed" and "New Job: " .. tostring(name) or "You're now unemployed", 1) 
    end
    if name == "Entertainer" then
	    TriggerEvent('DoLongHudText',"College DJ and Comedy Club pay per person around you",1)
	end
    if name == "Broadcaster" then
        TriggerEvent('DoLongHudText',"(RadioButton + LeftCtrl for radio toggle)",3)
        TriggerEvent('DoLongHudText',"Broadcast from this room and give out the vibes to los santos on 1982.9",1)
    end  
	if job == "unemployed"  then
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
        SetPoliceIgnorePlayer(PlayerPedId(),false)
        TriggerEvent("ResetRadioChannel");
	end
    
    if job == "trucker" then

    end

    if job == "towtruck" then
        TriggerEvent("DoLongHudText","Use /tow to tow cars to your truck.",1)

    end

    if job == "news"  then
        TriggerEvent('DoLongHudText',"'H' to use item, F1 change item. (/light r g b)",1)
    end

    if job == "driving instructor"  then
        TriggerEvent('DoLongHudText',"'/driving' to use access driving instructor systems",1)
    end
    
    if job == "pdm"  then
        TriggerEvent('DoLongHudText',"Go Sell Some Cars",1)
    end

    if job == "tuner_shop"  then
        TriggerEvent('DoLongHudText',"Go fix some cars",1)
    end

    if job == "sunrise_shop"  then
        TriggerEvent('DoLongHudText',"Go sell some cars",1)
    end

    if job == "digital_den"  then
        TriggerEvent('DoLongHudText',"Weird Nerd",1)
    end
   -- TriggerServerEvent("plutorp-items:updateID",job,exports["plutorp_manager"]:retreiveBusinesses())
end)

RegisterNetEvent("plutorp-core:characterLoaded")
AddEventHandler("plutorp-core:characterLoaded", function(character)
    local LocalPlayer = exports["plutorp-core"]:getModule("LocalPlayer")
    LocalPlayer:setVar("job", "unemployed")

end)

RegisterNetEvent("plutorp-core:exportsReady")
AddEventHandler("plutorp-core:exportsReady", function()
    exports["plutorp-core"]:addModule("JobManager", PRP.Jobs)
end)