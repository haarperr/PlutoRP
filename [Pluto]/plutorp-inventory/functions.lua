local fixingvehicle = false
local justUsed = false
local retardCounter = 0
local lastCounter = 0 
local HeadBone = 0x796e;

local validWaterItem = {
    ["oxygentank"] = true,
    ["water"] = true,
    ["vodka"] = true,
    ["beer"] = true,
    ["whiskey"] = true,
    ["coffee"] = true,
    ["bscoffee"] = true,
    ["frappuccino"] = true,
    ["fishtaco"] = true,
    ["taco"] = true,
    ["burrito"] = true,
    ["churro"] = true,
    ["hotdog"] = true,
    ["greencow"] = true,
    ["donut"] = true,
    ["eggsbacon"] = true,
    ["icecream"] = true,
    ["mshake"] = true,
    ["sandwich"] = true,
    ["hamburger"] = true,
    ["cola"] = true,
    ["sprunk"] = true,
    ["jailfood"] = true,
    ["bleederburger"] = true,
    ["heartstopper"] = true,
    ["torpedo"] = true,
    ["meatfree"] = true,
    ["moneyshot"] = true,
    ["fries"] = true,
    ["slushy"] = true,
    ["softdrink"] = true,
    ["ramen"] = true,
    ["muffin"] = true,
    ["maccheese"] = true,
}

