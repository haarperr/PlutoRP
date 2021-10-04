Config = {}

Config.SpawnCar = true




Config.Min = 100 -- min ammount for a part 
Config.Max = 360 -- max ammount for a part 

Config.Dirtymoney = false --When selling car parts if true players will get dirty mooney if false they will get cash

Config.chopCostMoney = true --If true Config.amountToStartChop will be removed from players cash if false starting chopshop will be free
Config.amountToStartChop = 120


Config.Radius = 300.0 -- radius of the zone so when the player gets to the location how big the location should be
Config.showRadius = true -- If true a red circle will show on the players map on where they will need to go to get the car!

Config.Routes = {
	{
		PickupCoordinates = vector3(-26.96, -1819.60, 25.86), --Where player goes to get car

		carSpawnLocation1 = vector3(32.23, -1819.38, 24.87),  ----- carSpawnLocation(1,2,3) Is for if Config,SpawnCar is true the script will pick one of these 3 locations and spawn the car there.
		Heading1 = 227.17,
		carSpawnLocation2 = vector3(94.24, -1961.28, 20.75),
		Heading2 = 320.11,
		carSpawnLocation3 = vector3(-44.94, -1840.83, 26.21),
		Heading3 = 319.31,

		SellboxCoordinates = vector3(-419.02,-1686.27, 19.02), --where they sell the part for this location(should be close to ChopupCoordinates)
		ChopupCoordinates = vector3(-427.71, -1692.41, 19.02), --where they bring the car to chop it up
		PickupName = "Grove Street" --name of the street so the player knows where to go
	},
	{
		PickupCoordinates = vector3(-902.96, -111.35, 37.77), --Where player goes to get car

		carSpawnLocation1 = vector3(-915.62, -165.53, 41.88),
		Heading1 = 207.71,
		carSpawnLocation2 = vector3(-868.55, -224.14, 39.41),
		Heading2 = 30.15,
		carSpawnLocation3 = vector3(-811.11, -192.24, 37.45),
		Heading3 = 118.73,

		SellboxCoordinates = vector3(-419.02,-1686.27, 19.02), --where they sell the part for this location(should be close to ChopupCoordinates)
		ChopupCoordinates = vector3(-427.71, -1692.41, 19.02), --where they bring the car to chop it up
		PickupName = "RockFord Hills" --name of the street so the player knows where to go
	},
	{
		PickupCoordinates = vector3(1068.65, -412.64, 67.15), --Where player goes to get car

		carSpawnLocation1 = vector3(1120.78, -402.17, 68.19),
		Heading1 = 76.30,
		carSpawnLocation2 = vector3(1134.74, -411.87, 67.05),
		Heading2 = 95.86,
		carSpawnLocation3 = vector3(1049.65, -389.22, 67.78),
		Heading3 = 221.97,


		SellboxCoordinates = vector3(-419.02,-1686.27, 19.02), --where they sell the part for this location(should be close to ChopupCoordinates)
		ChopupCoordinates = vector3(-427.71, -1692.41, 19.02), --where they bring the car to chop it up
		PickupName = "Mirror Park" --name of the street so the player knows where to go
	}
}



