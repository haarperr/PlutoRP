Citizen.CreateThread(function()
  RequestIpl("gabz_pillbox_milo_")

  local interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)

  if IsValidInterior(interiorID) then
    RemoveIpl("rc12b_fixed")
    RemoveIpl("rc12b_destroyed")
    RemoveIpl("rc12b_default")
    RemoveIpl("rc12b_hospitalinterior_lod")
    RemoveIpl("rc12b_hospitalinterior")
    RefreshInterior(interiorID)
  end
end)

Citizen.CreateThread(function()
  RequestIpl("gabz_import_milo_")
  
    interiorID = GetInteriorAtCoords(941.00840000, -972.66450000, 39.14678000)
    
    
  if IsValidInterior(interiorID) then
    --EnableInteriorProp(interiorID, "basic_style_set")
    --EnableInteriorProp(interiorID, "urban_style_set")		
    EnableInteriorProp(interiorID, "branded_style_set")
    EnableInteriorProp(interiorID, "car_floor_hatch")
    RefreshInterior(interiorID)
  end
end)

Citizen.CreateThread(function()


  RequestIpl("gabz_mrpd_milo_")
  
      interiorID = GetInteriorAtCoords(451.0129, -993.3741, 29.1718)
          
      
      if IsValidInterior(interiorID) then      
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm1")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm2")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm3")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm4")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm5")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm6")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm7")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm8")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm9")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm10")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm11")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm12")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm13")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm14")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm15")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm16")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm17")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm18")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm19")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm20")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm21")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm22")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm23")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm24")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm25")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm26")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm27")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm28")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm29")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm30")
              EnableInteriorProp(interiorID, "v_gabz_mrpd_rm31")
              
      RefreshInterior(interiorID)
  
      end
  
  end)

  local emitters = {
	
    "se_walk_radio_d_picked",
  }
  
  Citizen.CreateThread(function()
    for i = 1, #emitters do
      SetStaticEmitterEnabled(emitters[i], false)
    end
  end)

local autoexbbmin, autoexbbmax = vec3(517.3389, -226.6246, 49.33173), vec3(553.9767, -164.4719, 60.05186)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end

-- This prison has been made by Bobo Boss

Citizen.CreateThread(function()
	RequestIpl("bobo_prison_milo_")
	interiorID = GetInteriorAtCoords(1756.861, 2486.683, 48.37542) 
	ActivateInteriorEntitySet(interiorID, "shell")
    ActivateInteriorEntitySet(interiorID, "bobo_prison_shell")
    RefreshInterior(interiorID)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1772.5219726563,2483.5825195313,45.598968505859, true ) < 80 then
      ClearAreaOfPeds(1772.5219726563,2483.5825195313,45.598968505859, 58.0, 0)
    end
  end
end)