RegisterNetEvent('RunUseItem')
AddEventHandler('RunUseItem', function(itemid, slot, inventoryName, isWeapon)
    if itemid == nil then
        return
    end
    local ItemInfo = GetItemInfo(slot)
    if tonumber(ItemInfo.quality) ~= nil then
        if tonumber(ItemInfo.quality) < 1 then
            TriggerEvent("DoLongHudText","Item is too worn.", 2) 
            if isWeapon then
                TriggerEvent("brokenWeapon")
            end
            return
        end
    end

    if justUsed then
        retardCounter = retardCounter + 1
        if retardCounter > 10 and retardCounter > lastCounter+5 then
            lastCounter = retardCounter
            TriggerServerEvent("exploiter", "Tried using " .. retardCounter .. " items in < 500ms ")
        end
        return
    end

    justUsed = true

    if (not hasEnoughOfItem(itemid,1,false)) then
        TriggerEvent("DoLongHudText","You dont appear to have this item on you?",2) 
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == "-72657034" then
        TriggerEvent("equipWeaponID",itemid,ItemInfo.information,ItemInfo.id)
        TriggerEvent("inventory:removeItem",itemid, 1)
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if not isValidUseCase(itemid,isWeapon) then
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if (itemid == nil) then
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    
    if (isWeapon) then
        TriggerEvent("equipWeaponID",itemid,ItemInfo.information,ItemInfo.id)
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end



    TriggerEvent("hud-display-item",itemid,"Used")

    Wait(800)

    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)

    if (not IsPedInAnyVehicle(player)) then
        if (itemid == "Suitcase") then
            TriggerEvent('attach:suitcase')
        end

        if (itemid == "Boombox") then
                TriggerEvent('attach:boombox')
        end
        if (itemid == "Box") then
                TriggerEvent('attach:box')
        end
        if (itemid == "DuffelBag") then
                TriggerEvent('attach:blackDuffelBag')
        end
        if (itemid == "MedicalBag") then
                TriggerEvent('attach:medicalBag')
        end
        if (itemid == "SecurityCase") then
                TriggerEvent('attach:securityCase')
        end
        if (itemid == "Toolbox") then
                TriggerEvent('attach:toolbox')
        end
    end

    RegisterCommand('notify', function(source, args)
        TriggerEvent("DoLongHudText","Start collecting evidence!",1) 
    end)

    local remove = false
    local itemreturn = false
    local drugitem = false
    local fooditem = false
    local drinkitem = false
    local healitem = false

    if (itemid == "hunting_bait") then
        TriggerEvent("plutorp-hunting:startHunting")
     end
 
  if (itemid == "hunting_knife") then
         TriggerEvent("plutorp-hunting:startSkinning")
     end
 
    if (itemid == "joint" or itemid == "joint2g" or itemid == "weed5oz" or itemid == "weedq" or itemid == "beer" or itemid == "vodka" or itemid == "whiskey" or itemid == "lsdtab") then
        drugitem = true
    end

    if (itemid == "fakeplate") then
      TriggerEvent("fakeplate:change")
    end

    if (itemid == "tuner") then

      local finished = exports["plutorp-taskbar"]:taskBar(2000,"Connecting Tuner Laptop",false,false,playerVeh)
      if (finished == 100) then
        TriggerEvent("tuner:open")
      end
    end

    if (itemid == "electronickit" or itemid == "lockpick") then
      TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
      
    end
    if (itemid == "locksystem") then
      TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end

    if (itemid == "thermite") then
      TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end

    if(itemid == "evidencebag") then
        TriggerEvent("evidence:startCollect", itemid, slot)
        local itemInfo = GetItemInfo(slot)
        local data = itemInfo.information
        if data == '{}' then
            TriggerEvent("DoLongHudText","Start collecting evidence!",1) 
            TriggerEvent("inventory:updateItem", itemid, slot, '{"used": "true"}')
        end
    end

    if (itemid == "lsdtab" or itemid == "badlsdtab") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["plutorp-taskbar"]:taskBar(3000,"Placing LSD Strip on 👅",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",24,1200)
            TriggerEvent("fx:run", "lsd", 180, nil, (itemid == "badlsdtab" and true or false))
            remove = true
        end
    end

   
    if (itemid == "pix1") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["plutorp-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("Crypto:GivePixerium",math.random(1,2))
            remove = true
          end
      end
    end  

    if (itemid == "radio") then
        TriggerEvent('radioGui')
    end

    if (itemid == "pdradio") then
        TriggerEvent('radioGui')
    end

    if (itemid == "pix2") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["plutorp-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("Crypto:GivePixerium",math.random(5,12))
            remove = true
          end
      end
    end

    if (itemid == "femaleseed") then
       TriggerEvent("plutorp-state:stateSet",4,1600)
       TriggerEvent("plutorp-weed:plantSeed", itemid)
    end

    if (itemid == "maleseed") then
        TriggerEvent("plutorp-state:stateSet",4,1600)
        TriggerEvent("plutorp-weed:plantSeed", itemid)
    end

    if (itemid == "weedoz") then
      local finished = exports["plutorp-taskbar"]:taskBar(5000,"Packing Q Bags",false,false,playerVeh)
        if (finished == 100) then
            CreateCraftOption("weedq", 40, true)
        end
        
    end

    if ( itemid == "smallbud" and hasEnoughOfItem("qualityscales",1,false) ) then
        local finished = exports["plutorp-taskbar"]:taskBar(1000,"Packing Joint",false,false,playerVeh)
        if (finished == 100) then
            CreateCraftOption("joint2", 80, true)    
        end
    end

    if ( itemid == "boxofweed" and hasEnoughOfItem("qualityscales",1,false) ) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Breaking Brick",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("player:receiveItem", "weedq", math.random(50, 75))
            TriggerEvent("inventory:removeItem", "boxofweed", 1)
        end
    end

    if ( itemid == "pokemonfolder" ) then
       TriggerEvent('pokemon-folder')
    end

    if ( itemid == "materialcrate" ) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Opening Crate",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("player:receiveItem", "electronics", math.random(25,75))
            TriggerEvent("player:receiveItem", "rubber", math.random(15,50))
            TriggerEvent("player:receiveItem", "aluminium", math.random(10,50))
            TriggerEvent("inventory:removeItem","materialcrate", 1)     
        end
    end

    if ( itemid == "Bankbox" ) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Attempting to crack open!",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("player:receiveItem", "cashroll", math.random(40,60))
            TriggerEvent("player:receiveItem", "cashstack", math.random(50,70))
            TriggerEvent("player:receiveItem", "goldbar", math.random(2,15))
            TriggerEvent("player:receiveItem","rolexwatch", math.random(2,15)) 
            TriggerEvent("inventory:removeItem","bankbox", 1)
        end
    end

    if ( itemid == "weaponbox" ) then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Opening Box",false,false,playerVeh)
        if (finished == 100) then
            local roll = math.random(2)
            if roll == 1 then
            TriggerEvent("player:receiveItem", "-771403250", 1)
            TriggerEvent("player:receiveItem", "pistolammo", math.random(1,5))
            TriggerEvent("inventory:removeItem","weaponbox", 1)    
        elseif roll == 2 then
            TriggerEvent("player:receiveItem", "584646201", 1)
            TriggerEvent("player:receiveItem", "pistolammo", math.random(1,5))
            TriggerEvent("inventory:removeItem","weaponbox", 1)    
           end
        end
    end

    if (itemid == "weedq") then
        local finished = exports["plutorp-taskbar"]:taskBar(1000,"Rolling Joints",false,false,playerVeh)
        if (finished == 100) then
            CreateCraftOption("joint", 80, true)    
        end
    end

    if (itemid == "lighter") then
        TriggerEvent("animation:PlayAnimation","lighter")
          local finished = exports["plutorp-taskbar"]:taskBar(2000,"Starting Fire",false,false,playerVeh)
        if (finished == 100) then
            
        end
    end

    if (itemid == "joint2") then
        if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
            local finished = exports["plutorp-taskbar"]:taskBar(5000,"Smoking Joint",false,false,playerVeh,false,true)
            local armour =  GetPedArmour(PlayerPedId())
            if (finished == 100) then
                if exports["plutorp-inventory"]:getQuantity("joint") > 0 then
                    TriggerEvent("client:newStress", false, 1000, false)
                    TriggerEvent("DoLongHudText", "Stress Relieved")
                    if armour >= 60 then
                    
                        SetPedArmour(PlayerPedId(), 60)
                    else
                    
                        SetPedArmour(PlayerPedId(), armour + 15)
                        local newArmour =  GetPedArmour(PlayerPedId())
                        if newArmour >= 60 then
                            SetPedArmour(PlayerPedId(), 60)
                        end
                    end
                    remove = true
                end
            end
        elseif GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
            TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
            local finished = exports["plutorp-taskbar"]:taskBar(5000,"Smoking Joint",false,false,playerVeh,false,true)
            if (finished == 100) then
                if exports["plutorp-inventory"]:getQuantity("joint2") > 0 then
                    TriggerEvent("client:newStress", false, 1000, false)
                    TriggerEvent("DoLongHudText", "Stress Relieved")
                    local armour =  GetPedArmour(PlayerPedId())
                    if armour >= 60 then
                        SetPedArmour(PlayerPedId(), 60)
                    else
                        SetPedArmour(PlayerPedId(), armour + 15)
                        local newArmour =  GetPedArmour(PlayerPedId())
                        if newArmour >= 60 then
                            SetPedArmour(PlayerPedId(), 60)
                        end
                    end
                    remove = true
                end           
            end
        end
    end

    if (itemid == "joint") then
        if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
            local finished = exports["plutorp-taskbar"]:taskBar(5000,"Smoking Joint",false,false,playerVeh,false,true)
            local armour =  GetPedArmour(PlayerPedId())
            if (finished == 100) then
                if exports["plutorp-inventory"]:getQuantity("joint") > 0 then
                    TriggerEvent("client:newStress",false, 1000)
                    TriggerEvent("DoLongHudText", "Stress Relieved")
                    if armour >= 60 then
                    
                        SetPedArmour(PlayerPedId(), 60)
                    else
                    
                        SetPedArmour(PlayerPedId(), armour + 15)
                        local newArmour =  GetPedArmour(PlayerPedId())
                        if newArmour >= 15 then
                            SetPedArmour(PlayerPedId(), 60)
                        end
                    end
                    remove = true
                end
            end
        elseif GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
            TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
            local finished = exports["plutorp-taskbar"]:taskBar(5000,"Smoking Joint",false,false,playerVeh,false,true)
            if (finished == 100) then
                if exports["plutorp-inventory"]:getQuantity("joint") > 0 then
                    TriggerEvent("client:newStress",false, 1000)
                    TriggerEvent("DoLongHudText", "Stress Relieved")
                    local armour =  GetPedArmour(PlayerPedId())
                    if armour >= 60 then
                        SetPedArmour(PlayerPedId(), 60)
                    else
                        SetPedArmour(PlayerPedId(), armour + 15)
                        local newArmour =  GetPedArmour(PlayerPedId())
                        if newArmour >= 60 then
                            SetPedArmour(PlayerPedId(), 60)
                        end
                    end
                    remove = true
                end           
            end
        end
    end


    if (itemid == "fishingrod") then
        TriggerEvent("plutorp-fish:tryToFish")
    end
    

    if (itemid == "mugbeer" or itemid == "vodka" or itemid == "beer" or itemid == "whiskey" or itemid == "tequila" or itemid == "redwine" or itemid == "wineglass" or itemid == "rum" or itemid == "tequilashot" or itemid == "whitewine") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","changethirst",true,itemid,playerVeh)
        TriggerEvent("Evidence:StateSet", 8, 600)
        local alcoholStrength = 0.5
        if itemid == "vodka" or itemid == "whiskey" or itemid == 'tequila' or itemid == "redwine" or itemid == "wineglass" or itemid == "rum" or itemid == "tequilashot" or itemid == "whitewine" then alcoholStrength = 1.0 end
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength)
    end

    if (itemid == "coffee") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","coffee:drink",true,itemid,playerVeh)
    end

    if (itemid == "bscoffee" or itemid == "frappuccino") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","coffee:drink2",true,itemid,playerVeh)
    end


    if (itemid == "fishtaco") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:FishTaco",true,itemid,playerVeh)
    end

    if (itemid == "taco" or itemid == "burrito") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:Taco",true,itemid,playerVeh)
    end

    if (itemid == "churro" or itemid == "hotdog") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:Condiment",true,itemid,playerVeh)
    end

    if (itemid == "greencow") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","food:Condiment",true,itemid,playerVeh)
    end

    if (itemid == "donut" or itemid == "eggsbacon") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:Condiment",true,itemid,playerVeh)
    end

    if (itemid == "icecream" or itemid == "mshake") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:IceCream",true,itemid,playerVeh)
    end

    -- Pokemon

    if (itemid == "shiningpack") then 
        TriggerEvent('pokemon:openPack', itemid)
    end
    
    if (itemid == "bulbasaur") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "ivysaur") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "shroomish") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "breloom") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "torkoal") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 
    
    if (itemid == "larvesta") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end    

    if (itemid == "litten") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "torracat") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "totodile") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "croconaw") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "qwilfish") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "buizel") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "pikachu") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "voltorb") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "plusle") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "minun") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "ekans") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "jynx") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "golett") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 
    
    if (itemid == "stunfisk") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "purrloin") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "scraggy") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "zorua") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "shaymin") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "virizion") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "reshiram") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "palkia") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "manaphy") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "keldeo") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "raikou") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "zekrom") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "latios") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "marshadow") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "yveltal") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "hoopa") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "genesect") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end
    
    if (itemid == "volcanion") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "mew") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "jiranchi") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "rayquaza") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "arceus") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "venusaur") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "carnivine") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "volcarona") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "incineroar") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "feraligatr") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "floatzel") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end
    
    if (itemid == "electrode") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "arbok") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "golurk") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "spiritomb") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "liepard") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "scrafty") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "safecracker") then 
        TriggerEvent('inv:advancedLockpick',inventoryName,slot)
    end

    if (itemid == "advlockpick") then
             
        local myJob = exports["plutorp_manager"]:isPed("myJob")
        if myJob ~= "news" then
        else
            TriggerEvent("DoLongHudText","Nice news reporting, you shit lord idiot.")
        end   

    end


    if (itemid == "Gruppe6Card") then
        if exports["plutorp_manager"]:isPed("countpolice") >= 3 then
        local coordA = GetEntityCoords(PlayerPedId(), 1)
        local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
        -- local countpolice = exports["plutorp_manager"]:isPed("countpolice")
        local targetVehicle = getVehicleInDirection(coordA, coordB)
        if targetVehicle ~= 0 and GetHashKey("stockade") == GetEntityModel(targetVehicle) then
            local entityCreatePoint = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0, -4.0, 0.0)
            local coords = GetEntityCoords(PlayerPedId())
            local aDist = GetDistanceBetweenCoords(coords["x"], coords["y"],coords["z"], entityCreatePoint["x"], entityCreatePoint["y"],entityCreatePoint["z"])
            local cityCenter = vector3(-204.92, -1010.13, 29.55) -- alta street train station
            local timeToOpen = 45000
            local distToCityCenter = #(coords - cityCenter)
            if distToCityCenter > 1000 then
                local multi = math.floor(distToCityCenter / 1000)
                timeToOpen = timeToOpen + (30000 * multi)
            end
            if aDist < 2.0 then
                --TriggerEvent("alert:noPedCheck", "banktruck")
                local finished = exports["plutorp-taskbar"]:taskBar(timeToOpen,"Unlocking Vehicle",false,false,playerVeh)
                if finished == 100 then
                    remove = true
                    TriggerEvent("sec:AttemptHeist", targetVehicle)
                else
                    TriggerEvent("evidence:bleeding")
                end

            else
                TriggerEvent("DoLongHudText","You need to do this from behind the vehicle.")
            end
        end
    end
    end


    if (itemid == "heavyammo") then
        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1788949567,50,true)
            remove = true
        end
    end

    if (itemid == "pistolammo") then
        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1950175060,50,true)
            remove = true
        end
    end

    if (itemid == "pistolammocrim") then
        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1950175060,50,true)
            remove = true
        end
    end

    -- if (itemid == "snowballammo") then
    --     local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
    --     if (finished == 100) then
    --         TriggerEvent("actionbar:ammo", `AMMO_SNOWBALL_2`, 50, true)
    --         remove = true
    --     end
    -- end

    if (itemid == "rifleammo") then
        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    if (itemid == "rifleammocrim") then
        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    -- if (itemid == "sniperammo") then
    --     local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
    --     if (finished == 100) then
    --         TriggerEvent("actionbar:ammo",1285032059,5,true)
    --         remove = true
    --     end
    -- end

    if (itemid == "shotgunammo") then
        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",-1878508229,50,true)
            remove = true
        end
    end

    if (itemid == "subammo" or itemid == "subammo2") then
        local finished = exports["plutorp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1820140472,50,true)
            remove = true
        end
    end

    if (itemid == "armor" or itemid == "pdarmor") then
        RequestAnimDict("clothingshirt")
        while not HasAnimDictLoaded("clothingshirt") do
          Citizen.Wait(100)
        end
        TaskPlayAnim(GetPlayerPed(PlayerId()), "clothingshirt", "try_shirt_positive_d", 1.0, -1, -1, 50, 0, 0, 0, 0)
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Putting on Armor",true,false,playerVeh)
        if (finished == 100) then
            StopAnimTask(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 1.0)
            SetPlayerMaxArmour(PlayerId(), 60)
            SetPedArmour( player, 60)
            TriggerEvent("UseBodyArmor")
            remove = true
        end
    end


    if (itemid == "cbrownie" or itemid == "cgummies") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["plutorp-taskbar"]:taskBar(3000,"Consuming edibles 😉",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("Evidence:StateSet",3,1200)
            TriggerEvent("Evidence:StateSet",7,1200)
            TriggerEvent("fx:run", "weed", 180, -1, false)
            remove = true
        end
    end

    if (itemid == "pd_badge") then
        local ItemInfo = GetItemInfo(slot)
        TriggerServerEvent("plutorp-badge:server:useitem", ItemInfo.information)
    end

    if (itemid == "laptop1") then
        TriggerEvent("plutorp-robbery:usb")
    end

    if (itemid == "BobCatCard") then
        TriggerEvent('OpenDoorToGuards')
    end

    if (itemid == "thermalcharge") then
        TriggerEvent('plutorp-firstdoor')
    end

    if (itemid == "thermalcharge") then
        TriggerEvent('plutorp-secondoor')
    end

    if (itemid == "BobCatCard") then 
        TriggerEvent('plutorp-thirddoor')
    end

    if (itemid == "usbdevice") then 
        TriggerEvent('plutorp:lesterscomputer')
    end

    if (itemid == "boostingpad") then
        TriggerEvent('pluto:open-importui')
        print('10')
    end

    if (itemid == "rustyweapon") then
        if exports["plutorp-inventory"]:hasEnoughOfItem("polishkit",1,false) then 
            TriggerEvent("plutorptingyo")
        else
            TriggerEvent('DoLongHudText', 'You need a polishing kit', 2)
        end
    end

    if (itemid == "Box") then
        TriggerEvent("boxtingyo")
    end

    if (itemid == "taserammo") then
        local finished = exports["plutorp-taskbar"]:taskBar(2000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",-1575030772,3,true)
            remove = true
        end
    end
    
   
    if (itemid == "backpack") then
        local finished = exports["plutorp-taskbar"]:taskBar(7500,"Unzipping Backpack")
        if (finished == 100) then
            remove = true
            TriggerEvent("player:receiveItem", "mobilephone", 1) 
            TriggerEvent("player:receiveItem", "radio", 1)
            TriggerEvent("player:receiveItem", "idcard", 1)
            TriggerEvent("player:receiveItem", "sandwich", 2)
            TriggerEvent("player:receiveItem", "water", 2)
            TriggerEvent("player:receiveItem", "fishingrod", 1)
            TriggerEvent("player:receiveItem", "shiningpack", 1)
            TriggerEvent("player:receiveItem", "fountain", 1)
            TriggerEvent("DoLongHudText", "Welcome to the City if you are new we hope you enjoy your stay!", 1)
        end
    end
    if (itemid == "bodybag2") then
        local finished = exports["plutorp-taskbar"]:taskBar(10000,"Opening bag",true,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent( "player:receiveItem", "corpsefeet", 1 )
            TriggerEvent( "player:receiveItem", "corpsehands", 1 )
            TriggerEvent( "player:receiveItem", "corpsefeet", 1 )
        end
    end

    if (itemid == "binoculars") then 
        TriggerEvent("binoculars:Activate")
        
    end

    if (itemid == "camera") then
        TriggerEvent("camera:Activate")
    end

    if (itemid == "nitrous") then
        local currentVehicle = GetVehiclePedIsIn(player, false)
        
        if not IsToggleModOn(currentVehicle,18) then
            TriggerEvent("DoLongHudText","You need a Turbo to use NOS!",2)
        else
            local finished = 0
            local cancelNos = false
            Citizen.CreateThread(function()
                while finished ~= 100 and not cancelNos do
                    Citizen.Wait(100)
                    if GetEntitySpeed(GetVehiclePedIsIn(player, false)) > 11 then
                        exports["plutorp-taskbar"]:closeGuiFail()
                        cancelNos = true
                    end
                end
            end)
            finished = exports["plutorp-taskbar"]:taskBar(20000,"Nitrous")
            if (finished == 100 and not cancelNos) then
                TriggerEvent("NosStatus")
                TriggerEvent("noshud", 100, false)
                remove = true
            else
                TriggerEvent("DoLongHudText","You can't drive and hook up nos at the same time.",2)
            end
        end
    end

    -- crab shit

    if (itemid == "crabcage") then   --- still need to do
        TriggerEvent("DoLongHudText", "Go to paleto and start catching crabs.", 1)
    end

    if (itemid == "lockpick") then
        TriggerEvent("inv:lockPick",false,inventoryName,slot)
        TriggerEvent('houseRobberies:attempt')
        TriggerEvent('plutorp-vault:lockpickDoor')
    end
    
    if (itemid == "umbrella") then
        TriggerEvent("animation:PlayAnimation","umbrella")
        
    end

    if (itemid == "repairkit") then
      TriggerEvent('veh:repairing',inventoryName,slot,itemid)
           
    end

    if (itemid == "rocket")  then
        TriggerEvent("fireworks:rocket")
    end

    if (itemid == "firework1")  then
        TriggerEvent("fireworks:box")
    end
    if (itemid == "firework2")  then
        TriggerEvent("fireworks:cylinder")
    end
    if (itemid == "fountain")  then
        TriggerEvent("fireworks:cone")
    end

    if (itemid =="advrepairkit") then
      TriggerEvent('veh:repairing',inventoryName,slot,itemid)
           
    end
    if (itemid == "securityblue" or itemid == "securityblack" or itemid == "securitygreen" or itemid == "securitygold" or itemid == "securityred")  then
        -- TriggerEvent("robbery:scanLock",false,itemid)       
        TriggerEvent("plutorp-robbery:UseFleecaCardA")
    end

    if (itemid == "Gruppe6Card2")  then
        TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end

    if (itemid == "Gruppe6Card222")  then
        TriggerServerEvent("robbery:triggerItemUsedServer",itemid)

    end    

    if (itemid == "Gruppe6Card22")  then
        TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end    

    if (itemid == "ciggy") then
        if GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
            TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING", 0,"Smoke")
            local finished = exports["plutorp-taskbar"]:taskBar(15000,"Smoking Ciggy",false,false,playerVeh,false,true)
            if (finished == 100) then
                if exports["plutorp-inventory"]:getQuantity("ciggy") > 0 then
                    TriggerEvent("client:newStress", false, 750, false)
                    remove = true
                end
            end
        end
    end

    if (itemid == "cigar") then
        local finished = exports["plutorp-taskbar"]:taskBar(1000,"Lighting Up",false,false,playerVeh)
        if (finished == 100) then
            Wait(300)
            TriggerEvent("animation:PlayAnimation","cigar")
        end
    end

    if (itemid == "oxygentank") then
        local finished = exports["plutorp-taskbar"]:taskBar(100,"Oxygen Tank",true,false,playerVeh)
        if (finished == 100) then        
            TriggerEvent("UseOxygenTank")
            remove = true
        end
    end

    if (itemid == "bandage") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,10000,"Healing","healed:minors",true,itemid,playerVeh)
    end

    if (itemid == "firstaid") then
        --TriggerEvent("attachItemObjectnoanim","healthpack01")
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,6550,"Healing","healed:minors",true,itemid,playerVeh)
    end

    -- if (itemid == "coke50g") then
    --     CreateCraftOption("coke5g", 80, true)
        
    -- end

    if ( itemid == "coke50g" and hasEnoughOfItem("qualityscales",1,false) and hasEnoughOfItem("drugbaggy",25,false) ) then
        local finished = exports["plutorp-taskbar"]:taskBar(7500,"Packing Cocaine",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("inventory:removeItem", "coke50g", 1)
            TriggerEvent("inventory:removeItem", "drugbaggy", 25)
            TriggerEvent( "player:receiveItem","1gcocaine", math.random(20, 25) ) 
        end
    end

    -- if (itemid == "glucose") then 
    --     CreateCraftOption("1gcocaine", 80, true)
        
    -- end

    if (itemid == "idcard") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerServerEvent("police:showID",ItemInfo.information)   
    end

    if (itemid == "1gcocaine") then
        TriggerEvent("attachItemObjectnoanim","drugpackage01")
        TriggerEvent("Evidence:StateSet",2,1200)
        TriggerEvent("Evidence:StateSet",6,1200)
        TaskItem("anim@amb@nightclub@peds@", "missfbi3_party_snort_coke_b_male3", 49, 5000, "Coke Gaming", "hadcocaine", true,itemid,playerVeh)
    end

    if (itemid == "1gcrack") then 
        TriggerEvent("attachItemObjectnoanim","crackpipe01")
        TriggerEvent("Evidence:StateSet",2,1200)
        TriggerEvent("Evidence:StateSet",6,1200)
        TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 5000, "Smoking Quack", "hadcrack", true,itemid,playerVeh)
    end

    if (itemid == "treat") then
        local model = GetEntityModel(player)
        if model == GetHashKey("a_c_chop") then
            TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 1200, "Treat Num's", "hadtreat", true,itemid,playerVeh)
        end
    end

    if (itemid == "IFAK") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,1000,"Applying IFAK","healed:useOxy",true,itemid,playerVeh)
    end


    if (itemid == "oxy") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["plutorp-taskbar"]:taskBar(1500,"Popping oxy")
        if finished == 100 then
        TriggerEvent("useOxy")
        TriggerEvent("healed:useOxy")
        TriggerEvent("client:newStress",false,300)
        remove = true
    end
