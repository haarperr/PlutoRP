local ongoing = false
local cooking = false
local packing = false
local scaling = false

RegisterNetEvent("meth:start")
AddEventHandler("meth:start", function()
	local playerped = PlayerPedId()
	local plyCoords = GetEntityCoords(PlayerPedId())
	local distance = (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 1005.694152832, -3201.3181152344, -38.84700012207, false))		
	if exports["plutorp-inventory"]:hasEnoughOfItem("acetone",5,false) and exports["plutorp-inventory"]:hasEnoughOfItem("sudafed",2,false) and exports["plutorp-inventory"]:hasEnoughOfItem("antifreeze",3,false) and ongoing == false then
		Cooking()
		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityHeading(PlayerPedId(), 179.97245788574)
		local finished = exports["plutorp-taskbar"]:taskBar(115000,"Mixing Something Nice!")
		if (finished == 100) then
			FreezeEntityPosition(PlayerPedId(),false)
			TriggerEvent("inventory:removeItem","acetone", 5)
			TriggerEvent("inventory:removeItem","sudafed", 2)
			TriggerEvent("inventory:removeItem","antifreeze", 3)
			ongoing = true
			cooking = true
			if cooking == true then
				TriggerEvent("DoLongHudText", "You Successfully Cooked!")
				TriggerEvent("player:receiveItem","methraw",math.random(1,5))
				ongoing = false
				cooking = false
			elseif cooking == false then
				TriggerEvent("DoLongHudText", "Failed!")
			end
		end
	end
end)

RegisterNetEvent("meth:packing")
AddEventHandler("meth:packing", function()
	local playerped = PlayerPedId()
	local plyCoords = GetEntityCoords(PlayerPedId())
	local distance = (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 1016.3265991211, -3194.9626464844, -38.993156433105, false))	
	if exports["plutorp-inventory"]:hasEnoughOfItem("methraw",5,false) and ongoing == false then
		Packing()
		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityHeading(PlayerPedId(), 359.97235107422)
		local finished = exports["plutorp-taskbar"]:taskBar(30000,"Breaking Meth!")
		if (finished == 100) then
			FreezeEntityPosition(PlayerPedId(),false)
			TriggerEvent("inventory:removeItem","methraw", 5)
			ongoing = true
			packing = true
			if packing == true then
				TriggerEvent("DoLongHudText", "You Received Them Good Good.")
				TriggerEvent("player:receiveItem","methbrick", 1)
				ongoing = false
				packing = false
			elseif packing == false then
				TriggerEvent("DoLongHudText", "Failed!", 2)
			end
		end
	end
end)

RegisterNetEvent("meth:finish")
AddEventHandler("meth:finish", function()
	local playerped = PlayerPedId()
	local plyCoords = GetEntityCoords(PlayerPedId())
	local distance = (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 1012.0330200195, -3194.8596191406, -38.99312210083, false))	
	if exports["plutorp-inventory"]:hasEnoughOfItem("methbrick",2,false) and exports["plutorp-inventory"]:hasEnoughOfItem("drugbaggy",1,false) and ongoing == false then
		Scaling()
		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityHeading(PlayerPedId(), 1.2570070028305)
		local finished = exports["plutorp-taskbar"]:taskBar(32000,"Packing Crystals!")
		if (finished == 100) then
			FreezeEntityPosition(PlayerPedId(),false)
			TriggerEvent("inventory:removeItem","methbrick", 2)
			TriggerEvent("inventory:removeItem","drugbaggy", 1)
			ongoing = true
			scaling = true
			if scaling == true then
				TriggerEvent("DoLongHudText", "You Successfully Packed!")
				TriggerEvent("player:receiveItem","1gmeth",math.random(1,3))
				ongoing = false
				scaling = false
			elseif scaling == false then
				TriggerEvent("DoLongHudText", "Failed!", 2)
			end
		end
	end

end)

RegisterNetEvent('animation:load')
AddEventHandler('animation:load', function(dict)
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end)

