RegisterNetEvent('sunrise:FinishMoneyCheckForVeh')
RegisterNetEvent('sunrise:vehshop:spawnVehicle')
local vehshop_blips = {}
local financedPlates = {}
local FullBuyPlates = {}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false
local vehicle_price = 0
local backlock = false
local firstspawn = 0
local commissionbuy = 0
local insideVehShop = false
local rank = 0

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


local currentCarSpawnLocation = 0
local ownerMenu = false

local vehshopDefault = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 250, type = 1 },
	menu = {
		x = 0.14,
		y = 0.15,
		width = 0.12,
		height = 0.03,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.29,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
				{name = "Cycles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "Job Vehicles", description = ''},
			}
		},
		["jobvehicles"] = {
			title = "job vehicles",
			name = "job vehicles",
			buttons = {
				{name = "Taxi Cab", costs = 2500, description = {}, model = "taxi"},
				{name = "Flat Bed", costs = 2500, description = {}, model = "flatbed"},
				{name = "News Rumpo", costs = 10000, description = {}, model = "rumpo"},
				{name = "Food Truck New", costs = 2500, description = {}, model = "taco"},
			}
		},
		["cycles"] = {
			title = "cycles",
			name = "cycles",
			buttons = {
				{name = "BMX", costs = 150, description = {}, model = "bmx"},
				{name = "Cruiser", costs = 240, description = {}, model = "cruiser"},
				{name = "Fixter", costs = 270, description = {}, model = "fixter"},
				{name = "Scorcher", costs = 300, description = {}, model = "scorcher"},
				{name = "Pro 1", costs = 2500, description = {}, model = "tribike"},
				{name = "Pro 2", costs = 2600, description = {}, model = "tribike2"},
				{name = "Pro 3", costs = 2900, description = {}, model = "tribike3"},
			}
		},		
	}
}