end  

    if (itemid == "painkiller") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["plutorp-taskbar"]:taskBar(3000,"Popping painkiller")
        if finished == 100 then
            TriggerEvent("useOxy")
            TriggerEvent("healed:useOxy")
            TriggerEvent("client:newStress",false,300)
            remove = true
        end
    end

    if (itemid == "sandwich" or itemid == "hamburger" or itemid == "chips" or itemid == "chocobar") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","changehunger",true,itemid,playerVeh)
    end

    if (itemid == "cola" or itemid == "sprunk" or itemid == "water" or itemid == "softdrink") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@beer@female@idle_a", "idle_e", 49,6000,"Drinking","changethirst",true,itemid,playerVeh)
    end


    if (itemid == "icecream2" or itemid == "nachos" or itemid == "popsicle" or itemid == "jailfood" or itemid == "bleederburger" or itemid == "heartstopper" or itemid == "torpedo" or itemid == "meatfree" or itemid == "moneyshot" or itemid == "fries" or itemid == "ramen" or itemid == "muffin" or itemid == "maccheese") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 6000, "Eating", "inv:wellfed", true,itemid)
    end

    if (itemid == "methbag" or itemid == "1gmeth") then
        local finished = exports["plutorp-taskbarplus"]:taskBar(2500,10)
        if (finished == 100) then  
            TriggerEvent("attachItemObjectnoanim","crackpipe01")
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",6,1200)
            TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 1500, "💩 Smoking Meth 💩", "hadcocaine", true, itemid,playerVeh)
        end
    end


    if itemid == "slushy" then
        TriggerEvent("healed:useOxy")
        AttachPropAndPlayAnimation("amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,"Eating", "inv:wellfed",true,itemid,playerVeh)
    end

    if itemid == "Headphones" then
        TriggerEvent("attemt:play:song")
    end


    if (itemid == "shitlockpick") then
        lockpicking = true
        TriggerEvent("animation:lockpickinvtestoutside") 
        local finished = exports["plutorp-taskbarplus"]:taskBar(2500,math.random(5,20))
        if (finished == 100) then    
            TriggerEvent("police:uncuffMenu")
        end
        lockpicking = false
        remove = true
    end

    if (itemid == "watch") then
        TriggerEvent("carHud:compass")
    end

    if (itemid == "harness") then
        local currentVehicle = GetVehiclePedIsIn(player, false)

        local finished = 0
        local cancelHarness = false
        Citizen.CreateThread(function()
            while finished ~= 100 and not cancelHarness do
                Citizen.Wait(100)
                if GetEntitySpeed(GetVehiclePedIsIn(player, false)) > 11 then
                    exports["plutorp-taskbar"]:closeGuiFail()
                    cancelHarness = true
                end
            end
        end)
        finished = exports["plutorp-taskbar"]:taskBar(20000,"Harness")
        if (finished == 100 and not cancelHarness) then
            TriggerEvent("vehicle:addHarness")
            TriggerEvent("harness", false, 100)
            remove = true
        else
            TriggerEvent("DoLongHudText","You can't drive and wear your harness at the same time",2)
        end
    end

    if remove then
        TriggerEvent("inventory:removeItem",itemid, 1)
    end

    Wait(500)
    retardCounter = 0
    justUsed = false


end)