RegisterNetEvent('animation:meth')
AddEventHandler('animation:meth', function()
	inanimation = true
	local lPed = GetPlayerPed(-1)
	RequestAnimDict("mini@repair")
	while not HasAnimDictLoaded("mini@repair") do
		Citizen.Wait(0)
	end

	if IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
		ClearPedSecondaryTask(lPed)
	else
		TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 49, 0, 0, 0, 0)
		seccount = 4
		while seccount > 0 do
			Citizen.Wait(10000)
			FreezeEntityPosition(PlayerPedId(),false)
			seccount = seccount - 1
		end
		ClearPedSecondaryTask(lPed)
	end		
	inanimation = false
end)

RegisterNetEvent("meth:sell")
AddEventHandler("meth:sell", function()
	if exports["plutorp-inventory"]:hasEnoughOfItem("1gmeth",1,false) then
		LoadDict('mp_safehouselost@')
		TaskPlayAnim(GetPlayerPed(-1), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
		local finished = exports["plutorp-taskbar"]:taskBar(3000,"Handing Over Something")
		if (finished == 100) then
			local meth = math.random(120, 160)
			TriggerServerEvent("meth:givemoney", meth)
			TriggerEvent("inventory:removeItem","1gmeth", 1)
			TriggerEvent("player:receiveItem","rollcash",math.random(5,10))
			TriggerEvent("DoLongHudText", "Thanks Man, Heres a lil something for that.")
			Citizen.Wait(5000)
		end
	else
	 TriggerEvent('DoLongHudText', "You need something!!", 2)
	end
end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

function DaBabyBoom()
	local ped = PlayerPedId()
    local coords = vector3(1005.694152832, -3201.3181152344, -38.84700012207)
	local coords2 = vector3(1009.1714477539, -3198.2309570312, -39.580497741699)
	RequestWeaponAsset(GetHashKey("WEAPON_RPG")) 
    while not HasWeaponAssetLoaded(GetHashKey("WEAPON_RPG")) do
        Wait(0)
    end
	ShootSingleBulletBetweenCoords( 
		coords.x,
        coords.y,
        coords.z, 
	    coords.x,
        coords.y,
        coords.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
	ShootSingleBulletBetweenCoords( 
		coords2.x,
        coords2.y,
        coords2.z, 
	    coords2.x,
        coords2.y,
        coords2.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
	while true do 
		Citizen.Wait(5)
		StopFireInRange(coords.x,coords.y,coords.z, 300.0)
	end
end

RegisterNetEvent("stopcooking")
AddEventHandler("stopcooking", function()
	if cooking == true then
		TriggerEvent("DoLongHudText", "Failed, You Left The Meth Lab To Early!")
		cooking = false
		ongoing = false
	end
end)

function Cooking()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			local ped = PlayerPedId()
            local targetRotation = vec3(180.0, 180.0, 180.0)
            local x,y,z = table.unpack(vec3(1005.7637939453, -3200.3767089844, -38.519256591797))

			local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
    
            RequestAnimDict(animDict)
            RequestModel("bkr_prop_meth_ammonia")
            RequestModel("bkr_prop_meth_sacid")
            RequestModel("bkr_prop_fakeid_clipboard_01a")
            RequestModel("bkr_prop_fakeid_penclipboard")
    
            while not HasAnimDictLoaded(animDict) and
                not HasModelLoaded("bkr_prop_meth_ammonia") and 
                not HasModelLoaded("bkr_prop_meth_sacid") and 
                not HasModelLoaded("bkr_prop_fakeid_clipboard_01a") and
                not HasModelLoaded("bkr_prop_fakeid_penclipboard") do 
                Citizen.Wait(100)
            end

            ammonia = CreateObject(GetHashKey('bkr_prop_meth_ammonia'), x, y, z, 1, 0, 1)
            acido = CreateObject(GetHashKey('bkr_prop_meth_sacid'), x, y, z, 1, 0, 1)
            caderneta = CreateObject(GetHashKey('bkr_prop_fakeid_clipboard_01a'), x, y, z, 1, 0, 1)
            caneta = CreateObject(GetHashKey('bkr_prop_fakeid_penclipboard'), x, y, z, 1, 0, 1)   


            local netScene = NetworkCreateSynchronisedScene(x + 5.0 ,y + 2.0, z - 0.4, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            local netScene2 = NetworkCreateSynchronisedScene(x + 5.0 ,y + 2.0, z - 0.4, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "chemical_pour_long_cooker", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(ammonia, netScene, animDict, "chemical_pour_long_ammonia", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(acido, netScene, animDict, "chemical_pour_long_sacid", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(caderneta, netScene, animDict, "chemical_pour_long_clipboard", 4.0, -8.0, 1)
            NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "chemical_pour_long_cooker", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(caneta, netScene2, animDict, "chemical_pour_long_pencil", 4.0, -8.0, 1)
			
			Citizen.Wait(150)
            NetworkStartSynchronisedScene(netScene)
            NetworkStartSynchronisedScene(netScene2)

			Citizen.Wait(GetAnimDuration(animDict, "chemical_pour_long_cooker") * 770)
            DeleteObject(ammonia)
            DeleteObject(acido)
            DeleteObject(caderneta)
			DeleteObject(caneta)
			processo = false
			break    
		end
	end)
end


function Scaling()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			local ped = PlayerPedId()
			local  targetRotation = vec3(180.0, 180.0, 168.0)
			local x,y,z = table.unpack(vec3(1012.1636962891, -3195.181640625, -38.99312210083))    

			local animDict = "anim@amb@business@meth@meth_smash_weight_check@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_meth_scoop_01a")
			RequestModel("bkr_prop_meth_bigbag_03a")
			RequestModel("bkr_prop_meth_bigbag_04a")
			RequestModel("bkr_prop_fakeid_penclipboard")
			RequestModel("bkr_prop_fakeid_clipboard_01a")
			RequestModel("bkr_prop_meth_openbag_02")
			RequestModel("bkr_prop_coke_scale_01")
			RequestModel("bkr_prop_meth_smallbag_01a")
			RequestModel("bkr_prop_meth_openbag_01a")
			RequestModel("bkr_prop_fakeid_penclipboard")

			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_meth_scoop_01a") and 
				not HasModelLoaded("bkr_prop_meth_bigbag_03a") and 
				not HasModelLoaded("bkr_prop_meth_bigbag_04a") and
				not HasModelLoaded("bkr_prop_meth_openbag_02") and 
				not HasModelLoaded("bkr_prop_coke_scale_01") and 
				not HasModelLoaded("bkr_prop_meth_smallbag_01a") and 
				not HasModelLoaded("bkr_prop_meth_openbag_01a") and 
				not HasModelLoaded("bkr_prop_fakeid_clipboard_01a") and
				not HasModelLoaded("bkr_prop_fakeid_penclipboard") do 
				Citizen.Wait(100)
			end

			pazinha = CreateObject(GetHashKey('bkr_prop_meth_scoop_01a'), x, y, z, 1, 0, 1)
			caixa_grande = CreateObject(GetHashKey('bkr_prop_meth_bigbag_03a'), x, y, z, 1, 0, 1)
			caixa_grande_2 = CreateObject(GetHashKey('bkr_prop_meth_bigbag_04a'), x, y, z, 1, 0, 1)
			bolsa = CreateObject(GetHashKey('bkr_prop_meth_openbag_02'), x, y, z, 1, 0, 1)
			bolsa_fechada = CreateObject(GetHashKey('bkr_prop_meth_smallbag_01a'), x, y, z, 1, 0, 1)
			bolsa_aberta = CreateObject(GetHashKey('bkr_prop_meth_openbag_01a'), x, y, z, 1, 0, 1)
			balanca = CreateObject(GetHashKey('bkr_prop_coke_scale_01'), x, y, z, 1, 0, 1)
			caderneta = CreateObject(GetHashKey('bkr_prop_fakeid_clipboard_01a'), x, y, z, 1, 0, 1)
			caneta = CreateObject(GetHashKey('bkr_prop_fakeid_penclipboard'), x, y, z, 1, 0, 1)


			local netScene = NetworkCreateSynchronisedScene(x - 5.3,y - 0.4, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene2 = NetworkCreateSynchronisedScene(x - 5.3 ,y - 0.4, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene3 = NetworkCreateSynchronisedScene(x - 5.3 ,y - 0.4, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "break_weigh_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(pazinha, netScene, animDict, "break_weigh_scoop", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa_grande_2, netScene, animDict, "break_weigh_box01", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(bolsa, netScene, animDict, "break_weigh_methbag01^3", 4.0, -8.0, 1)

			NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "break_weigh_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(balanca, netScene2, animDict, "break_weigh_scale", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa_grande, netScene2, animDict, "break_weigh_box01^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(bolsa_fechada, netScene2, animDict, "break_weigh_methbag01^2", 4.0, -8.0, 1)

			NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "break_weigh_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bolsa_aberta, netScene3, animDict, "break_weigh_methbag01^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caderneta, netScene3, animDict, "break_weigh_clipboard", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caneta, netScene3, animDict, "break_weigh_pen", 4.0, -8.0, 1)
			
			NetworkStartSynchronisedScene(netScene)
			NetworkStartSynchronisedScene(netScene2)
			NetworkStartSynchronisedScene(netScene3)


			
			Citizen.Wait(GetAnimDuration(animDict, "break_weigh_char01") * 770)

			DeleteObject(pazinha)
			DeleteObject(caixa_grande)
			DeleteObject(caixa_grande_2)
			DeleteObject(bolsa)
			DeleteObject(bolsa_fechada)
			DeleteObject(bolsa_aberta)
			DeleteObject(balanca)
			DeleteObject(caderneta)
			DeleteObject(caneta)
			processo = false
			break
		end
	end)
end

function Packing()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			local ped = PlayerPedId() 
			local  targetRotation = vec3(180.0, 180.0, 168.0)
			local x,y,z = table.unpack(vec3(1016.3265991211, -3194.9626464844, -38.993156433105))

			local animDict = "anim@amb@business@meth@meth_smash_weight_check@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_meth_tray_02a")
			RequestModel("w_me_hammer")
			RequestModel("bkr_prop_meth_tray_01a")
			RequestModel("bkr_prop_meth_smashedtray_01")
			RequestModel("bkr_prop_meth_smashedtray_01_frag_")
			RequestModel("bkr_prop_meth_bigbag_02a")

			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_meth_tray_02a") and 
				not HasModelLoaded("bkr_prop_fakeid_penclipboard") and 
				not HasModelLoaded("w_me_hammer") and 
				not HasModelLoaded("bkr_prop_meth_tray_01a") and 
				not HasModelLoaded("bkr_prop_meth_smashedtray_01") and 
				not HasModelLoaded("bkr_prop_meth_smashedtray_01_frag_") and 
				not HasModelLoaded("bkr_prop_meth_bigbag_02a") do 
				Citizen.Wait(100)
			end

			forma = CreateObject(GetHashKey('bkr_prop_meth_tray_02a'), x, y, z, 1, 0, 1)
			forma_2 = CreateObject(GetHashKey('bkr_prop_meth_tray_01a'), x, y, z, 1, 0, 1)
			forma_quebrada = CreateObject(GetHashKey('bkr_prop_meth_smashedtray_01'), x, y, z, 1, 0, 1)
			forma_quebrada_2 = CreateObject(GetHashKey('bkr_prop_meth_smashedtray_01_frag_'), x, y, z, 1, 0, 1)
			martelo = CreateObject(GetHashKey('w_me_hammer'), x, y, z, 1, 0, 1)
			caixa = CreateObject(GetHashKey('bkr_prop_meth_bigbag_02a'), x, y, z, 1, 0, 1)




			local netScene = NetworkCreateSynchronisedScene(x - 3.6,y - 1.0, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene2 = NetworkCreateSynchronisedScene(x - 3.6,y - 1.0, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "break_weigh_char02", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(forma_quebrada, netScene, animDict, "break_weigh_tray01", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(forma_2, netScene, animDict, "break_weigh_tray01^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(martelo, netScene, animDict, "break_weigh_hammer", 4.0, -8.0, 1)

			NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "break_weigh_char02", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(forma, netScene2, animDict, "break_weigh_tray01^2", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(forma_quebrada_2, netScene2, animDict, "break_weigh_tray01", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa, netScene2, animDict, "break_weigh_box01^1", 4.0, -8.0, 1)
			
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)
			NetworkStartSynchronisedScene(netScene2)


			
			Citizen.Wait(GetAnimDuration(animDict, "break_weigh_char02") * 770)
			DeleteObject(forma)
			DeleteObject(forma_2)
			DeleteObject(forma_quebrada)
			DeleteObject(forma_quebrada_2)
			DeleteObject(martelo)
			DeleteObject(caixa)
			processo = false
			break
		end
	end)
end