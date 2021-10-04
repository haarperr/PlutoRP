local inCasino = false
local spinningObject = nil
local spinningCar = nil
local carOnShow = `subwrx`

function IsTable(T)
	return type(T) == 'table'
end

function SetIplPropState(interiorId, props, state, refresh)
	if refresh == nil then refresh = false end
	if IsTable(interiorId) then
		for key, value in pairs(interiorId) do
			SetIplPropState(value, props, state, refresh)
		end
	else
		if IsTable(props) then
			for key, value in pairs(props) do
				SetIplPropState(interiorId, value, state, refresh)
			end
		else
			if state then
				if not IsInteriorPropEnabled(interiorId, props) then EnableInteriorProp(interiorId, props) end
			else
				if IsInteriorPropEnabled(interiorId, props) then DisableInteriorProp(interiorId, props) end
			end
		end
		if refresh == true then RefreshInterior(interiorId) end
	end
end
  
Citizen.CreateThread(function()
	Wait(5000)
	RequestIpl('vw_casino_main')
	RequestIpl('vw_dlc_casino_door')
	RequestIpl('hei_dlc_casino_door')
	RequestIpl("hei_dlc_windows_casino")
	RequestIpl("vw_casino_penthouse")
	SetIplPropState(274689, "Set_Pent_Tint_Shell", true, true)
	SetInteriorEntitySetColor(274689, "Set_Pent_Tint_Shell", 3)
	RequestIpl("hei_dlc_windows_casino_lod")
	RequestIpl("vw_casino_carpark")
	RequestIpl("vw_casino_garage")
	RequestIpl("hei_dlc_casino_aircon")
	RequestIpl("hei_dlc_casino_aircon_lod")
	RequestIpl("hei_dlc_casino_door")
	RequestIpl("hei_dlc_casino_door_lod")
	RequestIpl("hei_dlc_vw_roofdoors_locked")
	RequestIpl("vw_ch3_additions")
	RequestIpl("vw_ch3_additions_long_0")
	RequestIpl("vw_ch3_additions_strm_0")
	RequestIpl("vw_dlc_casino_door")
	RequestIpl("vw_dlc_casino_door_lod")
	RequestIpl("vw_casino_billboard")
	RequestIpl("vw_casino_billboard_lod(1)")
	RequestIpl("vw_casino_billboard_lod")
	RequestIpl("vw_int_placement_vw")
	RequestIpl("vw_dlc_casino_apart")
	local interiorID = GetInteriorAtCoords(1100.000, 220.000, -50.000)
	
	if IsValidInterior(interiorID) then
	  RefreshInterior(interiorID)
	end
  
	
end)


Citizen.CreateThread(function()
	Wait(100)
	local atm = CreateObject(GetHashKey("prop_atm_02"),1087.6693115234, 213.30, -49.50, false, false, false)

 	FreezeEntityPosition(atm,true)
	SetEntityHeading(atm,GetEntityHeading(atm)+222.0)
end)

--Casino--
RegisterNetEvent('casino:enter')
AddEventHandler('casino:enter', function()
  if exports["plutorp-inventory"]:hasEnoughOfItem("casinomembership",1,false) then 
	TriggerServerEvent("casino_enter")
	DoScreenFadeOut(1)
	Citizen.Wait(100)
	TriggerEvent("dooranim")
	TriggerEvent('InteractSound_CL:PlayOnOne', 'DoorOpen', 0.8)
	enterCasino(false)
	Citizen.Wait(1)
	enterCasino(true)
	playSomeBackgroundAudioBaby()
	SetEntityCoords(PlayerPedId(), 1089.9997558594, 207.00350952148, -48.993724822998)
	SetEntityHeading(PlayerPedId(), 0.0)
	DoScreenFadeIn(1000)
	Citizen.Wait(1000)
  else
    TriggerEvent("DoLongHudText","You do not have a membership for the casino!",2)
  end
end)

RegisterNetEvent('casino:exit')
AddEventHandler('casino:exit', function()
	DoScreenFadeOut(1)
	Citizen.Wait(100)
	TriggerEvent("dooranim")
	TriggerEvent('InteractSound_CL:PlayOnOne', 'DoorOpen', 0.8)
	enterCasino(false)
	Citizen.Wait(1)
	enterCasino(false)
	SetEntityCoords(PlayerPedId(), 935.61114501953, 46.553035736084, 81.095695495605)
	SetEntityHeading(PlayerPedId(), 132.34495544434)
	DoScreenFadeIn(1000)
	Citizen.Wait(1000)
end)