function AttachPropAndPlayAnimation(dictionary,animation,typeAnim,timer,message,func,remove,itemid,vehicle)
    if itemid == "hamburger" or itemid == "heartstopper" or itemid == "bleederburger" or itemid == "muffin" or itemid == "maccheese" or itemid == "ramen" then
        TriggerEvent("attachItem", "hamburger")
    elseif itemid == "sandwich" then
        TriggerEvent("attachItem", "sandwich")
    elseif itemid == "donut" then
        TriggerEvent("attachItem", "donut")
    elseif itemid == "water" or itemid == "cola" or itemid == "sprunk" or itemid == "vodka" or itemid == "whiskey" or itemid == "beer" or itemid == "coffee" or itemid == "softdrink" then
        TriggerEvent("attachItem", itemid)
    elseif itemid == "fishtaco" or itemid == "taco" then
        TriggerEvent("attachItem", "taco")
    elseif itemid == "greencow" then
        TriggerEvent("attachItem", "energydrink")
    elseif itemid == "slushy" or itemid == "wineglass" or itemid == "redwine" or itemid == "tequila" or itemid == "rum" or itemid == "tequilashot" or itemid == "whitewine" then
        TriggerEvent("attachItem", "cup")
    end
    TaskItem(dictionary, animation, typeAnim, timer, message, func, remove, itemid,vehicle)
    TriggerEvent("destroyProp")