vehshop = vehshopDefault
local vehshopOwner = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 250, type = 1 },
	menu = {
		x = 0.14,
		y = 0.15,
		width = 0.12,
		height = 0.03,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.29,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "Drift", description = ''},
				{name = "Imports", description = ''},
			}
		},
		["jobvehicles"] = {
			title = "job vehicles",
			name = "job vehicles",
			buttons = {
				{name = "Taxi Cab", costs = 2500, description = {}, model = "taxi"},
				{name = "Flat Bed", costs = 2500, description = {}, model = "flatbed"},
				{name = "News Rumpo", costs = 10000, description = {}, model = "rumpo"},
				{name = "Taco Truck", costs = 2500, description = {}, model = "taco"},
				{name = "Towtruck", costs = 15000, description = {}, model = "towtruck"},
				{name = "Retro Towtruck", costs = 13000, description = {}, model = "towtruck2"},
			}
		},
		["sedans"] = {
			title = "sedans",
			name = "sedans",
			buttons = {			
				{name = "Ocelot Jugular", costs = 88000, description = {}, model = "jugular"},
				{name = "Sugoi", costs = 39000, description = {}, model = "sugoi"},
				{name = "Komoda", costs = 75000, description = {}, model = "komoda"},
				{name = "VSTR", costs = 90000, description = {}, model = "vstr"},
				{name = "Roosevelt Valor", costs = 70000, description = {}, model = "btype3"},
	
			}
		},
		["compacts"] = {
			title = "compacts",
			name = "compacts",
			buttons = {
				{name = "Issi Sport", costs = 48000, description = {}, model = "issi7"},
				{name = "Kanjo", costs = 78000, description = {}, model = "kanjo"},
			}
		},
		["sportsclassics"] = {
			title = "sportsclassics",
			name = "sportsclassics",
			buttons = {
				{name = "Nebula", costs = 130000, description = {}, model = "nebula"},
				{name = "Elegy Retro Custom", costs = 110000, description = {}, model = "elegy"},
				{name = "Cheetah Classic", costs = 92000, description = {}, model = "cheetah2"},
			}
		},
		["sports"] = {
			title = "sports",
			name = "sports",
			buttons = {
				{name = "Neon", costs = 105000, description = {}, model = "neon"},
				{name = "Sultan Classic", costs = 99000, description = {}, model = "sultan2"},
				{name = "Obey 8F Drafter", costs = 81700, description = {}, model = "drafter"},
				{name = "Sultan RS", costs = 130000, description = {}, model = "sultanrs"},
				{name = "Banshee 900R", costs = 112000, description = {}, model = "banshee2"},
				{name = "Specter Custom", costs = 91000, description = {}, model = "specter2"},
				{name = "Jester", costs = 83000, description = {}, model = "jester"},
				{name = "Revolter ", costs = 95000, description = {}, model = "revolter"},
				{name = "Elegy", costs = 88000, description = {}, model = "elegy2"},
				{name = "Comet Retro Custom", costs = 88000, description = {}, model = "comet3"},
				{name = "Schlagen GT", costs = 165000, description = {}, model = "schlagen"},
				{name = "Raiden", costs = 100000, description = {}, model = "raiden"},
				{name = "Flash GT", costs = 78000, description = {}, model = "flashgt"},
				{name = "Infernus Classic", costs = 125000, description = {}, model = "infernus2"},
				{name = "Penumbra FF", costs = 115000, description = {}, model = "penumbra2"},
				{name = "Coquette D10", costs = 170000, description = {}, model = "coquette4"},
			}
		},
		["supercars"] = {
			title = "supercars",
			name = "supercars",
			buttons = {
				{name = "Entity XXR", costs = 255000, description = {}, model = "entity2"},
				{name = "Itali GTO", costs = 175000, description = {}, model = "italigto"},
				{name = "Vacca", costs = 155000, description = {}, model = "vacca"},
				{name = "Reaper", costs = 170000, description = {}, model = "reaper"},
				{name = "Itali GTB Custom", costs = 190000, description = {}, model = "italigtb2"},
				{name = "Seven 70", costs = 160000, description = {}, model = "seven70"},
				{name = "Furia", costs = 215000, description = {}, model = "furia"},
				{name = "FMJ", costs = 180000, description = {}, model = "fmj"},
				{name = "Voltic", costs = 125000, description = {}, model = "voltic"},
				{name = "T20", costs = 220000, description = {}, model = "t20"},
				{name = "XA-21", costs = 200000, description = {}, model = "xa21"},
				{name = "Deveste Eight", costs = 260000, description = {}, model = "deveste"},
				{name = "Neo", costs = 210000, description = {}, model = "neo"},
				{name = "Pfister 811", costs = 195000, description = {}, model = "pfister811"},
				{name = "Ocelot Penetrator", costs = 200000, description = {}, model = "penetrator"},
				{name = "Zentorno", costs = 220000, description = {}, model = "zentorno"},
				{name = "X80 Proto", costs = 265000, description = {}, model = "prototipo"},
				{name = "Tezeract", costs = 275000, description = {}, model = "tezeract"},
				{name = "Cyclone", costs = 230000, description = {}, model = "cyclone"},
				{name = "Zorrusso", costs = 185000, description = {}, model = "zorrusso"},
				{name = "S80RR", costs = 210000, description = {}, model = "s80"},
				{name = "SC1", costs = 180000, description = {}, model = "sc1"},
				{name = "Autarch", costs = 215000, description = {}, model = "autarch"},
				{name = "Visione", costs = 255000, description = {}, model = "visione"},
				{name = "GP1", costs = 190000, description = {}, model = "gp1"},
				{name = "Emerus", costs = 270000, description = {}, model = "emerus"},
				{name = "Tyrus", costs = 205000, description = {}, model = "tyrus"},
				{name = "Thrax", costs = 250000, description = {}, model = "thrax"},
				{name = "Tyrant", costs = 245000, description = {}, model = "tyrant"},
				{name = "Taipan", costs = 235000, description = {}, model = "taipan"},
			}
		},
		["muscle"] = {
			title = "muscle",
			name = "muscle",
			buttons = {
				{name = "Blade", costs = 81000, description = {}, model = "blade"},
				{name = "Gauntlet Classic", costs = 120000, description = {}, model = "gauntlet3"},
				{name = "Gauntlet Hellfire", costs = 130000, description = {}, model = "gauntlet4"},
				{name = "Yosmite Slamvan", costs = 75000, description = {}, model = "yosemite2"},
				{name = "Buccaneer", costs = 38000, description = {}, model = "buccaneer"},
				{name = "Buccaneer Lowrider", costs = 51000, description = {}, model = "buccaneer2"},
				{name = "Chino", costs = 26000, description = {}, model = "chino"},
				{name = "Chino Lowrider", costs = 30000, description = {}, model = "chino2"},
				{name = "Coquette BlackFin", costs = 48000, description = {}, model = "coquette3"},
				{name = "Dominator", costs = 83000, description = {}, model = "dominator"},
				{name = "Dukes", costs = 86000, description = {}, model = "dukes"},
				{name = "Gauntlet", costs = 83000, description = {}, model = "gauntlet"},
				{name = "Faction", costs = 41000, description = {}, model = "faction"},
				{name = "Faction Lowrider", costs = 51000, description = {}, model = "faction2"},
				{name = "Faction Lowrider DONK", costs = 55000, description = {}, model = "faction3"},
				{name = "Moonbeam Lowrider", costs = 35000, description = {}, model = "moonbeam2"},
				{name = "Minivan Lowrider", costs = 50000, description = {}, model = "minivan2"},
				{name = "Picador", costs = 41000, description = {}, model = "picador"},
				{name = "Sabre Turbo", costs = 82000, description = {}, model = "sabregt"},
				{name = "SabreGT Lowrider", costs = 44000, description = {}, model = "sabregt2"},
				{name = "Slamvan Lowrider", costs = 90000, description = {}, model = "slamvan3"},
				{name = "Tampa", costs = 81000, description = {}, model = "tampa"},
				{name = "Tornado Lowrider", costs = 25000, description = {}, model = "tornado5"},
				{name = "Virgo", costs = 42000, description = {}, model = "virgo"},
				{name = "Vigero", costs = 42000, description = {}, model = "vigero"},
				{name = "Elliie", costs = 87000, description = {}, model = "ellie"},
				{name = "Phoenix", costs = 40000, description = {}, model = "phoenix"},
				{name = "Primo Lowrider", costs = 35000, description = {}, model = "primo2"},
				{name = "Slam Van", costs = 85000, description = {}, model = "slamvan"},
				{name = "Yosemite", costs = 84000, description = {}, model = "yosemite"},
				{name = "Tulip", costs = 42000, description = {}, model = "tulip"},
				{name = "Vamos", costs = 84000, description = {}, model = "vamos"},
				{name = "Virgo Lowrider", costs = 55000, description = {}, model = "virgo2"},
				{name = "Voodoo Lowrider", costs = 25000, description = {}, model = "voodoo"},
				{name = "Gauntlet Classic Custom", costs = 140000, description = {}, model = "gauntlet5"},
				{name = "Beater Dukes", costs = 120000, description = {}, model = "dukes3"},
			}
		},
		["police"] = {
			title = "police",
			name = "police",
			buttons = {
				{name = "Crownvic", costs = 10000, description = {}, model = "npolvic"},
				{name = "Ambulance", costs = 8000, description = {}, model = "emsnspeedo"},
				{name = "Police Mustang", costs = 15000, description = {}, model = "SHEL"},
				{name = "police hellcat", costs = 15000, description = {}, model = "challenger18"},
			}
		},
		["drift"] = {
			title = "drift",
			name = "drift",
			buttons = {
				{name = "Drift Sentinel", costs = 358000, description = {}, model = "sentinel6str"},	
				{name = "Drift Pigalle", costs = 336750, description = {}, model = "pigalle6str"},
                {name = "Drift Stratum", costs = 341900, description = {}, model = "stratumc"},
                {name = "Drift Tampa 5", costs = 485000, description = {}, model = "tampa5"},
				{name = "Drift Tampa 2", costs = 485000, description = {}, model = "tampa2"},
                {name = "Drift Schwarzer", costs = 351000, description = {}, model = "schwarzer2"},
                {name = "Drift Ruiner", costs = 333000, description = {}, model = "ruiner6str"},
                {name = "Drift Sultan", costs = 326999, description = {}, model = "sultanrsv8"},	
				{name = "Drift Yosemite", costs = 489000, description = {}, model = "yosemite6str"},	
				{name = "Drift R34", costs = 601500, description = {}, model = "er34"},	
				{name = "Drift Evo", costs = 319000, description = {}, model = "evo9"},	
				{name = "Drift FC RX7", costs = 370000, description = {}, model = "fc3s"},	
				{name = "Drift Lamborghini Murcielago", costs = 855699, description = {}, model = "lwlp670"},			
				{name = "Drift BMW", costs = 399000, description = {}, model = "m235"},	
				{name = "Drift Nis 13", costs = 359999, description = {}, model = "nis13"},			
			}
		},

		["imports"] = {
			title = "imports",
			name = "imports",
			buttons = {
				{model = "zr3806str", name = "ZR 3806 6STR", costs = 335000, description = {}},
				{model = "370z", name = "Nissan 370z", costs = 275000, description = {}},
				{model = "510", name = "Datus 510", costs = 115000, description = {}},
				{model = "911rwb", name = "Porsche 911 LWB", costs = 310500, description = {}},  
				{model = "a80", name = "Toyota Supra A80", costs = 280500, description = {}},
				{model = "acs8", name = "BMW ACS8", costs = 340000, description = {}},
				{model = "ap2", name = "Honda AP2", costs = 229000, description = {}},
				{model = "e46", name = "BMW M3 E46", costs = 197000, description = {}},
				{model = "evo10", name = "Mitsubishi Lancer Evolution 10", costs = 282500, description = {}},
				{model = "lp700r", name = "Lamborghini LP700R", costs = 877335, description = {}},
				{model = "lwgtr", name = "Libertywalk GTR", costs = 610500, description = {}},
				{model = "lwgtr2", name = "Livertywalk GTR 2", costs = 610500, description = {}},
				{model = "rmodmustang", name = "Ford Mustang GT", costs = 584750, description = {}},
				{model = "rx7rb", name = "RX7 Rocketbunny", costs = 298500, description = {}},
				{model = "subwrx", name = "Subaru WRX", costs = 312750, description = {}},				
				{model = "650slw", name = "McLaren 650S Liberty Walk", costs = 401750, description = {}},
				{model = "918", name = "Porsche 918 Spyder", costs = 814900, description = {}},
				{model = "bdragon", name = "Bentley Dragon", costs = 668350, description = {}},
				{model = "c7", name = "Corvette C7", costs = 486000, description = {}},
				{model = "c63", name = "Mercedes AMG C63", costs = 494000, description = {}},
				{model = "contss18", name = "Bentlet Continental", costs = 660500, description = {}},
				{model = "cp9a", name = "Mitsubishi Lancer Evolution V RS (CP9A)", costs = 253550, description = {}},
				{model = "dc5", name = "Honda Type R DC5", costs = 144500, description = {}},
				{model = "e36prb", name = "BMW C3 E36", costs = 194700, description = {}},
				{model = "eclipse", name = "Mitsubishi Eclipse", costs = 140000, description = {}},
				{model = "esv", name = "Cadilac Escilade", costs = 205750, description = {}},
				{model = "exor", name = "Chevrolet Camaro", costs = 415000, description = {}},
				{model = "f150", name = "Ford Raptor F150", costs = 173900, description = {}},
				{model = "filthynsx", name = "Acura NSX", costs = 458000, description = {}},
				{model = "fk8", name = "Honda Civic Type R", costs = 187045, description = {}},
				{model = "fnfrx7", name = "FNF RX7", costs = 298000, description = {}},
				{model = "focusrs", name = "Ford Focus RS", costs = 391260, description = {}},
				{model = "golfp", name = "Volkswagen Golf", costs = 295000, description = {}},
				{model = "granlb", name = "Maserati GranTurismo", costs = 469750, description = {}},
				{model = "gt2rwb", name = "Porsche 911 GT2", costs = 361500, description = {}},
				{model = "gt63", name = "Mercedes AMG G63", costs = 589250, description = {}},
				{model = "gtr", name = "Nissan GTR", costs = 573500, description = {}},
				{model = "gtrc", name = "Mercedes AMG GTR", costs = 577750, description = {}},
				{model = "laferrari17", name = "Ferrari La Ferrari 17", costs = 958300, description = {}},
				{model = "lp670", name = "Lamborghini Murciélago LP670-4", costs = 810000, description = {}},
				{model = "m3e46", name = "BMW M3 E46", costs = 287000, description = {}},
				{model = "m4", name = "BMW M4", costs = 248750, description = {}},
				{model = "m5e60", name = "BMW M5 E60", costs = 237750, description = {}},
				{model = "MBW124", name = "Mercedes-Benz W124", costs = 248950, description = {}},
				{model = "mig", name = "Gemballa MIG-U1", costs = 2270000, description = {}},
				{model = "mustang19", name = "Mustang 19", costs = 332750, description = {}},
				{model = "na1", name = "Honda NSX", costs = 247950, description = {}},
				{model = "na6", name = "MX5 NA6", costs = 390000, description = {}},
				{model = "p1", name = "McLaren P1", costs = 1500000, description = {}},
				{model = "panamera17turbo", name = "Porsche Panamara Turbo", costs = 442950, description = {}},
				{model = "por930", name = "1982 Porsche 911 Turbo", costs = 403000, description = {}},
				{model = "r35", name = "Nissan GTR R35", costs = 620000, description = {}},
				{model = "rcf", name = "Lexus RC", costs = 219500, description = {}},
				{model = "regera", name = "2020 Koenigsegg Regera", costs = 1800000, description = {}},
				{model = "s14boss", name = "Rocket Bunny Nissan Silvia", costs = 378750, description = {}},
				{model = "s15rb", name = "Nissan Silvia S15", costs = 368000, description = {}},
				{model = "tempesta2", name = "6STR Lamborghini Hurrican", costs = 672750, description = {}},
				{model = "wraith", name = "Rolls-Royce Wraith", costs = 580750, description = {}},
				{model = "zondar", name = "Pagani Zonda", costs = 1400000, description = {}},
				{model = "2f2fgtr34", name = "GTR R34 (Livery)", costs = 1289000, description = {}},
				{model = "fnf4r34", name = "GTR R34", costs = 537350, description = {}},
				{model = "comet6str", name = "Comet 6STR", costs = 365000, description = {}},
				{model = "ellie6str", name = "Vapid Ellie 6STR", costs = 340000, description = {}},
				{model = "gauntlet6str", name = "Gauntlet 6STR", costs = 3450000, description = {}},
				{model = "hellion6str", name = "Hellion 6STR", costs = 310000, description = {}},
				{model = "ladybird6str", name = "Ladybird 6STR", costs = 490000, description = {}},
				{model = "revolution6str", name = "Revolution 6STR", costs = 340000, description = {}},
			}
		},
	}
}