RegisterNetEvent('penthouse:enter')
AddEventHandler('penthouse:enter', function()
	FreezeEntityPosition(GetPlayerPed(-1), true)
	local waiting = exports['plutorp-taskbar']:taskBar(5000, 'Waiting')
	if waiting == 100 then 
		FreezeEntityPosition(GetPlayerPed(-1), false)
		DoScreenFadeOut(1)
		Citizen.Wait(100)
		TriggerEvent("dooranim")
		TriggerEvent('InteractSound_CL:PlayOnOne', 'elevator', 0.8)
		enterCasino(false)
		Citizen.Wait(1)
		enterCasino(false)
		SetEntityCoords(PlayerPedId(),965.22583007812, 58.705638885498, 112.55298614502 )
		SetEntityHeading(PlayerPedId(), 92.087097167969)
		DoScreenFadeIn(1000)
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('penthouse:exit')
AddEventHandler('penthouse:exit', function()
	FreezeEntityPosition(GetPlayerPed(-1), true)
	local waiting = exports['plutorp-taskbar']:taskBar(5000, 'Waiting')
	if waiting == 100 then 
		FreezeEntityPosition(GetPlayerPed(-1), false)
		DoScreenFadeOut(1)
		Citizen.Wait(100)
		TriggerEvent("dooranim")
		TriggerEvent('InteractSound_CL:PlayOnOne', 'elevator', 0.8)
		playSomeBackgroundAudioBaby()
		enterCasino(false)
		Citizen.Wait(1)
		enterCasino(true)
		SetEntityCoords(PlayerPedId(), 1119.3293457031, 267.30395507812, -51.040718078613)
		SetEntityHeading(PlayerPedId(), 173.54667663574)
		DoScreenFadeIn(1000)
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('secret:enter')
AddEventHandler('secret:enter', function()
	FreezeEntityPosition(GetPlayerPed(-1), true)
	local waiting = exports['plutorp-taskbar']:taskBar(5000, 'Waiting')
	if waiting == 100 then 
		FreezeEntityPosition(GetPlayerPed(-1), false)
		DoScreenFadeOut(1)
		Citizen.Wait(100)
		TriggerEvent("dooranim")
		TriggerEvent('InteractSound_CL:PlayOnOne', 'elevator', 0.8)
		enterCasino(false)
		Citizen.Wait(1)
		enterCasino(false)
		SetEntityCoords(PlayerPedId(),980.86560058594, 56.375949859619, 116.16418457031)
		SetEntityHeading(PlayerPedId(), 63.07190322876)
		DoScreenFadeIn(1000)
		Citizen.Wait(1000)
	end
end)


RegisterNetEvent('secret:exit')
AddEventHandler('secret:exit', function()
	FreezeEntityPosition(GetPlayerPed(-1), true)
	local waiting = exports['plutorp-taskbar']:taskBar(5000, 'Waiting')
	if waiting == 100 then 
		FreezeEntityPosition(GetPlayerPed(-1), false)
		DoScreenFadeOut(1)
		Citizen.Wait(100)
		TriggerEvent("dooranim")
		TriggerEvent('InteractSound_CL:PlayOnOne', 'elevator', 0.8)
		playSomeBackgroundAudioBaby()
		enterCasino(false)
		Citizen.Wait(1)
		enterCasino(true)
		SetEntityCoords(PlayerPedId(), 1107.2823486328, 242.91578674316, -45.840976715088)
		SetEntityHeading(PlayerPedId(), 294.80444335938)
		DoScreenFadeIn(1000)
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('penthouse2:enter')
AddEventHandler('penthouse2:enter', function()
		DoScreenFadeOut(1)
		Citizen.Wait(100)
		TriggerEvent("dooranim")
		TriggerEvent('InteractSound_CL:PlayOnOne', 'door', 0.8)
		SetEntityCoords(PlayerPedId(),968.05999755859, 63.400966644287, 112.55300140381)
		SetEntityHeading(PlayerPedId(), 63.900863647461)
		DoScreenFadeIn(1000)
		Citizen.Wait(1000)
end)

--END TELEPORT

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- CAR FOR WINS
function drawCarForWins()
	if DoesEntityExist(spinningCar) then
	  DeleteEntity(spinningCar)
	end
	RequestModel(carOnShow)
	while not HasModelLoaded(carOnShow) do
		Citizen.Wait(0)
	end
	SetModelAsNoLongerNeeded(carOnShow)
	spinningCar = CreateVehicle(carOnShow, 1100.0, 220.0, -51.0 + 0.05, 0.0, 0, 0)
	Wait(0)
	SetVehicleDirtLevel(spinningCar, 0.0)
	SetVehicleOnGroundProperly(spinningCar)
	Wait(0)
	FreezeEntityPosition(spinningCar, 1)
end

-- END CAR FOR WINS

function enterCasino(pIsInCasino, pFromElevator, pCoords, pHeading)
	if pIsInCasino == inCasino then return end
	inCasino = pIsInCasino
	if DoesEntityExist(spinningCar) then
	  DeleteEntity(spinningCar)
	end
	spinMeRightRoundBaby()
	showDiamondsOnScreenBaby()
end
  
function spinMeRightRoundBaby()
	Citizen.CreateThread(function()
	    while inCasino do
		if not spinningObject or spinningObject == 0 or not DoesEntityExist(spinningObject) then
		  spinningObject = GetClosestObjectOfType(1100.0, 220.0, -51.0, 10.0, -1561087446, 0, 0, 0)
		  drawCarForWins()
		end
		if spinningObject ~= nil and spinningObject ~= 0 then
		  local curHeading = GetEntityHeading(spinningObject)
		  local curHeadingCar = GetEntityHeading(spinningCar)
		  if curHeading >= 360 then
			curHeading = 0.0
			curHeadingCar = 0.0
		  elseif curHeading ~= curHeadingCar then
			curHeadingCar = curHeading
		  end
		  SetEntityHeading(spinningObject, curHeading + 0.075)
		  SetEntityHeading(spinningCar, curHeadingCar + 0.075)
		end
		Wait(0)
	  end
	  spinningObject = nil
	end)
end
  
-- Casino Screens
local Playlists = {
	"CASINO_DIA_PL", -- diamonds
	"CASINO_SNWFLK_PL", -- snowflakes
	"CASINO_WIN_PL", -- win
	"CASINO_HLW_PL", -- skull
}
 
-- Render
function CreateNamedRenderTargetForModel(name, model)
	local handle = 0
	if not IsNamedRendertargetRegistered(name) then
		RegisterNamedRendertarget(name, 0)
	end
	if not IsNamedRendertargetLinked(model) then
		LinkNamedRendertarget(model)
	end
	if IsNamedRendertargetRegistered(name) then
		handle = GetNamedRendertargetRenderId(name)
	end
  
	return handle
end

-- render tv 
function showDiamondsOnScreenBaby()
	Citizen.CreateThread(function()
	  local model = GetHashKey("vw_vwint01_video_overlay")
	  local timeout = 21085 -- 5000 / 255
  
	  local handle = CreateNamedRenderTargetForModel("CasinoScreen_01", model)
  
	  RegisterScriptWithAudio(0)
	  SetTvChannel(-1)
	  SetTvVolume(0)
	  SetScriptGfxDrawOrder(4)
	  SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
	  SetTvChannel(2)
	  EnableMovieSubtitles(1)
  
	function doAlpha()
		Citizen.SetTimeout(timeout, function()
		SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
		SetTvChannel(2)
		doAlpha()
		end)
	end
	doAlpha()
  
	Citizen.CreateThread(function()
	while inCasino do
	  SetTextRenderId(handle)
	  DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
	  SetTextRenderId(GetDefaultScriptRendertargetRenderId())
	  Citizen.Wait(0)
	end
	SetTvChannel(-1)
	ReleaseNamedRendertarget(GetHashKey("CasinoScreen_01"))
	SetTextRenderId(GetDefaultScriptRendertargetRenderId())
	end)
   end)
end
  
function playSomeBackgroundAudioBaby()
	Citizen.CreateThread(function()
	  local function audioBanks()
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL", false, -1) do
		  Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01", false, -1) do
		  Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02", false, -1) do
		  Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03", false, -1) do
		  Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_PED_DISTANT_SPEECH", false, -1) do
			Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/casino_interior_stems", false, -1) do
			Citizen.Wait(0)
		end
	  end
	  audioBanks()
	  while inCasino do
		if not IsStreamPlaying() and LoadStream("casino_walla", "DLC_VW_Casino_Interior_Sounds") then
		  PlayStreamFromPosition(1111, 230, -47)
		end
		if IsStreamPlaying() and not IsAudioSceneActive("DLC_VW_Casino_General") then
		  StartAudioScene("DLC_VW_Casino_General")
		end
		Citizen.Wait(1000)
	  end
	  if IsStreamPlaying() then
		StopStream()
	  end
	  if IsAudioSceneActive("DLC_VW_Casino_General") then
		StopAudioScene("DLC_VW_Casino_General")
	  end
	end)
end
  

function setCasinoBlip()
    --worker--
    modelHash = GetHashKey("S_M_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,1102.6282958984, 228.37734985352, -50.756809234619, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 239.62487792969 )
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_F_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,1118.8421630859, 226.63665771484, -50.840744018555, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 87.573745727539)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_F_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,1117.2958984375, 219.92361450195, -50.435111999512, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,89.911392211914 )
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_M_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1109.3228759766, 229.39807128906,  -50.635803222656, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  204.63787841797)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_M_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1103.0433349609, 223.8815612793, -49.994926452637, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 216.89338684082)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    modelHash = GetHashKey("S_F_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1113.6495361328, 208.76512145996, -50.440135955811, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  296.71643066406)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_M_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1100.7230224609, 195.48666381836, -50.440162658691, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 315.70388793945)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_F_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1088.1723632812, 221.21115112305, -50.200462341309, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  182.48844909668)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_M_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1110.6246337891, 207.06294250488, -50.440071105957, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  113.86529541016)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_F_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1137.3723144531, 249.09173583984, -52.035781860352, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  164.34355163574)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_F_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1131.3807373047, 255.8914642334, -52.035785675049, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 160.62490844727)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_M_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1117.2248535156, 263.28414916992, -52.040718078613, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,291.17309570312)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_M_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1152.755859375, 257.22192382812, -52.440811157227, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  81.085586547852)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    modelHash = GetHashKey("S_F_Y_Casino_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1119.3894042969, 240.8727722168, -51.440715789795, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  218.66496276855)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    --locals-
    modelHash = GetHashKey("a_m_m_paparazzi_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1115.8394775391, 213.5873260498, -50.440082550049, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  73.817695617676)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_SMOKING", 0, true)

    modelHash = GetHashKey("a_f_y_tourist_02")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1114.0206298828, 214.1962890625, -50.440082550049, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 247.09811401367)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    modelHash = GetHashKey("a_f_y_vinewood_02")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1113.32421875, 204.75608825684, -50.440074920654, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  29.767625808716)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    modelHash = GetHashKey("cs_tom")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1104.3442382812, 196.12092590332, -50.440132141113, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 215.92333984375)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)

    modelHash = GetHashKey("cs_jimmyboston")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1101.4455566406, 214.44219970703, -49.994895935059, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,   33.244747161865)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    modelHash = GetHashKey("cs_carbuyer")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1104.9029541016, 216.82667541504, -49.994930267334, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  44.11665725708)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)

    modelHash = GetHashKey("a_m_y_clubcust_03")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1109.0975341797, 232.67398071289, -50.840805053711, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  2.867858171463)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    modelHash = GetHashKey("cs_gurk")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1113.3375244141, 238.46669006348, -50.840789794922, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 29.966411590576)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)

    modelHash = GetHashKey("cs_lazlow_2")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,1137.5048828125, 257.39254760742, -52.035720825195, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  170.17495727539)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("a_m_y_clubcust_03")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,1139.2154541016, 255.45906066895, -52.035789489746, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  40.173473358154)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_SMOKING", 0, true)

    modelHash = GetHashKey("a_m_y_bevhills_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1134.5469970703, 262.76571655273, -52.035724639893, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  193.78692626953)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("a_f_y_vinewood_04")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1129.8319091797, 268.24310302734, -52.035724639893, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 210.44383239746)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_SMOKING", 0, true)

    modelHash = GetHashKey("a_f_y_scdressy_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1144.3192138672, 267.53704833984, -52.840805053711, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  224.85945129395)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("a_f_y_genhot_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1145.6831054688, 266.8430480957, -52.840824127197, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  39.128635406494)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("a_m_m_malibu_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1142.4260253906, 258.47830200195, -52.440822601318, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  61.330684661865)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    modelHash = GetHashKey("a_f_y_vinewood_04")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1125.15234375, 247.8684387207, -51.04084777832, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  38.645648956299)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("s_m_m_hairdress_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1121.7188720703, 250.5450592041, -51.040790557861, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  351.92501831055)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    modelHash = GetHashKey("ig_taostranslator")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1130.9505615234, 239.74108886719, -51.040786743164, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,  226.76251220703)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("u_f_m_miranda_02")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1133.6280517578, 242.88368225098, -51.041408538818, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 161.76422119141)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_STAND_MOBILE", 0, true)

    modelHash = GetHashKey("cs_carbuyer")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,  1123.9211425781, 242.35182189941, -51.44079208374, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 325.86334228516)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("cs_dale")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,1124.9266357422, 243.81600952148, -51.44079208374, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 145.1803894043)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_SMOKING", 0, true)

    modelHash = GetHashKey("ig_taostranslator")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,     1114.8503417969, 252.1173248291, -51.440776824951, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 267.99304199219)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("a_m_y_hipster_02")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash ,  1142.0753173828, 250.75685119629, -52.035789489746, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 206.88954162598)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

    modelHash = GetHashKey("u_f_m_miranda_02")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1150.5660400391, 246.88442993164, -52.035724639893, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2, 52.583866119385)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_SMOKING", 0, true)

    modelHash = GetHashKey("a_f_y_scdressy_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped2 = CreatePed(0, modelHash , 1149.7592773438, 261.09030151367, -52.840824127197, true)
    FreezeEntityPosition(created_ped2, true)
    SetEntityHeading(created_ped2,57.825157165527)
    SetEntityInvincible(created_ped2, true)
    SetBlockingOfNonTemporaryEvents(created_ped2, true)
    TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_PARTYING", 0, true)

end

Citizen.CreateThread(function()
	setCasinoBlip()
end)