end

RegisterNetEvent('randPickupAnim')
AddEventHandler('randPickupAnim', function()
    loadAnimDict('pickup_object')
    TaskPlayAnim(PlayerPedId(),'pickup_object', 'putdown_low',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent('silencer:crafting')
AddEventHandler('silencer:crafting', function()
    TriggerEvent("server-inventory-open", "9999", "Craft")
end)

RegisterNetEvent('weapon:crafting')
AddEventHandler('weapon:crafting', function()
    TriggerEvent("server-inventory-open", "1000", "Craft")
end)

local clientInventory = {};
RegisterNetEvent('current-items')
AddEventHandler('current-items', function(inv)
    clientInventory = inv
end)



RegisterNetEvent('SniffRequestCID')
AddEventHandler('SniffRequestCID', function(src)
    local cid = exports["plutorp_manager"]:isPed("cid")
    TriggerServerEvent("SniffCID",cid,src)
end)

function GetItemInfo(checkslot)
    for i,v in pairs(clientInventory) do
        if (tonumber(v.slot) == tonumber(checkslot)) then
            local info = {["information"] = v.information,["id"] = v.id, ["quality"] = v.quality }
            return info
        end
    end
    return "No information stored";
end

-- item id, amount allowed, crafting.
function CreateCraftOption(id, add, craft)
    TriggerEvent("CreateCraftOption", id, add, craft)
end

-- Animations
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function TaskItem(dictionary,animation,typeAnim,timer,message,func,remove,itemid,playerVeh,itemreturn,itemreturnid)
    loadAnimDict( dictionary ) 
    TaskPlayAnim( PlayerPedId(), dictionary, animation, 8.0, 1.0, -1, typeAnim, 0, 0, 0, 0 )
    local timer = tonumber(timer)
    if timer > 0 then
        local finished = exports["plutorp-taskbar"]:taskBar(timer,message,true,false,playerVeh)
        if finished == 100 or timer == 0 then
            TriggerEvent(func)

            if remove then
                TriggerEvent("inventory:removeItem",itemid, 1)
            end
            if itemreturn then
                TriggerEvent( "player:receiveItem",itemreturnid, 1 )
            end

        end
    else
        TriggerEvent(func)
    end
end



function GetCurrentWeapons()
    local returnTable = {}
    for i,v in pairs(clientInventory) do
        if (tonumber(v.item_id)) then
            local t = { ["hash"] = v.item_id, ["id"] = v.id, ["information"] = v.information, ["name"] = v.item_id, ["slot"] = v.slot }
            returnTable[#returnTable+1]=t
        end
    end   
    if returnTable == nil then 
        return {}
    end
    return returnTable
end

function getQuantity(itemid)
    local amount = 0
    for i,v in pairs(clientInventory) do
        if (v.item_id == itemid) then
            amount = amount + v.amount
        end
    end
    return amount
end

function hasEnoughOfItem(itemid,amount,shouldReturnText)
    if shouldReturnText == nil then shouldReturnText = true end
    if itemid == nil or itemid == 0 or amount == nil or amount == 0 then if shouldReturnText then TriggerEvent("DoLongHudText","I dont seem to have " .. itemid .. " in my pockets.",2) end return false end
    amount = tonumber(amount)
    local slot = 0
    local found = false

    if getQuantity(itemid) >= amount then
        return true
    end
    if (shouldReturnText) then
        -- TriggerEvent("DoLongHudText","I dont have enough of that item...",2) 
    end    
    return false
end


function isValidUseCase(itemID,isWeapon)
    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)
    if playerVeh ~= 0 then
        local model = GetEntityModel(playerVeh)
        if IsThisModelACar(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model) then
            if IsEntityInAir(playerVeh) then
                Wait(1000)
                if IsEntityInAir(playerVeh) then
                    TriggerEvent("DoLongHudText","You appear to be flying through the air",2) 
                    return false
                end
            end
        end
    end

    if not validWaterItem[itemID] and not isWeapon then
        if IsPedSwimming(player) then
            local targetCoords = GetEntityCoords(player, 0)
            Wait(700)
            local plyCoords = GetEntityCoords(player, 0)
            if #(targetCoords - plyCoords) > 1.3 then
                TriggerEvent("DoLongHudText","Cannot be moving while swimming to use this.",2) 
                return false
            end
        end

        if IsPedSwimmingUnderWater(player) then
            TriggerEvent("DoLongHudText","Cannot be underwater to use this.",2) 
            return false
        end
    end

    return true
end





























-- DNA



RegisterNetEvent('evidence:addDnaSwab')
AddEventHandler('evidence:addDnaSwab', function(dna)
    TriggerEvent("DoLongHudText", "DNA Result: " .. dna,1)    
end)

RegisterNetEvent('CheckDNA')
AddEventHandler('CheckDNA', function()
    TriggerServerEvent("Evidence:checkDna")
end)

RegisterNetEvent('evidence:dnaSwab')
AddEventHandler('evidence:dnaSwab', function()
    t, distance = GetClosestPlayer()
    if(distance ~= -1 and distance < 5) then
        TriggerServerEvent("police:dnaAsk", GetPlayerServerId(t))
    else
		TriggerEvent("DoLongHudText", "No player near you!",2)
    end
end)

RegisterNetEvent('evidence:swabNotify')
AddEventHandler('evidence:swabNotify', function()
    TriggerEvent("DoLongHudText", "DNA swab taken.",1)
end)


function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    
    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    
    return closestPlayer, closestDistance
end


-- DNA AND EVIDENCE END

























-- this is the upside down world, be careful.


function getVehicleInDirection(coordFrom, coordTo)
    local offset = 0
    local rayHandle
    local vehicle

    for i = 0, 100 do
        rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)   
        a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        
        offset = offset - 1

        if vehicle ~= 0 then break end
    end
    
    local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
    
    if distance > 25 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end
function DrawText3Ds(x,y,z, text)
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

local burgies = 0
RegisterNetEvent('inv:wellfed')
AddEventHandler('inv:wellfed', function()
    TriggerEvent("Evidence:StateSet",25,3600)
    TriggerEvent("changehunger")
    TriggerEvent("changehunger")
    TriggerEvent("client:newStress", false, 1000, false)
    TriggerEvent("changehunger")
    TriggerEvent("changethirst")
    burgies = 0
end)

RegisterNetEvent('animation:lockpickinvtestoutside')
AddEventHandler('animation:lockpickinvtestoutside', function()
    local lPed = PlayerPedId()
    RequestAnimDict("veh@break_in@0h@p_m_one@")
    while not HasAnimDictLoaded("veh@break_in@0h@p_m_one@") do
        Citizen.Wait(0)
    end
    
    while lockpicking do        
        TaskPlayAnim(lPed, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 16, 0.0, 0, 0, 0)
        Citizen.Wait(2500)
    end
    ClearPedTasks(lPed)
end)

RegisterNetEvent('animation:lockpickinvtest')
AddEventHandler('animation:lockpickinvtest', function(disable)
    local lPed = PlayerPedId()
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end
    if disable ~= nil then
        if not disable then
            lockpicking = false
            return
        else
            lockpicking = true
        end
    end
    while lockpicking do

        if not IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
            ClearPedSecondaryTask(lPed)
            TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    ClearPedTasks(lPed)
end)



RegisterNetEvent('inv:lockPick')
AddEventHandler('inv:lockPick', function(isForced,inventoryName,slot)
    TriggerEvent("robbery:scanLock",true)
    if lockpicking then return end

    lockpicking = true
    playerped = PlayerPedId()
    targetVehicle = GetVehiclePedIsUsing(playerped)
    local itemid = 21

    if targetVehicle == 0 then
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
        targetVehicle = getVehicleInDirection(coordA, coordB)
        local driverPed = GetPedInVehicleSeat(targetVehicle, -1)
        if targetVehicle == 0 then
            lockpicking = false
            TriggerEvent("robbery:lockpickhouse",isForced)
            return
        end

        if driverPed ~= 0 then
            lockpicking = false
            return
        end
            local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
            local leftfront = GetOffsetFromEntityInWorldCoords(targetVehicle, d1["x"]-0.25,0.25,0.0)

            local count = 5000
            local dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
            while dist > 2.0 and count > 0 do
                dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
                Citizen.Wait(1)
                count = count - 1
                DrawText3Ds(leftfront["x"],leftfront["y"],leftfront["z"],"Move here to lockpick.")
            end

            if dist > 2.0 then
                lockpicking = false
                return
            end


            TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
            Citizen.Wait(1000)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            TriggerEvent("animation:lockpickinvtestoutside")
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)



 
            local finished = exports["plutorp-taskbarplus"]:taskBar(15000,3)

            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["plutorp-taskbarplus"]:taskBar(2200,4)

            if finished ~= 100 then
                 lockpicking = false
                return
            end


            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("DoLongHudText", "Vehicle Unlocked.",1)
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.1)

                end
            end
        lockpicking = false
    else
        if targetVehicle ~= 0 and not isForced then

            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
            TriggerEvent("animation:lockpickinvtest")
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)

           
            local carTimer = GetVehicleHandlingFloat(targetVehicle, 'CHandlingData', 'nMonetaryValue')
            if carTimer == nil then
                carTimer = math.random(25000,180000)
            end
            if carTimer < 25000 then
                carTimer = 25000
            end

            if carTimer > 180000 then
                carTimer = 180000
            end
            
            carTimer = math.ceil(carTimer / 3)


            local myJob = exports["plutorp_manager"]:isPed("myJob")
            if myjob == "towtruck" then
                carTimer = 4000
            end

            local finished = exports["plutorp-taskbarplus"]:taskBar(math.random(5000,10000),math.random(10,15))
            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["plutorp-taskbarplus"]:taskBar(math.random(5000,10000),math.random(10,15))
            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["plutorp-taskbarplus"]:taskBar(1500,math.random(5,10))
            if finished ~= 100 then
                TriggerEvent("DoLongHudText", "The lockpick bent out of shape.",2)
                TriggerEvent("inventory:removeItem","lockpick", 1)                
                 lockpicking = false
                return
            end     


            Citizen.Wait(500)
            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    local plate = GetVehicleNumberPlateText(targetVehicle)
                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("keys:addNew",targetVehicle,plate)
                    TriggerEvent("DoLongHudText", "Ignition Working.",1)
                    SetEntityAsMissionEntity(targetVehicle,false,true)
                    SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
                    TriggerEvent("chop:plateoff",plate)

                end
                lockpicking = false
            end
        end
    end
    lockpicking = false