local fakecar = {model = '', car = nil}
local vehshop_locations = {
	[1] = {
		entering = {-794.29,-218.86,36.38, 140.92509460449}, 
		inside = {-799.0,-221.02,36.9, 173.97}, 
		outside = {-789.3,-196.07, 37.1, 298.95}, 
	}
}


local carspawns = {
    [1] = {["x"] = -804.03, ["y"] = -215.2, ["z"] = 36.15, ["h"] = 255.0, ["info"] = " Car Spot 1"},
    [2] = {["x"] = -788.36, ["y"] = -207.6, ["z"] = 36.21, ["h"] = 120.0, ["info"] = " Car Spot 2"},
    [3] = {["x"] = -779.25, ["y"] = -219.2, ["z"] = 36.17, ["h"] = 64.0, ["info"] = " Car Spot 3"},
    [4] = {["x"] = -791.63, ["y"] = -217.81, ["z"] = 36.41, ["h"] = 210.0, ["info"] = " Car Spot 4"},
    [5] = {["x"] = -796.01, ["y"] = -228.77, ["z"] = 36.15, ["h"] = 337.0, ["info"] = " Car Spot 5"},
    [6] = {["x"] = -793.44, ["y"] = -233.64, ["z"] = 36.16, ["h"] = 337.0, ["info"] = " Car Spot 6"},
    [7] = {["x"] = -790.46, ["y"] = -239.08, ["z"] = 36.16, ["h"] = 337.0, ["info"] = " Car Spot 7"},
    [8] = {["x"] = -787.28, ["y"] = -244.5, ["z"] = 36.17, ["h"] = 337.0, ["info"] = " Car Spot 8"},
}

