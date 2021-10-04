local tool_shops = {

	{ ['x'] = 44.838947296143, ['y'] = -1748.5364990234, ['z'] = 29.549386978149 , ['r'] = 50.0},
	{ ['x'] = 2749.2309570313, ['y'] = 3472.3308105469, ['z'] = 55.679393768311,  ['r'] = 260.0},
}



local twentyfourseven_shops = {
	{ ['x'] = 25.925277709961, ['y'] = -1347.4022216797, ['z'] = 29.482055664062},
    { ['x'] = -48.34285736084, ['y'] = -1757.7890625, ['z'] = 29.414672851562},
    { ['x'] = -707.9208984375, ['y'] = -914.62414550781, ['z'] = 19.20361328125},
    { ['x'] = 1135.6878662109, ['y'] = -981.71868896484, ['z'] = 46.399291992188},
    { ['x'] = -1223.6307373047, ['y'] = -906.76483154297, ['z'] = 12.312133789062},
    { ['x'] = 373.81979370117, ['y'] = 326.0439453125, ['z'] = 103.55383300781},
    { ['x'] = 1163.6439208984, ['y'] = -324.13186645508, ['z'] = 69.197021484375},
    { ['x'] = -2968.298828125, ['y'] = 390.59341430664, ['z'] = 15.041748046875},
    { ['x'] = -3242.4658203125, ['y'] = 1001.6703491211, ['z'] = 12.817626953125},
    { ['x'] = -1820.7427978516, ['y'] = 792.36926269531, ['z'] = 138.11279296875},
    { ['x'] = 2557.1472167969, ['y'] = 382.12747192383,['z'] = 108.60876464844},
    { ['x'] = 2678.8879394531, ['y'] = 3280.3911132812, ['z'] = 55.228515625},
    { ['x'] = 1961.5648193359, ['y'] = 3740.6901855469, ['z'] = 32.329711914062},
    { ['x'] = 1392.3824462891, ['y'] = 3604.5495605469, ['z'] = 34.97509765625},
    { ['x'] = 1698.158203125, ['y'] = 4924.404296875, ['z'] = 42.052001953125},
    { ['x'] = 1728.9230957031, ['y'] = 6414.3823242188, ['z'] = 35.025634765625},
    { ['x'] = 1166.4000244141, ['y'] = 2709.1647949219, ['z'] = 38.142822265625},
    { ['x'] = 547.49011230469, ['y'] = 2671.2131347656, ['z'] = 42.153076171875},
    --{ ['x'] = 460.9186706543,['y'] = -982.31207275391, ['z'] = 30.678344726562},
    --{ ['x'] = 448.23297119141, ['y'] = -973.95166015625, ['z'] = 34.958251953125},
    { ['x'] = 1841.3670654297, ['y'] = 2591.2878417969,['z'] = 46.01171875},
}

local weashop_locations = {
	{entering = {811.973572,-2155.33862,28.8189938}, inside = {811.973572,-2155.33862,28.8189938}, outside = {811.973572,-2155.33862,28.8189938},delay = 900},
	{entering = { 1692.54, 3758.13, 34.71}, inside = { 1692.54, 3758.13, 34.71}, outside = { 1692.54, 3758.13, 34.71},delay = 600},
	{entering = {252.915,-48.186,69.941}, inside = {252.915,-48.186,69.941}, outside = {252.915,-48.186,69.941},delay = 600},
	{entering = {844.352,-1033.517,28.094}, inside = {844.352,-1033.517,28.194}, outside = {844.352,-1033.517,28.194},delay = 780},
	{entering = {-331.487,6082.348,31.354}, inside = {-331.487,6082.348,31.454}, outside = {-331.487,6082.348,31.454},delay = 600},
	{entering = {-664.268,-935.479,21.729}, inside = {-664.268,-935.479,21.829}, outside = {-664.268,-935.479,21.829},delay = 600},
	{entering = {-1305.427,-392.428,36.595}, inside = {-1305.427,-392.428,36.695}, outside = {-1305.427,-392.428,36.695},delay = 600},
	{entering = {-1119.1, 2696.92, 18.56}, inside = {-1119.1, 2696.92, 18.56}, outside = {-1119.1, 2696.92, 18.56},delay = 600},
	{entering = {2569.978,294.472,108.634}, inside = {2569.978,294.472,108.734}, outside = {2569.978,294.472,108.734},delay = 800},
	{entering = {-3172.584,1085.858,20.738}, inside = {-3172.584,1085.858,20.838}, outside = {-3172.584,1085.858,20.838},delay = 600},
	{entering = {20.0430,-1106.469,29.697}, inside = {20.0430,-1106.469,29.797}, outside = {20.0430,-1106.469,29.797},delay = 600},
}