end)

local reapiring = false
RegisterNetEvent('veh:repairing')
AddEventHandler('veh:repairing', function(inventoryName,slot,itemid)
    local playerped = PlayerPedId()
    local coordA = GetEntityCoords(playerped, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)

    local advanced = false
    if itemid == "advrepairkit" then
        advanced = true
    end

    if targetVehicle ~= 0 then

        local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
        local moveto = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0,d2["y"]+0.5,0.2)
        local dist = #(vector3(moveto["x"],moveto["y"],moveto["z"]) - GetEntityCoords(PlayerPedId()))
        local count = 1000
        local fueltankhealth = GetVehiclePetrolTankHealth(targetVehicle)

        while dist > 1.5 and count > 0 do
            dist = #(vector3(moveto["x"],moveto["y"],moveto["z"]) - GetEntityCoords(PlayerPedId()))
            Citizen.Wait(1)
            count = count - 1
            DrawText3Ds(moveto["x"],moveto["y"],moveto["z"],"Move here to repair.")
        end

        if reapiring then return end
        reapiring = true
        
        local timeout = 20

        NetworkRequestControlOfEntity(targetVehicle)

        while not NetworkHasControlOfEntity(targetVehicle) and timeout > 0 do 
            NetworkRequestControlOfEntity(targetVehicle)
            Citizen.Wait(100)
            timeout = timeout -1
        end


        if dist < 1.5 then
            TriggerEvent("animation:repair",targetVehicle)
            fixingvehicle = true

            local repairlength = 1000

            if advanced then
                local timeAdded = 0
                for i=0,5 do
                    if IsVehicleTyreBurst(targetVehicle, i, false) then
                        if IsVehicleTyreBurst(targetVehicle, i, true) then
                            timeAdded = timeAdded + 1200
                        else
                           timeAdded = timeAdded + 800
                        end
                    end
                end
                local fuelDamage = 48000 - (math.ceil(fueltankhealth)*12)
                repairlength = ((3500 - (GetVehicleEngineHealth(targetVehicle) * 3) - (GetVehicleBodyHealth(targetVehicle)) / 2) * 5) + 2000
                repairlength = repairlength + timeAdded + fuelDamage
            else
                local timeAdded = 0
                for i=0,5 do
                    if IsVehicleTyreBurst(targetVehicle, i, false) then
                        if IsVehicleTyreBurst(targetVehicle, i, true) then
                            timeAdded = timeAdded + 1600
                        else
                           timeAdded = timeAdded + 1200
                        end
                    end
                end
                local fuelDamage = 48000 - (math.ceil(fueltankhealth)*12)
                repairlength = ((3500 - (GetVehicleEngineHealth(targetVehicle) * 3) - (GetVehicleBodyHealth(targetVehicle)) / 2) * 3) + 2000
                repairlength = repairlength + timeAdded + fuelDamage
            end



            local finished = exports["plutorp-taskbarplus"]:taskBar(15000,math.random(10,20))
            if finished ~= 100 then
                fixingvehicle = false
                reapiring = false
                ClearPedTasks(playerped)
                return
            end

            if finished == 100 then
                
                local myJob = exports["plutorp_manager"]:isPed("myJob")
                if myJob == "towtruck" then

                    SetVehicleEngineHealth(targetVehicle, 1000.0)
                    SetVehicleBodyHealth(targetVehicle, 1000.0)
                    SetVehiclePetrolTankHealth(targetVehicle, 4000.0)

                    if math.random(100) > 95 then
                        TriggerEvent("inventory:removeItem","advrepairkit",1)
                    end

                else

                    TriggerEvent('veh.randomDegredation',30,targetVehicle,3)

                    if advanced then
                        TriggerEvent("inventory:removeItem","advrepairkit", 1)
                        TriggerEvent('veh.randomDegredation',30,targetVehicle,3)
                        if GetVehicleEngineHealth(targetVehicle) < 900.0 then
                            SetVehicleEngineHealth(targetVehicle, 900.0)
                        end
                        if GetVehicleBodyHealth(targetVehicle) < 945.0 then
                            SetVehicleBodyHealth(targetVehicle, 945.0)
                        end

                        if fueltankhealth < 3800.0 then
                            SetVehiclePetrolTankHealth(targetVehicle, 3800.0)
                        end

                    else

                        local timer = math.ceil(GetVehicleEngineHealth(targetVehicle) * 5)
                        if timer < 2000 then
                            timer = 2000
                        end
                        local finished = exports["plutorp-taskbarplus"]:taskBar(timer,math.random(4,7))
                        if finished ~= 100 then
                            fixingvehicle = false
                            reapiring = false
                            ClearPedTasks(playerped)
                            return
                        end

                        if math.random(100) > 95 then
                            TriggerEvent("inventory:removeItem","advrepairkit",1)
                        end

                        if GetVehicleEngineHealth(targetVehicle) < 200.0 then
                            SetVehicleEngineHealth(targetVehicle, 200.0)
                        end
                        if GetVehicleBodyHealth(targetVehicle) < 945.0 then
                            SetVehicleBodyHealth(targetVehicle, 945.0)
                        end

                        if fueltankhealth < 2900.0 then
                            SetVehiclePetrolTankHealth(targetVehicle, 2900.0)
                        end                        

                        if GetEntityModel(targetVehicle) == `BLAZER` then
                            SetVehicleEngineHealth(targetVehicle, 600.0)
                            SetVehicleBodyHealth(targetVehicle, 800.0)
                        end
                    end                    
                end

                for i = 0, 5 do
                    SetVehicleTyreFixed(targetVehicle, i) 
                end
            end
            ClearPedTasks(playerped)
        end
        fixingvehicle = false
    end
    reapiring = false