local carTable = {
	[1] = { ["model"] = "mustang19", ["baseprice"] = 332750, ["commission"] = 15 }, 
	[2] = { ["model"] = "evo9", ["baseprice"] = 300000, ["commission"] = 15 },
	[3] = { ["model"] = "sentinel6str", ["baseprice"] = 80000, ["commission"] = 15 },
	[4] = { ["model"] = "ladybird6str", ["baseprice"] = 490000, ["commission"] = 15 },
	[5] = { ["model"] = "r35", ["baseprice"] = 620000, ["commission"] = 15 },
	[6] = { ["model"] = "bdragon", ["baseprice"] = 668350, ["commission"] = 15 },
	[7] = { ["model"] = "c7", ["baseprice"] = 486000, ["commission"] = 15 },
	[8] = { ["model"] = "wraith", ["baseprice"] = 580750, ["commission"] = 15 },
}

function updateCarTable(model,price,name)
	carTable[currentCarSpawnLocation]["model"] = model
	carTable[currentCarSpawnLocation]["baseprice"] = price
	carTable[currentCarSpawnLocation]["name"] = name
	TriggerServerEvent("sunrise:carshop:table",carTable)
end



local myspawnedvehs = {}

RegisterNetEvent("sunrise:car:testdrive")
AddEventHandler("sunrise:car:testdrive", function()

	if rank == 0 or not insideVehShop then
		return
	end	

	local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent("DoLongHudText","Could not locate vehicle",2)
		return
	end
	
	local model = GetEntityModel(veh)
	local veh = GetClosestVehicle(vehshop_locations[1].outside[1],vehshop_locations[1].outside[2],vehshop_locations[1].outside[3], 3.000, 0, 70)

	if not DoesEntityExist(veh) then

		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model,vehshop_locations[1].outside[1],vehshop_locations[1].outside[2],vehshop_locations[1].outside[3],vehshop_locations[1].outside[4],true,false)
		local vehplate = "Sunrise"..math.random(10000,99999) 
		SetVehicleNumberPlateText(veh, vehplate)
		Citizen.Wait(100)
		local plt = GetVehicleNumberPlateText(veh)
		TriggerEvent("keys:addNew",veh, plt)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)

		TaskWarpPedIntoVehicle(PlayerPedId(),veh,-1)
		myspawnedvehs[veh] = true
	else
		TriggerEvent("DoLongHudText","A car is on the spawn point.",2)
	end

end)

RegisterCommand('finance2', function()
	TriggerEvent('finance2')
end)
	
RegisterCommand("testdrive2", function(source)
	TriggerEvent("sunrise:car:testdrive")
end)

RegisterNetEvent("finance2")
AddEventHandler("finance2", function()

	if rank == 0 or not insideVehShop then
		return
	end	
	local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent("DoLongHudText","Could not locate vehicle",2)
		return
	end
	local vehplate = GetVehicleNumberPlateText(veh)	
	TriggerServerEvent("sunrise:finance:enable",vehplate)
end)

RegisterNetEvent("sunrise:finance:enableOnClient")
AddEventHandler("sunrise:finance:enableOnClient", function(addplate)
	financedPlates[addplate] = true
	Citizen.Wait(60000)
	financedPlates[addplate] = nil
end)	