local weashop_blips = {}

RegisterNetEvent("shop:isNearPed")
AddEventHandler("shop:isNearPed", function()
	local pedpos = GetEntityCoords(PlayerPedId())
	local found = false
	for k,v in ipairs(twentyfourseven_shops)do
		local dist = #(vector3(v.x, v.y, v.z) - vector3(pedpos.x,pedpos.y,pedpos.z))
		if(dist < 10 and not found)then
			found = true
			TriggerServerEvent("exploiter", "User sold to a shop keeper at store.")
		end
	end
end)

function setShopBlip()

	for station,pos in pairs(weashop_locations) do
		local loc = pos
		pos = pos.entering
		local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
		-- 60 58 137
		SetBlipSprite(blip,110)
		SetBlipScale(blip, 0.5)
		SetBlipColour(blip, 17)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Ammunation')
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,true)
		SetBlipAsMissionCreatorBlip(blip,true)
		weashop_blips[#weashop_blips+1]= {blip = blip, pos = loc}
	end

	for k,v in ipairs(tool_shops)do
		
		modelHash = GetHashKey("s_m_m_gaffer_01")
		RequestModel(modelHash)
		while not HasModelLoaded(modelHash) do
			 Wait(1)
		end
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 544)
		SetBlipScale(blip, 0.5)
		SetBlipColour(blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Tool Shop")
		EndTextCommandSetBlipName(blip)

		created_ped = CreatePed(0, modelHash , v.x + 0.6 , v.y - 0.4 , v.z - 1,true)
		FreezeEntityPosition(created_ped, true)
		SetEntityHeading(created_ped,  v.r)
		SetEntityInvincible(created_ped, true)
		SetBlockingOfNonTemporaryEvents(created_ped, true)
		TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	end	

	-- PD SPAWN VEHICLES
	modelHash = GetHashKey("ig_benny")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		 Wait(1)
	end
	created_ped = CreatePed(0, modelHash , 443.56552124023, -973.99517822266, 24.7,true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped,  222.662109375)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- PD SPAWN VEHICLES 2
	modelHash = GetHashKey("ig_benny")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
			Wait(1)
	end
	created_ped = CreatePed(0, modelHash , 453.85159301750, -974.06115722656, 24.799850463867,true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped,  178.05177307129)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- PD SPAWN HELI
	modelHash = GetHashKey("s_m_y_pilot_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	created_ped2 = CreatePed(0, modelHash , 444.77874755859, -976.54058837891, 42.7,true)
	FreezeEntityPosition(created_ped2, true)
	SetEntityHeading(created_ped2,  222.1897277832)
	SetEntityInvincible(created_ped2, true)
	SetBlockingOfNonTemporaryEvents(created_ped2, true)
	TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- PD SPAWN BOAT
	modelHash = GetHashKey("hc_gunman")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , -807.38018798828, -1497.1604003906, 1.5952178239822 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped,  285.02960205078)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

		-- PD SPAWN BOAT
		modelHash = GetHashKey("hc_driver")
		RequestModel(modelHash)
		while not HasModelLoaded(modelHash) do
			 Wait(1)
		end      
		ped = CreatePed(0, modelHash , -1805.7152099609, -1233.3741455078, 1.5952178239822 -1,true)
		FreezeEntityPosition(ped, true)
		SetEntityHeading(ped,  285.02960205078)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
		-- PD SPAWN BOAT
		modelHash = GetHashKey("s_m_y_pestcont_01")
		RequestModel(modelHash)
		while not HasModelLoaded(modelHash) do  
			 Wait(1)
		end      
		ped = CreatePed(0, modelHash , -1605.3192138672, 5258.4326171875, 2.08425903320312 -1,true)
		FreezeEntityPosition(ped, true)
		SetEntityHeading(ped,  285.02960205078)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
		-- PD SPAWN BOAT
		modelHash = GetHashKey("u_m_y_pogo_01")
		RequestModel(modelHash)
		while not HasModelLoaded(modelHash) do  
			 Wait(1)
		end      
		ped = CreatePed(0, modelHash , 1428.1237792969, 3819.1003417969, 31.524799346924  -1,true)
		FreezeEntityPosition(ped, true)
		SetEntityHeading(ped,  285.02960205078)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Digital Den
	modelHash = GetHashKey("a_m_m_hillbilly_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , 1134.6209716797, -465.67501831055, 66.485893249512 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped,  346.83407592773)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Bank Info
	modelHash = GetHashKey("a_m_m_hillbilly_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -524.49444580078, -2891.1118164062, 6.0003805160522 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped,  116.97672271729)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Docs
	modelHash = GetHashKey("a_m_m_afriamer_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , 1181.5024414062, -3112.8596191406, 6.0280251502991 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped, 153.62969970703)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Casino Claim Car
	modelHash = GetHashKey("a_m_y_smartcaspat_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , 909.34808349609, 50.654273986816, 80.893768310547 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped,  274.91961669922)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Casino Membership
	modelHash = GetHashKey("a_m_y_smartcaspat_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , 929.20233154297, 35.924045562744, 81.095741271973 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped,  351.65298461914)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Ammunation Ped
	modelHash = GetHashKey("a_m_m_hillbilly_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , 1754.1928710938, -1647.8236083984, 112.64486694336 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped,  221.91744995117)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

    -- Money Wash
	modelHash = GetHashKey("a_m_m_tranvest_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		 Wait(1)
	end
	created_ped = CreatePed(0, modelHash , 499.12533569336, -550.29895019531, 23.851160049438,true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped,  177.87086486816)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- LS bus station
	modelHash = GetHashKey("a_m_y_soucent_02")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , 481.28921508789, -566.52758789062, 28.91837310791 -1,true)
	FreezeEntityPosition(ped, true)
	SetEntityHeading(ped,  167.81857299805)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING_POT", 0, true)


	-- EMS SPAWN VEHICLES
	modelHash = GetHashKey("mp_f_bennymech_01")
	RequestModel(modelHash)
	
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	created_ped4 = CreatePed(0, modelHash , 340.51556396484, -582.76434326172, 27.8,true)
	FreezeEntityPosition(created_ped4, true)
	SetEntityHeading(created_ped4,  79.914192199707)
	SetEntityInvincible(created_ped4, true)
	SetBlockingOfNonTemporaryEvents(created_ped4, true)
	TaskStartScenarioInPlace(created_ped4, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- EMS SPAWN HELI
	modelHash = GetHashKey("s_m_m_pilot_02")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , 355.17, -580.54, 74.16 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 157.31)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Cutting Fish
	modelHash = GetHashKey("a_m_m_farmer_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		 Wait(1)
	end
	created_ped5 = CreatePed(0, modelHash , -3424.5080566406, 974.40179443359, 7.3466844558716,true)
	FreezeEntityPosition(created_ped5, true)
	SetEntityHeading(created_ped5,  88.371482849121)
	SetEntityInvincible(created_ped5, true)
	SetBlockingOfNonTemporaryEvents(created_ped5, true)
	TaskStartScenarioInPlace(created_ped5, "WORLD_HUMAN_CLIPBOARD", 0, true)

    -- Pillbox
	modelHash = GetHashKey("s_f_y_scrubs_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		 Wait(1)
	end
	created_ped5 = CreatePed(0, modelHash , 310.03704833984, -568.90185546875, 42.320198059082,true)
	FreezeEntityPosition(created_ped5, true)
	SetEntityHeading(created_ped5,  68.02180480957)
	SetEntityInvincible(created_ped5, true)
	SetBlockingOfNonTemporaryEvents(created_ped5, true)
	TaskStartScenarioInPlace(created_ped5, "WORLD_HUMAN_AA_SMOKE", 0, true)

	-- Making Sushi
	modelHash = GetHashKey("a_m_y_beach_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		 Wait(1)
	end
	created_ped6 = CreatePed(0, modelHash , -3248.1052246094, 994.96502685547, 12.48 - 1,true)
	FreezeEntityPosition(created_ped6, true)
	SetEntityHeading(created_ped6, 182.60130310059)
	SetEntityInvincible(created_ped6, true)
	SetBlockingOfNonTemporaryEvents(created_ped6, true)
	TaskStartScenarioInPlace(created_ped6, "WORLD_HUMAN_SMOKING_POT", 0, true)

	modelHash = GetHashKey("a_m_m_beach_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		 Wait(1)
	end
	created_ped7 = CreatePed(0, modelHash , -1037.5577392578, -1397.0576171875, 4.5531911849976,true)
	FreezeEntityPosition(created_ped7, true)
	SetEntityHeading(created_ped7, 74.969627380371)
	SetEntityInvincible(created_ped7, true)
	SetBlockingOfNonTemporaryEvents(created_ped7, true)
	TaskStartScenarioInPlace(created_ped7, "WORLD_HUMAN_SMOKING_POT", 0, true)

	modelHash = GetHashKey("cs_lestercrest")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , 913.97, -1272.84, 27.1 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 125.9)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, true)

	--Hunting
	modelHash = GetHashKey("cs_hunter")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , -674.29302978516, 5837.615234375, 17.340143203735 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 137.02824401855)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, true)

	--Hobo man yo
	modelHash = GetHashKey("a_m_m_trampbeac_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		 Wait(1)
	end
	ped = CreatePed(0, modelHash , 122.21717071533, -1179.3106689453, 30.406253814697 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 231.24847412109)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING_POT", 0, true)

	--Coke Enter
	modelHash = GetHashKey("u_m_m_jesus_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , 942.697265625, -1697.5668945312, 30.279956817627 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 266.81774902344)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	-- --Digital Den
	-- modelHash = GetHashKey("a_m_m_eastsa_01")
	-- RequestModel(modelHash)
	-- while not HasModelLoaded(modelHash) do
	--  	Wait(1)
	-- end
	-- ped = CreatePed(0, modelHash , 1133.7697753906, -467.91381835938, 66.485771179199 - 1,true)
	-- FreezeEntityPosition(ped, true)
	-- SetEntityInvincible(ped, true)
	-- SetEntityHeading(ped, 163.07077026367)
	-- SetBlockingOfNonTemporaryEvents(ped, true)
	-- -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	--Weird Shit
	modelHash = GetHashKey("a_m_m_eastsa_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , 3611.59375, 5026.8012695312, 11.350678443909- 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 251.68399047852)
	SetBlockingOfNonTemporaryEvents(ped, true)
	-- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	--Crack Sell
	modelHash = GetHashKey("cs_omega")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , -415.16616821289, 6327.9741210938, 28.763023376465 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 38.781238555908)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

    -- Garbage
	modelHash = GetHashKey("s_m_y_dockwork_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -322.24407958984, -1545.8966064453, 31.019908905029 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 272.05419921875)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)	

	--Boat Rental
	modelHash = GetHashKey("mp_m_weed_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , -1612.7983398438, 5262.236328125, 3.9741015434265 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 205.71180725098)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, true)
	
	--Chop Shop
	modelHash = GetHashKey("cs_old_man2")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , -556.67144775391, -1687.9411621094, 19.310976028442 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 195.47085571289)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	modelHash = GetHashKey("cs_floyd")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , -419.02,-1686.27, 19.02 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 116.90)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	--Chicken
	modelHash = GetHashKey("a_m_m_farmer_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , 2388.1337890625, 5044.4125976562, 46.298980712891 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 244.49458312988)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	modelHash = GetHashKey("a_m_m_indian_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash ,-591.47741699219, -892.47906494141, 25.943695068359 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 92.768966674805)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	modelHash = GetHashKey("s_m_y_factory_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash ,-98.654586791992, 6205.0146484375, 31.025030136108 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 52.60689163208)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_FIRE", 0, true)

	modelHash = GetHashKey("s_m_y_factory_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash ,-104.3522644043, 6209.9555664062, 31.025053024292 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 241.7554473877)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	--Mining
	modelHash = GetHashKey("ig_cletus")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash ,-596.94891357422, 2088.8088378906, 131.6024017334 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 345.52709960938)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	--rock sellong
	modelHash = GetHashKey("a_m_y_stwhi_02")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash ,-2203.0927734375, 4244.4580078125, 48.346282958984 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 46.876808166504)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)


	modelHash = GetHashKey("s_m_m_dockwork_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash ,2948.5131835938, 2852.2021484375, 48.894481658936 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 230.6226348877)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
	
	modelHash = GetHashKey("s_m_m_gentransport")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash ,412.08004760742, 315.05334472656, 103.13271331787 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 201.34809875488)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	modelHash = GetHashKey("a_m_m_acult_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash ,1984.0427246094, 553.58233642578, 161.44830322266 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 223.5192565918)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Meth
	modelHash = GetHashKey("a_m_y_indian_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -1437.0501708984, -372.67880249023, 38.232624053955 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 122.43501281738)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	-- micheals house
	modelHash = GetHashKey("player_zero")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -812.56072998047, 182.8959197998, 72.15308380127 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 200.9660949707)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	-- karen 
	modelHash = GetHashKey("a_f_m_eastsa_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -648.20971679688, -1135.7663574219, 11.986864089966 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 296.08599853516)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)	

	-- Shiet 
	modelHash = GetHashKey("mp_m_bogdangoon")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -527.85534667969, -2220.2216796875, 18.114280700684 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 94.077880859375)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, true)

	-- Electronic run
	modelHash = GetHashKey("a_m_y_indian_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -582.07214355469, -1020.3939208984, 22.329683303833 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 271.53594970703)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

    -- SS car man ting 
	modelHash = GetHashKey("a_m_y_indian_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , 296.12228393555, -1713.9672851562, 29.174921035767 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 185.87266540527)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

    -- sell turtles

	modelHash = GetHashKey("a_m_y_indian_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	ped = CreatePed(0, modelHash , -1082.0241699219, -315.50793457031, 37.823421478271 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 87.631660461426)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- Vehicle rental legion
	modelHash = GetHashKey("a_m_y_ktown_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	created_ped = CreatePed(1, modelHash , 110.62511444092, -1090.6370849609, 28.378175735474,true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped,  17.739551544189)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

    -- mystery
	modelHash = GetHashKey("a_m_y_gencaspat_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	created_ped = CreatePed(1, modelHash , 471.9651184082, -1308.6553955078, 28.364170074463,true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped,  209.83323669434)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	-- sell ur goods yo
	modelHash = GetHashKey("a_m_m_indian_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	created_ped = CreatePed(1, modelHash , -830.45056152344, -1255.2735595703, 5.6844964027405,true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped,  175.36006164551)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "", 0, true)


	-- sell ur crabs
	modelHash = GetHashKey("a_m_y_beach_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	created_ped = CreatePed(1, modelHash , 903.11029052734, -1721.8819580078, 31.255082702637,true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped,  181.26852416992)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('shop:general')
AddEventHandler('shop:general', function()
	TriggerEvent("server-inventory-open", "2", "Shop")
	Wait(1000)
end)

RegisterNetEvent('digitaldens:craft')
AddEventHandler('digitaldens:craft', function()
	TriggerEvent("server-inventory-open", "999", "Craft");	
	Wait(1000)
end)

RegisterNetEvent('police:general')
AddEventHandler('police:general', function()
	TriggerEvent("server-inventory-open", "10", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('digital:denstore')
AddEventHandler('digital:denstore', function()
	TriggerEvent("server-inventory-open", "1000", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('toolshop:general')
AddEventHandler('toolshop:general', function()
	TriggerEvent("server-inventory-open", "4", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('courthouse:idbuy')
AddEventHandler('courthouse:idbuy', function()
	TriggerEvent("player:receiveItem",'idcard', 1)
	Wait(1000)
end)

-------------------------------------
-------- Mechanic Shops Shit --------
-------------------------------------

RegisterNetEvent('mech:craft')
AddEventHandler('mech:craft', function()
	local job = exports["plutorp_manager"]:isPed("myJob")
	if job == "hayes_autos" or job == "bennys" or job == 'harmony_autos' or job == 'auto_exotics' or job == 'tuner_shop' or job == "best_buds" or job == "bean_machine" then
		TriggerEvent("server-inventory-open", "27", "Craft");	
		Wait(1000)
	else
		TriggerEvent("DoLongHudText", "You dont have access to this", 2)
	end
end)

RegisterNetEvent("open:storage")
AddEventHandler("open:storage", function(shop)
	local job = exports["plutorp_manager"]:isPed("myJob")
	if job == "hayes_autos" or job == "gallery" or job == "digital_den" or job == "bennys" or job == 'harmony_autos' or job == 'auto_exotics' or job == 'tuner_shop' or job == "best_buds" or job == "bean_machine" or job == "burger_shot" or job == "bahamas_bar" or job == "best_buds" or job == "vanilla_unicorn" or job == "news" or job == "videogeddon_arcade" or job == "car_shop" or job == "sunrise_shop" then
		TriggerEvent("server-inventory-open", "1", job);
		Wait(1000)
	else
		TriggerEvent("DoLongHudText", "You dont have access to this", 2)
	end
end)

RegisterNetEvent("open:tray")
AddEventHandler("open:tray", function(shop)
	TriggerEvent("server-inventory-open", "1", shop);
	Wait(1000)
end)

-----------------------
-------- Shops --------
-----------------------

RegisterNetEvent('shops:food')
AddEventHandler('shops:food', function()
	TriggerEvent("server-inventory-open", "550", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('taco:craft')
AddEventHandler('taco:craft', function()
	TriggerEvent("server-inventory-open", "18", "Craft");	
	Wait(1000)
end)

RegisterNetEvent('shops:coffee')
AddEventHandler('shops:coffee', function()
	TriggerEvent("server-inventory-open", "549", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('shops:soda')
AddEventHandler('shops:soda', function()
	TriggerEvent("server-inventory-open", "548", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('shops:water')
AddEventHandler('shops:water', function()
	TriggerEvent("server-inventory-open", "551", "Shop");	
	Wait(1000)
end)

------------------------
------ Micheal ------
------------------------

RegisterNetEvent('Micheal:uzi')
AddEventHandler('Micheal:uzi', function()
	TriggerEvent("server-inventory-open", "10965", "Shop");	
	Wait(1000)
end)

------------------------
------ thermal man ------
------------------------

RegisterNetEvent('thermal:man')
AddEventHandler('thermal:man', function()
	TriggerEvent("server-inventory-open", "10967", "Shop");	
	Wait(1000)
end)

------------------------
------ safecracker man ------
------------------------

RegisterNetEvent('safecrack:buy')
AddEventHandler('safecrack:buy', function()
	TriggerEvent("server-inventory-open", "193134", "Shop");	
	Wait(1000)
end)

------------------------
------ Burgershot ------
------------------------

RegisterNetEvent('burgershot:craft')
AddEventHandler('burgershot:craft', function()
	TriggerEvent("server-inventory-open", "897", "Craft");	
	Wait(1000)
end)

RegisterNetEvent('burgershot:order')
AddEventHandler('burgershot:order', function()
	TriggerEvent("server-inventory-open", "654", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('weed:order')
AddEventHandler('weed:order', function()
	TriggerEvent("server-inventory-open", "655", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('arcade:order')
AddEventHandler('arcade:order', function()
	local rank = exports["plutorp_manager"]:GroupRank("videogeddon_arcade")
    if rank > 3 then    
		TriggerEvent("server-inventory-open", "656", "Shop");	
		Wait(1000)
	else
		TriggerEvent("DoLongHudText", "Are you a boss huh??!", 2)
	end
end)


------------------------
------ Bean Machine ------
------------------------


RegisterNetEvent('bean:craft')
AddEventHandler('bean:craft', function()
	TriggerEvent("server-inventory-open", "1312", "Craft");	
	Wait(1000)
end)

RegisterNetEvent('bean:order')
AddEventHandler('bean:order', function()
	TriggerEvent("server-inventory-open", "1311", "Shop");	
	Wait(1000)
end)


------------------------
------ pillbox shop ------
------------------------


RegisterNetEvent('pillbox:shop')
AddEventHandler('pillbox:shop', function()
	TriggerEvent("server-inventory-open", "10671", "Shop");	
	Wait(1000)
end)


-------------------------------
------ Police Department ------
-------------------------------

RegisterNetEvent('evidence:general')
AddEventHandler('evidence:general', function()
	local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "police") then
		TriggerEvent("server-inventory-open", "1", "trash-1")
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'LockerOpen', 0.4)
		Wait(1000)
	end
end)

RegisterNetEvent('personallocker:general')
AddEventHandler('personallocker:general', function()
	local cid = exports["plutorp_manager"]:isPed("cid")
	local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "police") then
		TriggerEvent("server-inventory-open", "1", "personalMRPD-"..cid)
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'LockerOpen', 0.4)
		Wait(1000)
	end
end)

RegisterNetEvent('pmeth:general')
AddEventHandler('pmeth:general', function()
	local finished = exports["plutorp-taskbar"]:taskBar(60000,"Searching")
	if (finished == 100) then
		TriggerEvent("server-inventory-open", "25", "Shop")
		Wait(1000)
	end
end)

RegisterNetEvent('prisonap:general')
AddEventHandler('prisonap:general', function()
	local finished = exports["plutorp-taskbar"]:taskBar(60000,"Searching")
	if (finished == 100) then
	  	TriggerEvent("server-inventory-open", "26", "Shop");
	  	Wait(1000)
  	end
end)


RegisterNetEvent('prisonlp:general')
AddEventHandler('prisonlp:general', function()
	ExecuteCommand("e search")
	local finished = exports["plutorp-taskbar"]:taskBar(30000,"Searching Shelf")
	if (finished == 100) then
	  	TriggerEvent("server-inventory-open", "921", "Shop");
	  	Wait(1000)
		ExecuteCommand("e c")
	else
		ExecuteCommand("e c")
	end
end)

RegisterNetEvent('slushy:general')
AddEventHandler('slushy:general', function()
	FreezeEntityPosition(GetPlayerPed(-1),true)
	local finished = exports["plutorp-taskbar"]:taskBar(30000,"Making a slushy")
	if (finished == 100) then
		FreezeEntityPosition(GetPlayerPed(-1),false)
		TriggerEvent("server-inventory-open", "998", "Shop")
		Wait(1000)
	else
		FreezeEntityPosition(GetPlayerPed(-1),false)
	end
end)

-- RegisterNetEvent('lockpickshit:general')
-- AddEventHandler('lockpickshit:general', function()
-- 	local finished = exports["plutorp-taskbar"]:taskBar(60000,"What dis????")
-- 	if (finished == 100) then
-- 		TriggerEvent("server-inventory-open", "205", "Shop")
-- 		Wait(1000)
-- 	end
-- end)

RegisterNetEvent('pfood:general')
AddEventHandler('pfood:general', function()
	TriggerEvent("server-inventory-open", "22", "Shop")
	Wait(1000)
end)

RegisterNetEvent('bestbuds:shop')
AddEventHandler('bestbuds:shop', function()
	TriggerEvent("server-inventory-open", "99", "Shop")
	Wait(1000)
end)

RegisterNetEvent('autoexotics:bar')
AddEventHandler('autoexotics:bar', function()
	TriggerEvent("server-inventory-open", "101", "Shop")
	Wait(1000)
end)

RegisterNetEvent('autoexotics:food')
AddEventHandler('autoexotics:food', function()
	TriggerEvent("server-inventory-open", "102", "Shop")
	Wait(1000)
end)

RegisterNetEvent('pnpc:general')
AddEventHandler('pnpc:general', function()
	TriggerEvent("server-inventory-open", "997", "Craft")
	Wait(1000)
end)

RegisterNetEvent('recycle:trade')
AddEventHandler('recycle:trade', function()
	TriggerEvent("server-inventory-open", "103", "Craft")
	Wait(1000)
end)

RegisterNetEvent('ems:general')
AddEventHandler('ems:general', function()
	local job = exports["plutorp_manager"]:isPed("myJob")
	if (job == "ems" or job == "doctor") then
		TriggerEvent("server-inventory-open", "15", "Shop");	
	else
		TriggerEvent("DoLongHudText", "You aint a EMS, bounce out!", 2)
	end
end)

RegisterNetEvent('weapon:general')
AddEventHandler('weapon:general', function()
	local weaponslicence = exports["plutorp_manager"]:isPed("weaponslicence")
	if weaponslicence ~= 0 then
		TriggerEvent("server-inventory-open", "5", "Shop");
		Wait(1000)
	else
		TriggerEvent("server-inventory-open", "5", "Shop");
		Wait(1000)
		-- TriggerEvent("DoLongHudText", "You dont have an active firearms license, contact the police.", 2) -- Removed for now [Evan]
	end
end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

Citizen.CreateThread(function()
	setShopBlip()
end)

-- Blips

local shops = {
    { 1961.1140136719, 3741.4494628906, 32.34375 },
	{ 1392.4129638672, 3604.47265625, 34.980926513672 },
	{ 546.98962402344, 2670.3176269531, 42.156539916992 },
	{ 2556.2534179688, 382.876953125, 108.62294769287 },
	{ -1821.9542236328, 792.40191650391, 138.13920593262 },
	{ -1223.6690673828, -906.67517089844, 12.326356887817 },
	{ -708.19256591797, -914.65264892578, 19.215591430664 },
	{ 26.419162750244, -1347.5804443359, 29.497024536133 },
	{ -47.64859, -1757.004, 29.421 },
	{ -707.394, -910.114, 19.2156 },
	{ 1162.87, -319.218, 69.2051 },
	{ 373.872, 331.028, 103.566 },
	{ 2552.47, 381.031, 108.623 },
	{ -1823.67, 796.291, 138.126 },
	{ 2673.91, 3281.77, 55.2411 },
	{ 1957.64, 3744.29, 32.3438 },
	{ 1701.97, 4921.81, 42.0637 },
	{ 1730.06, 6419.63, 35.0372 },
	{ 1842.973, 2570.243, 46.02 },
	{ 460.2752, -982.3342, 30.68969 },
	{ 5195.495, -5136.117, 3.349587 },
}

local showshops = true

RegisterNetEvent('shops:showshops')
AddEventHandler('shops:showshops', function()
    showshops = not showshops
   for _, item in pairs(shops) do
        if not showshops then
            if item.blip ~= nil then
                RemoveBlip(item.blip)
            end
        else
            item.blip = AddBlipForCoord(item[1], item[2], item[3])
            SetBlipSprite(item.blip, 52)
            SetBlipScale(item.blip, 0.5)
			SetBlipColour(item.blip, 2)
            SetBlipAsShortRange(item.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Shop")
            EndTextCommandSetBlipName(item.blip)
        end
    end
end)

Citizen.CreateThread(function()
    showshops = false
    TriggerEvent('shops:showshops')
end) 


-- pillbox shit

RegisterNetEvent("pillboxmenu")
AddEventHandler("pillboxmenu", function()
	TriggerEvent('plutorp-context:sendMenu', {
		{
			id = "1",
			header = "Stun gun",
			txt = "Get yourself a stun gun",
			params = {
				event = "pillbox:stungun",
			}
		},
		{
			id = "2",
			header = "ifak",
			txt = "Grab some ifaks",
			params = {
				event = "pillbox:ifak",
			}
		},
		{
			id = "3",
			header = "painkillers",
			txt = "Get some painkillers",
			params = {
				event = "pillbox:painkiller",
			}
		},
		{
			id = "4",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)

RegisterNetEvent('pillbox:stungun')
AddEventHandler('pillbox:stungun', function()
	if exports["plutorp-inventory"]:hasEnoughOfItem('911657153',1,true) then 
		TriggerEvent("DoLongHudText", "You already have a stun gun!", 2)
	else
		TriggerEvent("player:receiveItem", "911657153", 1)
	end
end)

RegisterNetEvent('pillbox:ifak')
AddEventHandler('pillbox:ifak', function()
	if exports["plutorp-inventory"]:hasEnoughOfItem('IFAK',5,true) then 
		TriggerEvent("DoLongHudText", "You already have ifaks!", 2)
	else
		TriggerEvent("player:receiveItem", "IFAK", 5)
	end --
end)

RegisterNetEvent('pillbox:painkiller')
AddEventHandler('pillbox:painkiller', function()
	if exports["plutorp-inventory"]:hasEnoughOfItem('painkiller',15,true) then 
		TriggerEvent("DoLongHudText", "You already have painkillers!", 2)
	else
		TriggerEvent("player:receiveItem", "painkiller", 15)
	end
end)