end)

-- Animations
RegisterNetEvent('animation:load')
AddEventHandler('animation:load', function(dict)
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end)

RegisterNetEvent('animation:repair')
AddEventHandler('animation:repair', function(veh)
    SetVehicleDoorOpen(veh, 4, 0, 0)
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), veh, 1.0)
    Citizen.Wait(1000)

    while fixingvehicle do
        local anim3 = IsEntityPlayingAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 3)
        if not anim3 then
            TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    SetVehicleDoorShut(veh, 4, 1, 1)
end)


RegisterCommand('steal', function()
    RequestAnimDict("random@shop_robbery")
    while not HasAnimDictLoaded("random@shop_robbery") do
        Citizen.Wait(0)
	end
    t, distance, closestPed = GetClosestPlayer()
    if(distance ~= -1 and distance < 5) then
        local searchPlayerPed = GetPlayerPed(t)
        if ( IsEntityPlayingAnim(GetPlayerPed(t), "dead", "dead_a", 3) or IsEntityPlayingAnim(GetPlayerPed(t), "amb@code_human_cower_stand@male@base", "base", 3) or IsEntityPlayingAnim(GetPlayerPed(t), "amb@code_human_cower@male@base", "base", 3) or  IsEntityPlayingAnim(GetPlayerPed(t), "random@arrests@busted", "idle_a", 3) or IsEntityPlayingAnim(GetPlayerPed(t), "mp_arresting", "idle", 3) or IsEntityPlayingAnim(GetPlayerPed(t), "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(GetPlayerPed(t), "missfbi5ig_22", "hands_up_anxious_scientist", 3) or IsEntityPlayingAnim(GetPlayerPed(t), "missfbi5ig_22", "hands_up_loop_scientist", 3) ) then
            if IsPedArmed(PlayerPedId(), 7) then
                TaskPlayAnim(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 8.0, -8, -1, 16, 0, 0, 0, 0)
                local finished = exports["plutorp-taskbar"]:taskBar(10000,"Robbing Player")
                if (finished == 100) then
                    t, distance, closestPed = GetClosestPlayer()
                    if(distance ~= -1 and distance < 5) then
                        TriggerServerEvent("people-search", GetPlayerServerId(t))
                        TriggerServerEvent("Stealtheybread", GetPlayerServerId(t))
                        TriggerServerEvent("stealcommand:log")
                    else
                        TriggerEvent("DoLongHudText", "No player near you!",2)
                    end
                    ClearPedTasks(PlayerPedId())
                end
            else
                TriggerEvent("DoLongHudText", "You need a weapon!",2)
            end
        end
    end
end)

RegisterCommand("closeinv", function(source, args)
    TriggerEvent("closeInventoryGui")
    OpenInv = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
end)

RegisterNetEvent("plutorptingyo")
AddEventHandler("plutorptingyo", function()
    local finished = exports["plutorp-taskbar"]:taskBar(12000,"Polishing",false,false,playerVeh)
    if (finished == 100) then
        TriggerEvent("inventory:removeItem", "polishkit", 1)
        TriggerEvent("inventory:removeItem", "rustyweapon", 1)
        local roll = math.random(3)
        if roll == 1 then
        TriggerEvent("player:receiveItem", "-771403250", 1)
        elseif roll == 2 then
        TriggerEvent("player:receiveItem", "584646201", 1)          
        elseif roll == 3 then
        TriggerEvent("player:receiveItem", "324215364", 1)
        TriggerEvent("player:receiveItem", "subammo", 1)
    end
end
end)

-- Doors

local Throttles = {}

function Throttled(name, time)
    if not Throttles[name] then
        Throttles[name] = true
        Citizen.SetTimeout(time or 500, function() Throttles[name] = false end)
        return false
    end

    return true
end

RegisterCommand('+useKeyFob', function()
    if Throttled("plutorp-doors:doorKeyFob", 1000) then return end
    if hasEnoughOfItem("casinofob2",1,false) then
        TriggerEvent("plutorp-doors:doorKeyFob")
    else
        TriggerEvent("DoLongHudText", "You need a Keyfob", 2)
        PlaySoundFromEntity(-1, "Keycard_Fail", PlayerPedId(), "DLC_HEISTS_BIOLAB_FINALE_SOUNDS", 1, 5.0);
    end
end, false)


RegisterCommand('-useKeyFob', function() end, false)
Citizen.CreateThread(function()
    exports["plutorp-keymapping"]:registerKeyMapping("", "Vehicle", "Door Keyfob", "+useKeyFob", "-useKeyFob", "Y")
end)