RegisterCommand('enablebuy2', function()
	TriggerEvent('buy2')
end)

RegisterNetEvent("buy2")
AddEventHandler("buy2", function()

	if rank == 0 or not insideVehShop then
		return
	end	
	local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent("DoLongHudText","Could not locate vehicle",2)
		return
	end
	local vehplate = GetVehicleNumberPlateText(veh)	
	TriggerServerEvent("sunrise:buy:enable",vehplate)
end)

RegisterNetEvent("sunrise:buy:enableOnClient")
AddEventHandler("sunrise:buy:enableOnClient", function(addplate)
	FullBuyPlates[addplate] = true
	Citizen.Wait(60000)
	FullBuyPlates[addplate] = nil
end)	

RegisterNetEvent("commission2")
AddEventHandler("commission2", function(newAmount)

	if rank == 0 or not insideVehShop then
		return
	end	
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			carTable[i]["commission"] = tonumber(newAmount)
			TriggerServerEvent("sunrise:carshop:table",carTable)

		end
	end
end)

RegisterNetEvent("plutorp-sunriseshop:returnTable")
AddEventHandler("plutorp-sunriseshop:returnTable", function(newTable)

	carTable = newTable
	DespawnSaleVehicles()
	SpawnSaleVehicles()

end)

local hasspawned = false

