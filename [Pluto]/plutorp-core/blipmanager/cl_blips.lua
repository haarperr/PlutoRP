local blips = {
    {id = "courthouse", name = "Los Santos Courthouse", scale = 0.5, color = 5, sprite = 58, x=244.5550079345, y=-386.0076904298, z=45.402359008789315},
    {id = "Bennys", name = "Bennys Motor Works", scale = 0.5, color = 1, sprite = 72, x=-43.265327453613, y=-1043.6879882812, z=29.518688201904},
    {id = "Auto Exotics", name = "Auto Exotics", scale = 0.5, color =1, sprite = 72, x=535.5615234375, y=-179.61291503906, z=54.364429473877},
    {id = "Hayes Auto", name = "Hayes Auto", scale = 0.5, color = 1, sprite = 72, x=-1417.1550292969, y=-446.43911743164, z=35.909713745117},
    {id = "Goat Motor Services", name = "Goat Motor Services", scale = 0.5, color = 1, sprite = 72, x=937.23828125, y=-970.89343261719, z=39.543106079102},
    {id = "Harmony Repair", name = "Harmony Repair", scale = 0.5, color = 1, sprite = 72, x=1179.4622802734, y=2640.5886230469, z=37.753829956055},
    {id = "Burger Shot", name = "Burger Shot", scale = 0.5, color = 21, sprite = 106, x=-1191.6701660156, y=-889.74584960938, z= 14.508341789246},
    {id = "truckjob1", name = "Delivery Garage", scale = 0.5, color = 17, sprite = 67, x =165.22, y=-28.38, z=67.94},
    {id = "truckjob2", name = "Delivery Garage", scale = 0.5, color = 17, sprite = 67, x = -627.99, y= -1649.99, z= 25.83}, 
    {id = "beanmachine", name = "Bean Machine", scale = 0.5, color = 44, sprite = 106, x = -629.541015625, y= 233.69226074219, z= 81.881462097168},
    {id = "RecycleCenter", name = "Recycling Center", scale = 0.8, color = 2, sprite = 467, x = 844.96984863281, y= -902.85791015625, z= 25.251340866089},
    {id = "PDBoatGarage", name = "PD Boat Garage", scale = 0.5, color = 3, sprite = 68, x = -806.05541992188, y= -1496.7113037109, z= 1.5952178239822},
    {id = "MRPD", name = "MRPD", scale = 0.5, color = 3, sprite = 60, x = 438.70559692383, y= -981.75952148438, z= 30.689582824707},
    {id = "Pillbox", name = "Pillbox Hospital", scale = 0.5, color = 2, sprite = 61, x = 307.94036865234, y= -587.64758300781, z= 43.284049987793},
    {id = "SandyPD", name = "Sandy PD", scale = 0.5, color = 3, sprite = 60, x = 1859.7021484375, y= 3673.9252929688, z= 33.699100494385},
    {id = "DigitalDen", name = "DigitalDen", scale = 0.5, color = 5, sprite = 272, x = 1134.6317138672, y= -470.00622558594, z= 66.480033874512},
    {id = "RentalGarage", name = "Car Rental Garage", scale = 0.5, color = 0, sprite = 326, x = 109.93103790283, y= -1089.3804931641, z= 29.302480697632},
    {id = "crabcatching", name = "Crab Catching", scale = 0.5, color = 3, sprite = 304, x = 2235.9765625, y= 4583.70703125, z= 32.192527770996},
    {id = "sellcrabs", name = "Sell Crabs", scale = 0.5, color = 3, sprite = 304, x = 903.13800048828, y= -1723.2022705078, z= 32.159629821777},
    {id = "quarry", name = "Quarry", scale = 0.5, color = 3, sprite = 68, x = 2938.2770996094, y= 2815.2595214844, z= 43.345329284668},
    {id = "quarrysales", name = "Quarry Selling Location", scale = 0.5, color = 3, sprite = 68, x = -2203.4274902344, y= 4245.0751953125, z= 48.153812408447},
  --  {id = "sellturtles", name = "Sell Turtles", scale = 0.5, color = 1, sprite = 465, x = -1082.0241699219, y= -315.50793457031, z= 37.823421478271},
    {id = "bestbuds", name = "Best Buds", scale = 0.5, color = 2, sprite = 469, x = 376.20977783203, y= -828.07543945312, z= 29.302406311035},
    {id = "garbage", name = "Garbage Depo", scale = 0.5, color = 5, sprite = 318, x = -321.43109130859, y= -1545.6550292969, z= 31.021816253662},
    {id = "Diner", name = "Caseys Diner", scale = 0.5, color = 27, sprite = 537, x = 798.53668212891, y= -735.58636474609, z= 27.994478225708},
    {id = "Vultur Lé Culturé", name = "Vultur Lé Culturé", scale = 1, color = 18, sprite = 617, x = -418.55169677734, y= 28.128107070923, z= 46.233901977539},
    --{id = "Dean World", name = "Deans World", scale = 0.5, color = 49, sprite = 538, x = -1668.6220703125, y= -1076.2878417969, z= 13.153369903564},
    {id = "Strip Club", name = "Strip Club", scale = 0.5, color = 50, sprite = 483, x = 124.12086486816, y= -1295.2933349609, z= 36.650444030762},
    {id = "The Taco Farmer", name = "The Taco Farmer", scale = 0.5, color = 5, sprite = 490, x = 15.819478988647, y= -1602.7241210938, z= 29.375900268555},
    {id = "Tuner Shop", name = "Tuner Shop", scale = 3, color = 27, sprite = 531, x = 138.5366973877, y= -3023.888671875, z= 7.0408897399902},
    {id = "Farmers Shop", name = "Farmers Shop", scale = 3, color = 58, sprite = 540, x = 53.289691925049, y= 29.286268234253, z= 29.286268234253},
}



AddEventHandler("plutorp-core:playerSessionStarted", function()
    Citizen.CreateThread(function()
        for k,v in ipairs(blips) do
            MRP.BlipManager:CreateBlip(v.id, v)
        end
    end)
end)
