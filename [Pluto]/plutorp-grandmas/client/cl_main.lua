local NearGrandmas = false

Citizen.CreateThread(function()
  exports["plutorp-polyzone"]:AddBoxZone("grandmas", vector3(2435.32, 4966.31, 42.35), 2.8, 2, {
    name="grandmas",
    heading=315,
    --debugPoly=true,
    minZ=40.55,
    maxZ=43.15
  })  
end)

RegisterNetEvent('plutorp-polyzone:enter')
AddEventHandler('plutorp-polyzone:enter', function(name)
  if name == "grandmas" then
      NearGrandmas = true
      NearGrandmasHoe()
      TriggerEvent('plutorp-textui:ShowUI', 'show', ("%s"):format("[E] - Grandmas ($1000)")) 
    end
end)

RegisterNetEvent('plutorp-polyzone:exit')
AddEventHandler('plutorp-polyzone:exit', function(name)
  if name == "grandmas" then
    NearGrandmas = false
  end
  TriggerEvent('plutorp-textui:HideUI')
end)


function NearGrandmasHoe()
  Citizen.CreateThread(function()
    while NearGrandmas do
      Citizen.Wait(5)
      if IsControlPressed(1,38) then
        TriggerServerEvent("grandmas:attemt:checkin")
      end
    end
  end)
end



RegisterNetEvent("grandmas:success:attemt", function()
  local finished = exports["plutorp-taskbar"]:taskBar(math.random(60000, 120000), "Grandma is helping you up!")
  if finished == 100 then
    TriggerEvent("reviveFunction")
    TriggerServerEvent("grandmas:bill")
    TriggerEvent("DoLongHudText", "Success!")
  end
end)