local spawnedvehicles = {}
local vehicles_spawned = false
function BuyMenu()
	for i = 1, #carspawns do

		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			if GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= nil and GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= 0 then
				ClearPedTasksImmediately(PlayerPedId())
			end

			
			DisableControlAction(0,23)
			if IsControlJustReleased(0,47) then
				local veh = GetClosestVehicle(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"], 3.000, 0, 70)
				local addplate = GetVehicleNumberPlateText(veh)
				if FullBuyPlates[addplate] ~= nil then
					TriggerEvent("DoLongHudText","Attempting Purchase")
					AttemptBuy(i,false)
				else
					TriggerEvent("DoLongHudText", "You need a sales rep to help you")
				end
			end

			if IsControlJustReleased(0,23) or IsDisabledControlJustReleased(0,23) then
				local veh = GetClosestVehicle(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"], 3.000, 0, 70)
				local addplate = GetVehicleNumberPlateText(veh)
				if financedPlates[addplate] ~= nil then
					TriggerEvent("DoLongHudText","Attempting Purchase")
					AttemptBuy(i,true)
				else
					TriggerEvent("DoLongHudText", "You need a sales rep to help you")
				end
			end
		end
	end
end

function AttemptBuy(tableid,financed)

	local veh = GetClosestVehicle(carspawns[tableid]["x"],carspawns[tableid]["y"],carspawns[tableid]["z"], 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent("DoLongHudText","Could not locate vehicle",2)
		return
	end

	local model = carTable[tableid]["model"]
	local commission = carTable[tableid]["commission"]
	local baseprice = carTable[tableid]["baseprice"]
	local price = baseprice + (baseprice * commission/100)
	local vehname = GetDisplayNameFromVehicleModel(model)
	if baseprice > 750000 and not financed then
		TriggerEvent("DoLongHudText","This vehicle must be financed.",2)
		return
	end
	currentlocation = vehshop_blips[1]
	TaskWarpPedIntoVehicle(PlayerPedId(),veh,-1)
	TriggerServerEvent('sunrise:CheckMoneyForVeh', vehname, model, price, financed)
	commissionbuy = (baseprice * commission/200)

end



function OwnerMenu()

	if not vehshop.opened then
		currentCarSpawnLocation = 0
		ownerMenu = false
	end
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			ownerMenu = true
			currentCarSpawnLocation = i
			if IsControlJustReleased(0,38) then
				print("here menu")
				TriggerEvent("DoLongHudText","We Opened")
				if vehshop.opened then
					CloseCreator()
				else
					OpenCreator()
				end
			end
		end
	end

end

function DrawPrices()
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.5 then
			local commission = carTable[i]["commission"]
			local baseprice = carTable[i]["baseprice"]
			local price = baseprice + (baseprice * commission/100)
			local veh = GetClosestVehicle(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"], 3.000, 0, 70)
			local addplate = GetVehicleNumberPlateText(veh)
			if rank > 0 then
				if financedPlates[addplate] ~= nil then
					DrawText3D(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"],"$" .. math.ceil(price/3) .. " | Com: %" ..commission.. " | [~b~E~w~] to change | [~r~G~w~] to buy | [F] to Finance ")
				else
					DrawText3D(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"],"$" .. math.ceil(price) .. " | Com: %" ..commission.. " | [~b~E~w~] to change | [~b~G~w~] to buy ")
				end
			else
				if financedPlates[addplate] ~= nil then
					DrawText3D(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"],"$" .. math.ceil(price) .. " $" .. math.ceil(price) .. " upfront, $" .. math.ceil(price/3) .. " over 10 weeks, [F] to finance. ")
				else
					DrawText3D(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"],"$" .. math.ceil(price) .. " ")
				end			
			end
		end
	end
end
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
function SpawnSaleVehicles()
	if not hasspawned then
		TriggerServerEvent("sunrise:carshop:requesttable")
		Citizen.Wait(1500)
	end
	DespawnSaleVehicles(true)
	hasspawned = true
	for i = 1, #carTable do
		local model = GetHashKey(carTable[i]["model"])
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model,carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]-1,carspawns[i]["h"],false,false)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh,true)

		FreezeEntityPosition(veh,true)
		spawnedvehicles[#spawnedvehicles+1] = veh
		SetVehicleNumberPlateText(veh, i .. "CARSALE")
	end
	vehicles_spawned = true
end

function DespawnSaleVehicles(pDontWait)
	if pDontWait == nil and not pDontWait then
		Wait(15000)
	end
	for i = 1, #spawnedvehicles do
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(spawnedvehicles[i]))
	end
	vehicles_spawned = false
end




Controlkey = {["generalUse"] = {38,"E"},["generalUseSecondary"] = {18,"Enter"}} 
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
	Controlkey["generalUse"] = table["generalUse"]
	Controlkey["generalUseSecondary"] = table["generalUseSecondary"]
end)

--[[Functions]]--

function LocalPed()
	return PlayerPedId()
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

function ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,669)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Sunrise Autos')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			SetBlipScale(blip, 0.5)
			SetBlipColour(blip, 17)
			vehshop_blips[#vehshop_blips+1]= {blip = blip, pos = loc}
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(1)
				local inrange = false

				if #(vector3(vehshop_locations[1].outside[1],vehshop_locations[1].outside[2],vehshop_locations[1].outside[3]) - GetEntityCoords(LocalPed())) < 5.0 then
					local veh = GetVehiclePedIsUsing(LocalPed())
					if myspawnedvehs[veh] ~= nil then
						DrawText3D(vehshop_locations[1].outside[1],vehshop_locations[1].outside[2],vehshop_locations[1].outside[3],"["..Controlkey["generalUse"][2].."] return vehicle")
						if IsControlJustReleased(0,Controlkey["generalUse"][1]) then
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
						end
					end
				end

				for i,b in ipairs(vehshop_blips) do
					if insideVehShop then
						currentlocation = b
						if not vehicles_spawned then
							SpawnSaleVehicles()
						end
						if #(vector3(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]) - GetEntityCoords(LocalPed())) < 25 then
							DrawPrices()
						end

						if vehshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and #(vector3(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]) - GetEntityCoords(LocalPed())) <= 1 then

							inrange = true
						end

						if vehshop.opened == true then
							DisplayHelpText('~g~'..Controlkey["generalUse"][2]..'~s~ or ~g~'..Controlkey["generalUseSecondary"][2]..'~s~ Accepts ~g~Arrows~s~ Move ~g~Backspace~s~ Exit')
						end

						if rank > 0 then
							OwnerMenu()
						end

						BuyMenu()
						

					else
						if vehicles_spawned then
							DespawnSaleVehicles()
						end
						Citizen.Wait(1000)
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function f(n)
	return n + 0.0001
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function OpenCreator()
	boughtcar = false
	
	if ownerMenu then
		vehshop = vehshopOwner	
	else
		vehshop = vehshopDefault
	end


	local ped = LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])




	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local endingCreator = false
function CloseCreator(name, veh, price, financed)
	Citizen.CreateThread(function()
		if not endingCreator then
			endingCreator = true
			local ped = LocalPed()
			if not boughtcar then
				local pos = currentlocation.pos.entering
				SetEntityCoords(ped,pos[1],pos[2],pos[3])
				FreezeEntityPosition(ped,false)
				SetEntityVisible(ped,true)
			else			
				local name = name	
				local vehicle = veh
				local price = price		
				local veh = GetVehiclePedIsUsing(ped)
				local model = GetEntityModel(veh)
				local colors = table.pack(GetVehicleColours(veh))
				local extra_colors = table.pack(GetVehicleExtraColours(veh))

				local mods = {}
				for i = 0,24 do
					mods[i] = GetVehicleMod(veh,i)
				end
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
				local pos = currentlocation.pos.outside

				FreezeEntityPosition(ped,false)
				RequestModel(model)
				while not HasModelLoaded(model) do
					Citizen.Wait(0)
				end
				personalvehicle = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)
				SetModelAsNoLongerNeeded(model)

				if name == "rumpo" then
					SetVehicleLivery(personalvehicle,0)
				end

				if name == "taxi" then
					SetVehicleExtra(personalvehicle, 8, 0)
					SetVehicleExtra(personalvehicle, 9, 0)
					SetVehicleExtra(personalvehicle, 5, 1)
				end

				if name == "npolvic" then
					SetVehicleExtra(personalvehicle, 8, 0)
					SetVehicleExtra(personalvehicle, 9, 0)
					SetVehicleExtra(personalvehicle, 5, 1)
					SetVehicleLivery(personalvehicle,2)
				end



				for i,mod in pairs(mods) do
					SetVehicleModKit(personalvehicle,0)
					SetVehicleMod(personalvehicle,i,mod)
				end

				SetVehicleOnGroundProperly(personalvehicle)

				local plate = GetVehicleNumberPlateText(personalvehicle)
				SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
				local id = NetworkGetNetworkIdFromEntity(personalvehicle)
				SetNetworkIdCanMigrate(id, true)
				Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
				SetVehicleColours(personalvehicle,colors[1],colors[2])
				SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
				TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
				TriggerEvent("keys:addNew", model, plate)
				local vehname = GetDisplayNameFromVehicleModel(model)
				SetEntityVisible(ped,true)			
				local primarycolor = colors[1]
				local secondarycolor = colors[2]	
				local pearlescentcolor = extra_colors[1]
				local wheelcolor = extra_colors[2]
				TriggerServerEvent('sunrise:BuyForVeh', plate, vehname, vehicle, price, financed)
				DespawnSaleVehicles()
				SpawnSaleVehicles()
				Citizen.Wait(4000)
				TriggerServerEvent("garages:loaded:in")
			end
			vehshop.opened = false
			vehshop.menu.from = 1
			vehshop.menu.to = 10
			endingCreator = false
		end
	end)
end


RegisterNetEvent("sunrise:carshop:failedpurchase")
AddEventHandler("sunrise:carshop:failedpurchase", function()
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	TaskLeaveVehicle(PlayerPedId(),veh,0)
end)


RegisterNetEvent("plutorp-sunriseshop:setPlate")
AddEventHandler("plutorp-sunriseshop:setPlate", function(vehicle, plate)
	SetVehicleNumberPlateText(vehicle, plate)
	Citizen.Wait(1000)
	TriggerEvent("keys:addNew", vehicle, plate)

	TriggerServerEvent('garages:SetVehOut', vehicle, plate)
	TriggerServerEvent('veh.getVehicles', plate, vehicle)
	TriggerServerEvent("garages:CheckGarageForVeh")

	local plt = GetVehicleNumberPlateText(vehicle)
	TriggerServerEvent("request:illegal:upgrades",plate)

end)




function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,51,122,181,220)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,250)
	DrawText(0.255, 0.254)
