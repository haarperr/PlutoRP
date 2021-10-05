function anim2() -- Animation
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(882.1660, -2258.35, 32.461, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 882.1660, -2258.35, 32.461,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("plutorp-particleserver", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
    TriggerEvent("plutorp-firstdoors")
end

function anim() -- Animation
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(880.4080, -2264.50, 32.441, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 880.4080, -2264.50, 32.441,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("plutorp-particleserversec", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
	TriggerEvent("plutorp-seconddoor")
end

RegisterNetEvent('plutorp-firstdoor')
AddEventHandler('plutorp-firstdoor', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(882.17126464844, -2258.1179199219, 32.461284637451) - player)
    if distance < 1.5 then
        if exports["plutorp_manager"]:isPed("countpolice") >= 0 then
        Wait(1)
            if exports["plutorp-inventory"]:hasEnoughOfItem("thermalcharge",1,false) then
                FreezeEntityPosition(PlayerPedId(),true)
                local bobcat = exports["plutorp-taskbar"]:taskBar(9000,"Preparing For Hack")
                if bobcat == 100 then
                    FreezeEntityPosition(PlayerPedId(),false)
                    Wait(1000)
                    exports["plutorp-memorygame"]:thermiteminigame(10, 3, 3, 10,
                    function() -- Success
                        TriggerEvent("plutorp-firstdoortrigger")
                        TriggerEvent("inventory:removeItem","thermalcharge",1)
                        TriggerEvent('DoLongHudText', 'Well done dumbass please cry more!', 2)
                    end,
                    function() -- failure
                        TriggerEvent('DoLongHudText', 'You failed!', 2)
                        TriggerEvent("inventory:removeItem","thermalcharge",1)
                        end)
                    TriggerEvent('plutorp:alert:bobcat')
                end
            end
        end
    end
end)

RegisterNetEvent('plutorp-secondoor')
AddEventHandler('plutorp-secondoor', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(880.97222900391, -2264.2229003906, 32.441696166992) - player)
    if distance < 1.5 then
        if exports["plutorp_manager"]:isPed("countpolice") >= 0 then
        Wait(1)
            if exports["plutorp-inventory"]:hasEnoughOfItem("thermalcharge",1,false) then
                FreezeEntityPosition(PlayerPedId(),true)
                local bobcat = exports["plutorp-taskbar"]:taskBar(9000,"Preparing")
                if bobcat == 100 then
                    FreezeEntityPosition(PlayerPedId(),false)
                    Wait(1000)
                    exports["plutorp-memorygame"]:thermiteminigame(10, 3, 3, 10,
                    function() 
                        TriggerEvent("plutorp-seconddoorshit")
                        TriggerEvent("inventory:removeItem","thermalcharge",1)
                    end,
                    function() -- failure
                        TriggerEvent('DoLongHudText', 'Failed !', 2)
                        TriggerEvent("inventory:removeItem","thermalcharge",1)
                    end)
                    TriggerEvent('plutorp:alert:bobcat')
                end
            end
        end
    end
end)

RegisterNetEvent('plutorp-thirddoor')
AddEventHandler('plutorp-thirddoor', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(883.07379150391, -2267.9689941406, 32.441661834717) - player)
    if distance < 1.5 then
        if exports["plutorp_manager"]:isPed("countpolice") >= 0 then
        Wait(1)
            if exports["plutorp-inventory"]:hasEnoughOfItem("BobCatCard",1,false) then
                FreezeEntityPosition(PlayerPedId(),true)
                local bobcat = exports["plutorp-taskbar"]:taskBar(9000,"Unlocking Doors")
                if bobcat == 100 then
                    TriggerEvent('plutorp-3rddoor')
                    TriggerEvent('inventory:removeItem', 'BobCatCard', 1)
                    FreezeEntityPosition(PlayerPedId(),false)
                    TriggerEvent('plutorp:alert:bobcat')
                end
            end
        end
    end
end)

RegisterNetEvent("plutorp-ptfxparticle")
AddEventHandler("plutorp-ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(882.1320, -2257.34, 32.461)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("seks")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("plutorp-ptfxparticlesec")
AddEventHandler("plutorp-ptfxparticlesec", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 32.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("seks")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('plutorp-seconddoorshit')
AddEventHandler('plutorp-seconddoorshit', function()
	anim()
    TriggerEvent("plutorp-seconddoor")
end)

RegisterNetEvent('plutorp-firstdoortrigger')
AddEventHandler('plutorp-firstdoortrigger', function()
	anim2()
	Citizen.Wait(3500)
    TriggerEvent("plutorp-firstdoor")
end)

RegisterNetEvent('plutorp-firstdoors') -- Doors
AddEventHandler('plutorp-firstdoors', function()
    TriggerServerEvent("plutorp-doors:changeLock-status", 186, false) -- First Doors
    TriggerServerEvent("plutorp-doors:changeLock-status", 187, false) -- First Doors
end)

RegisterNetEvent('plutorp-seconddoor') -- Doors
AddEventHandler('plutorp-seconddoor', function()
    TriggerServerEvent("plutorp-doors:changeLock-status", 188, false) -- 2nd Door
    TriggerEvent('plutorp-bobcatcreateped')
end)

RegisterNetEvent('plutorp-3rddoor') -- Doors
AddEventHandler('plutorp-3rddoor', function()
    TriggerServerEvent("plutorp-doors:changeLock-status", 190, false) -- 3rd Door
    TriggerServerEvent("plutorp-doors:changeLock-status", 189, false) -- 2nd Door
    TriggerEvent('plutorp-bobcatcreateped')
end)


RegisterNetEvent('plutorp-propcreatle') -- Prop
AddEventHandler('plutorp-propcreatle', function()
    TriggerEvent("plutorp-propcreate")
end)

RegisterNetEvent('plutorp-propcreate')
AddEventHandler('plutorp-propcreate', function()
    local weaponbox = CreateObject(GetHashKey("ex_prop_crate_ammo_sc"), 888.0774, -2287.33, 31.441, true,  true, true)
    CreateObject(weaponbox)
    SetEntityHeading(weaponbox, 176.02)
    FreezeEntityPosition(weaponbox, true)

    local weaponbox2 = CreateObject(GetHashKey("ex_prop_crate_expl_sc"), 886.8, -2281.7, 31.441, true,  true, true)
    CreateObject(weaponbox2)
    SetEntityHeading(weaponbox2, 352.02)
    FreezeEntityPosition(weaponbox2, true) 

    local weaponbox3 = CreateObject(GetHashKey("ex_prop_crate_expl_bc"), 882.1840, -2286.8, 31.441, true,  true, true)
    CreateObject(weaponbox3)
    SetEntityHeading(weaponbox3, 158.02)
    FreezeEntityPosition(weaponbox3, true) 

    local weaponbox4 = CreateObject(GetHashKey("ex_prop_crate_ammo_bc"), 881.4557, -2282.61, 31.441, true,  true, true)
    CreateObject(weaponbox4)
    SetEntityHeading(weaponbox4, 52.02)
    FreezeEntityPosition(weaponbox4, true)
end)


RegisterNetEvent('plutorp-bobcatcreateped')
AddEventHandler('plutorp-bobcatcreateped', function()
	local bobcatped2 = GetHashKey('csb_mweather')
	AddRelationshipGroup('efe')

		RequestModel(1456041926)
		bobcatped1 = CreatePed(30, 883.4797, -2273.77, 32.441, 30.568, 88.00, true, false)
		SetPedArmour(bobcatped1, 500)
		SetPedAsEnemy(bobcatped1, true)
		SetPedRelationshipGroupHash(bobcatped1, 'efe')
		GiveWeaponToPed(bobcatped1, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped1, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped1, 100)
		SetPedDropsWeaponsWhenDead(bobcatped1, false)
		
		bobcatped2 = CreatePed(30, 1456041926, 892.4030, -2275.25, 32.441, 360.00, true, false)
		SetPedArmour(bobcatped2, 500)
		SetPedAsEnemy(bobcatped2, true)
		SetPedRelationshipGroupHash(bobcatped2, 'efe')
		GiveWeaponToPed(bobcatped2, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped2, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped2, 100)
		SetPedDropsWeaponsWhenDead(bobcatped2, false)

		bobcatped3 = CreatePed(30, 1456041926, 892.6776, -2281.26, 32.441, 350.00, true, false)
		SetPedArmour(bobcatped3, 500)
		SetPedAsEnemy(bobcatped3, true)
		SetPedRelationshipGroupHash(bobcatped3, 'efe')
		GiveWeaponToPed(bobcatped3, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped3, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped3, 100)
		SetPedDropsWeaponsWhenDead(bobcatped3, false)

		bobcatped4 = CreatePed(30, 1456041926, 889.3485, -2292.47, 32.441, 350.00, true, false)
		SetPedArmour(bobcatped4, 500)
		SetPedAsEnemy(bobcatped4, true)
		SetPedRelationshipGroupHash(bobcatped4, 'efe')
		GiveWeaponToPed(bobcatped4, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped4, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped4, 100)
		SetPedDropsWeaponsWhenDead(bobcatped4, false)

		bobcatped5 = CreatePed(30, 1456041926, 880.9854, -2293.40, 32.441, 300.00, true, false)
		SetPedArmour(bobcatped5, 500)
		SetPedAsEnemy(bobcatped5, true)
		SetPedRelationshipGroupHash(bobcatped5, 'efe')
		GiveWeaponToPed(bobcatped5, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped5, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped5, 100)
		SetPedDropsWeaponsWhenDead(bobcatped5, false)


		bobcatped6 = CreatePed(30, 1456041926, 873.4896, -2293.21, 32.441, 266.00, true, false)
		SetPedArmour(bobcatped6, 500)
		SetPedAsEnemy(bobcatped6, true)
		SetPedRelationshipGroupHash(bobcatped6, 'efe')
		GiveWeaponToPed(bobcatped6, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped6, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped6, 100)
		SetPedDropsWeaponsWhenDead(bobcatped6, false)

		bobcatped7 = CreatePed(30, 1456041926,894.1248, -2287.51, 32.446, 298.00, true, false)
		SetPedArmour(bobcatped7, 500)
		SetPedAsEnemy(bobcatped7, true)
		SetPedRelationshipGroupHash(bobcatped7, 'efe')
		GiveWeaponToPed(bobcatped7, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped7, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped7, 100)
		SetPedDropsWeaponsWhenDead(bobcatped7, false)

		bobcatped8 = CreatePed(30, 1456041926, 896.9407, -2280.87, 32.441, 266.00, true, false)
		SetPedArmour(bobcatped8, 500)
		SetPedAsEnemy(bobcatped8, true)
		SetPedRelationshipGroupHash(bobcatped8, 'efe')
		GiveWeaponToPed(bobcatped8, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped8, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped8, 100)
		SetPedDropsWeaponsWhenDead(bobcatped8, false)
end)

RegisterNetEvent('plutorp-ped')
AddEventHandler('plutorp-ped', function()
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_broken")
	RemoveIpl(interiorid, "np_prolog_broken")
	DeactivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)
end)

	
Citizen.CreateThread(function()
    local hash = GetHashKey("ig_casey")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
end
    rehineped = CreatePed("PED_TYPE_CIVFEMALE", "ig_casey", 870.1760, -2288.20, 31.441, 175.21, false, false)
    SetBlockingOfNonTemporaryEvents(rehineped, true)
            SetPedDiesWhenInjured(rehineped, false)
            SetPedCanPlayAmbientAnims(rehineped, true)
            SetPedCanRagdollFromPlayerImpact(rehineped, false)
            FreezeEntityPosition(rehineped, true)
			SetEntityInvincible(rehineped, true)
	        RequestAnimDict('random@arrests@busted', function()
        TaskPlayAnim(rehineped, 'random@arrests@busted', 'idle_a', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
	end)
end)

RegisterNetEvent('plutorp-pedwalk2') -- PED WALK
AddEventHandler('plutorp-pedwalk2', function()
    FreezeEntityPosition(rehineped, false)
    SetEntityInvincible(rehineped, false)
	ClearPedTasks(rehineped)
	TaskGoStraightToCoord(rehineped, 869.2078, -2292.60, 32.441, 150.0, -1, 265.61, 0)
	Citizen.Wait(5000)
	TaskGoStraightToCoord(rehineped, 893.3309, -2294.90, 32.441, 150.0, -1, 350.61, 0)
	Citizen.Wait(13000)
	TriggerServerEvent("plutorp-pedwalk")
end)

RegisterNetEvent('plutorp-gunman') -- Collect Shit
AddEventHandler('plutorp-gunman', function()
    TriggerEvent( "player:receiveItem", "1593441988", 1 )
    TriggerEvent( "player:receiveItem", "-771403250", 1 )
    TriggerEvent( "player:receiveItem", "-1746263880", 1 )
end)



RegisterNetEvent('plutorp-pedwalk') -- PED WALK
AddEventHandler('plutorp-pedwalk', function()
	TaskGoStraightToCoord(rehineped, 894.6337, -2284.97, 32.441, 150.0, -1, 82.56, 0)
	Citizen.Wait(7500)
	    RequestAnimDict('weapons@projectile@grenade_str', function()
        TaskPlayAnim(rehineped, 'weapons@projectile@grenade_str', 'throw_h_fb_backward', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
    end)
	Citizen.Wait(1000)
	AddExplosion(890.7849, -2284.88, 32.441, 32, 150000.0, true, false, 4.0)
	AddExplosion(894.0084, -2284.90, 32.580, 32, 150000.0, true, false, 4.0)
    TriggerServerEvent("plutorp-ped")
    TriggerEvent("plutorp-propcreate")
end)
	
    exports["plutorp-target"]:AddCircleZone("kapipatlat", vector3(870.4505, -2288.83, 32.441), 1.0, {
        name ="kapipatlat",
        useZ = true,
        --debugPoly=true
        }, {
            options = {
                {
                    event = "plutorp-pedwalk2",
                    icon = "fas fa-bomb",
                    label = "Blow the Door !",
                },
             },
             job = {"all"},
            distance = 2.1
        })

        exports["plutorp-target"]:AddCircleZone("kanksmankscankssilahlariver", vector3(883.0063, -2283.38, 32.441), 1.0, {
            name ="kanksmankscankssilahlariver",
            useZ = true,
            --debugPoly=true
            }, {
                options = {
                    {
                        event = "plutorp-gunman",
                        icon = "fas fa-box",
                        label = "Grab Weapons !",
                    },
                 },
                 job = {"all"},
                distance = 2.1
            })