end

function drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.2, 0.2)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(250,250,250, 255)
	else
		SetTextColour(0, 0, 0, 255)
		
	end
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 + 0.025, y - menu.height/3 + 0.0002)

	if selected then
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,51,122,181,250)
	else
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,255, 255, 255,250) 
	end
	

end

function drawMenuTitle(txt,x,y)
	local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)

	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,250)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end



function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function ButtonSelected(button)
	local ped = PlayerPedId()
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Vehicles" then
			OpenMenu('vehicles')
		elseif btn == "Motorcycles" then
			OpenMenu('motorcycles')
		elseif btn == "Cycles" then
			OpenMenu('cycles')
		end
	elseif this == "vehicles" then
		if btn == "Sports" then
			OpenMenu('sports')
		elseif btn == "Sedans" then
			OpenMenu('sedans')
		elseif btn == "Imports" then
			OpenMenu('imports')
		elseif btn == "Job Vehicles" then
			OpenMenu('jobvehicles')
		elseif btn == "Compacts" then
			OpenMenu('compacts')
		elseif btn == "Coupes" then
			OpenMenu('coupes')
		elseif btn == "Sports Classics" then
			OpenMenu("sportsclassics")
		elseif btn == "Super Cars" then
			OpenMenu("supercars")
		elseif btn == "Muscle" then
			OpenMenu('muscle')
		elseif btn == "Drift" then
			OpenMenu('drift')
		elseif btn == "Off-Road" then
			OpenMenu('offroad')
		elseif btn == "Police" then
			OpenMenu('police')
		elseif btn == "Vans" then
			OpenMenu('vans')
		end

	elseif this == "jobvehicles" or this == "compacts" or this == "coupes" or this == "sedans" or this == "sports" or this == "imports" or  this == "sportsclassics" or this == "supercars" or this == "muscle" or this == "drift" or this == "offroad" or this == "police" or this == "vans" or this == "industrial" or this == "cycles" or this == "motorcycles" then

		if ownerMenu then

			updateCarTable(button.model,button.costs,button.name)

		else

			TriggerServerEvent('sunrise:CheckMoneyForVeh',button.name, button.model, button.costs)

		end
		
	end

end

function OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "vehicles" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		CloseCreator()
	elseif vehshop.currentmenu == "jobvehicles" or vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "imports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "supercars" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "drift" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "police" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
end

function resetscaleform(topspeed,handling,braking,accel,resetscaleform,i)
    scaleform = RequestScaleformMovie(resetscaleform)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

	topspeedc = topspeed / 20
	handlingc = handling / 20
	brakingc = braking / 20
	accelc = accel / 20

    PushScaleformMovieFunction(scaleform, "SET_VEHICLE_INFOR_AND_STATS")
    PushScaleformMovieFunctionParameterString("LOADING")
    PushScaleformMovieFunctionParameterString("Brand New Vehicle")
    PushScaleformMovieFunctionParameterString("MPCarHUD")
    PushScaleformMovieFunctionParameterString("Annis")
    PushScaleformMovieFunctionParameterString("Top Speed")
    PushScaleformMovieFunctionParameterString("Handling")
    PushScaleformMovieFunctionParameterString("Braking")
    PushScaleformMovieFunctionParameterString("Downforce")


	PushScaleformMovieFunctionParameterInt( (20 * i)-1 )
	PushScaleformMovieFunctionParameterInt( (20 * i)-1 )
	PushScaleformMovieFunctionParameterInt( (20 * i)-1 )
    PushScaleformMovieFunctionParameterInt( (20 * i)-1 )

	PopScaleformMovieFunctionVoid()

end


--[[Citizen]]--
function Initialize(scaleform,veh,vehname)

    scaleform = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    PushScaleformMovieFunction(scaleform, "SET_VEHICLE_INFOR_AND_STATS")
    PushScaleformMovieFunctionParameterString(vehname)
    PushScaleformMovieFunctionParameterString("Brand New Vehicle")
    PushScaleformMovieFunctionParameterString("MPCarHUD")
    PushScaleformMovieFunctionParameterString("Annis")
    PushScaleformMovieFunctionParameterString("Top Speed")
    PushScaleformMovieFunctionParameterString("Handling")
    PushScaleformMovieFunctionParameterString("Braking")
    PushScaleformMovieFunctionParameterString("Downforce")

	local topspeed = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel') / 4)
    local handling = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock') * 2)
    local braking = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce') * 100)
    local accel = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce') * 100) 

    if topspeed > 100 then
    	topspeed = 100
    end
    if handling > 100 then
    	handling = 100
    end
    if braking > 100 then
    	braking = 100
    end
    if accel > 100 then
    	accel = 100
    end
    Citizen.Trace(topspeed)
    Citizen.Trace(handling)
    Citizen.Trace(braking)
    Citizen.Trace(accel)

    PushScaleformMovieFunctionParameterInt( topspeed )
    PushScaleformMovieFunctionParameterInt( handling )
    PushScaleformMovieFunctionParameterInt( braking )
    PushScaleformMovieFunctionParameterInt( accel )
    PopScaleformMovieFunctionVoid()

    return scaleform
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if vehshop.opened then

			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			local y = vehshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			for i,button in pairs(menu.buttons) do
				local br = button.rank ~= nil and button.rank or 0
				if rank >= br and i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then

						drawMenuRight("$"..button.costs,vehshop.menu.x,y,selected)

					end
					y = y + 0.04
					if vehshop.currentmenu == "jobvehicles" or vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "supercars" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "drift" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "imports" or vehshop.currentmenu == "police" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)


								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
								SetModelAsNoLongerNeeded(hash)
								local timer = 9000
								while not DoesEntityExist(veh) and timer > 0 do
									timer = timer - 1
									Citizen.Wait(1)
								end
								TriggerEvent("vehsearch:disable",veh)

	


								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								--SetEntityCollision(veh,false,false)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakecar = { model = button.model, car = veh}

									local topspeed = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel') / 2)
								    local handling = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock') * 2)
								    local braking = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce') * 100)
								    local accel = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce') * 100) 
								
								if button.model == "rumpo" then
									SetVehicleLivery(veh,2)
								end


								-- not sure why it doesnt refresh itself, but blocks need to be set to their maximum 20 40 60 80 100 before a new number is pushed.
								for i = 1, 5 do
								 	scaleform = resetscaleform(topspeed,handling,braking,accel,"mp_car_stats_01",i)
							        x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
							        Citizen.InvokeNative(0x87D51D72255D4E78,scaleform, x-1,y+1.8,z+7.0, 0.0, 180.0, 90.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0)
								end

								scaleform = Initialize("mp_car_stats_01",fakecar.car,fakecar.model)
							end
						end
					end
					if selected and ( IsControlJustPressed(1,Controlkey["generalUse"][1]) or IsControlJustPressed(1, Controlkey["generalUseSecondary"][1])  ) then
						ButtonSelected(button)
					end
				end
			end

			if DoesEntityExist(fakecar.car) then
				if vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
					daz = 6.0
					if fakecar.model == "Chimera" then
						daz = 8.0
					end
					if fakecar.model == "bmx" then
						daz = 8.0
					end
					 x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 3.0, -1.5, daz))
		        	Citizen.InvokeNative(0x87D51D72255D4E78,scaleform, x,y,z, 0.0, 180.0, 100.0, 1.0, 1.0, 1.0, 7.0, 7.0, 7.0, 0)
				else
		       		x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 3.0, -1.5, 10.0))
		       		Citizen.InvokeNative(0x87D51D72255D4E78,scaleform, x,y,z, 0.0, 180.0, 100.0, 1.0, 1.0, 1.0, 10.0, 10.0, 10.0, 0)		
				end
				TaskWarpPedIntoVehicle(LocalPed(),fakecar.car,-1)
		    end

		end
		if vehshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)

AddEventHandler('sunrise:FinishMoneyCheckForVeh', function(name, vehicle, price,financed)	
	local name = name
	local vehicle = vehicle
	local price = price
	boughtcar = true
	CloseCreator(name, vehicle, price, financed)
	local plt = GetVehicleNumberPlateText(vehicle)
	TriggerEvent("keys:addNew",vehicle, plt)
end)

ShowVehshopBlips(true)
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		--326 car blip 227 225
		ShowVehshopBlips(true)
		firstspawn = 1
	end
end)

AddEventHandler('sunrise:vehshop:spawnVehicle', function(v)
	local car = GetHashKey(v)
	local playerPed = PlayerPedId()
	if playerPed and playerPed ~= -1 then
		RequestModel(car)
		while not HasModelLoaded(car) do
				Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)
		veh = CreateVehicle(car, playerCoords, 0.0, true, false)
		local plate = GetVehicleNumberPlateText(veh)
		SetModelAsNoLongerNeeded(car)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, true)
		TriggerEvent('plutorp-sunriseshop:setPlate', veh, plate)
	end
end)

RegisterNetEvent("plutorp-sunriseshop:update:plate")
AddEventHandler("plutorp-sunriseshop:update:plate", function(plate)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	SetVehicleNumberPlateText(veh, plate)
	local NPlate = GetVehicleNumberPlateText(veh)
	Citizen.Wait(100)
	TriggerEvent("keys:addNew",veh, NPlate)
end)


local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		RemoveIpl('v_carshowroom')
		RemoveIpl('shutter_open')
		RemoveIpl('shutter_closed')
		RemoveIpl('shr_int')
		RemoveIpl('csr_inMission')
		RequestIpl('v_carshowroom')
		RequestIpl('shr_int')
		RequestIpl('shutter_closed')
		firstspawn = 1
	end
end)

local vehshopLoc = PolyZone:Create({
  vector2(-833.13543701172, -183.4736328125),
  vector2(-858.15698242188, -197.16130065918),
  vector2(-825.49865722656, -254.89807128906),
  vector2(-815.40686035156, -272.62399291992),
  vector2(-818.42425537109, -283.65115356445),
  vector2(-774.29351806641, -302.78747558594),
  vector2(-770.70660400391, -290.49176025391),
  vector2(-775.77282714844, -272.02325439453),
  vector2(-746.96704101563, -260.69543457031),
  vector2(-736.48358154297, -255.03248596191),
  vector2(-795.85998535156, -159.32734680176)
}, {
    name = "veh_shop",
    minZ = 30.5,
    maxZ = 50.5,
    debugGrid = false,
    gridDivisions = 25
})

local HeadBone = 0x796e;
Citizen.CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local coord = GetPedBoneCoords(plyPed, HeadBone)
        local inPoly = vehshopLoc:isPointInside(coord)
        -- if true, then player just entered zone
        if inPoly and not insideVehShop then
            insideVehShop = true
        elseif not inPoly and insideVehShop then
            insideVehShop = false
        end
        Citizen.Wait(500)
    end
end)

local isExportReady = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if insideVehShop and isExportReady then
            rank = exports["plutorp_manager"]:GroupRank("sunrise_shop")
            Citizen.Wait(10000)
        end
    end
end)

AddEventHandler("plutorp-core:exportsReady", function()
	Wait(1)
	isExportReady = true
end)

RegisterNetEvent("plutorp-sunriseshop:repo:success")
AddEventHandler("plutorp-sunriseshop:repo:success", function()
	local veh = GetVehiclePedIsIn(PlayerPedId())
	if veh ~= 0 then
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
		TriggerEvent("DoLongHudText", "You have successfully repossed the vehicle")
	end
end)


RegisterNetEvent("sunrise:search:list:repo")
AddEventHandler("sunrise:search:list:repo", function()
	local valid = exports["plutorp-applications"]:KeyboardInput({
		header = "Search Repo List",
		rows = {
			{
				id = 0,
				txt = "Vehicle Plate Number"
			},
		}
	})
	if valid then
		TriggerServerEvent("plutorp-sunriseshop:checkrepo", valid[1].input)
	end
end)