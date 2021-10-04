local isJudge = false
local isPolice = false
local isMedic = false
local isDoctor = false
local isNews = false
local isDead = false
local isInstructorMode = false
local myJob = "unemployed"
local isHandcuffed = false
local isHandcuffedAndWalking = false
local hasOxygenTankOn = false
local TakenOut = false
local NearGarage = false
local gangNum = 0
local cuffStates = {}
local bennyLocation = vector3(-39.09, -1054.17, 27.79)
local bennyLocation2 = vector3(-32.74, -1068.19, 27.79)
local bennyLocationBridge = vector3(727.74, -1088.95, 22.17)
local billyLocationPaleto = vector3(110.8, 6626.46, 31.89)
local bennyLocationMRPD = vector3(450.01, -976.04, 25.03)
local bennyLocationTunershop = vector3(938.37, -970.82, 39.76)
local bennyLocationTunershop2 = vector3(921.81, -984.47, 38.89)
local bennyLocationHayes = vector3(-1417.38, -445.79, 35.30)
local bennyLocationHayes2 = vector3(-1424.19, -449.48, 35.30)
local bennyLocationAutoExotic = vector3(547.25, -189.45, 53.88)
local altaApartments = vector3(-271.04, -957.81, 31.22)


rootMenuConfig =  {
    {
        id = "general",
        displayName = "General",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"general:escort",  "general:checkoverself", "general:emotes", "general:putinvehicle", "general:unseatnearest", "give:number"}
    },
    {
        id = "police-action",
        displayName = "Police Actions",
        icon = "#police-action",
        enableMenu = function()
            return (isPolice and not isDead)
        end,
        subMenus = {"cuffs:remmask", "bill:suspect", "cuffs:checkinventory", "police:panic", "police:gsr", "police:dnaswab", "general:checktargetstates", "police:placespike", "police:removespike", "license:grantWeapon", "license:removeweapons"}
    },
    {
        id = "open-dispatch",
        displayName = "Dispatch",
        icon = "#general-check-over-target",
        functionName = "show:dispatch",
        enableMenu = function()
            return (isPolice and not isDead)
        end
    },
    {
        id = "police-vehicle",
        displayName = "Police Vehicle",
        icon = "#police-vehicle",
        enableMenu = function()
            return (isPolice and not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = {"police:runplate", "police:toggleradar"}
    },
    {
        id = "policeDeadA",
        displayName = "10-13A",
        icon = "#police-dead",
        functionName = "police:tenThirteenA",
        enableMenu = function()
            return (isPolice and isDead)
        end
    },
    {
        id = "policeDeadB",
        displayName = "10-13B",
        icon = "#police-dead",
        functionName = "police:tenThirteenB",
        enableMenu = function()
            return (isPolice and isDead)
        end
    },
    {
        id = "emsDeadA",
        displayName = "10-14A",
        icon = "#ems-dead",
        functionName = "police:tenForteenA",
        enableMenu = function()
            return (isMedic and isDead)
        end
    },
    {
        id = "emsDeadB",
        displayName = "10-14B",
        icon = "#ems-dead",
        functionName = "police:tenForteenB",
        enableMenu = function()
            return (isMedic and isDead)
        end
    },
    {
        id = "animations",
        displayName = "Walking Styles",
        icon = "#walking",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "animations:brave", --[["animations:hurry",]] "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien",
        
        --new
        "animations:arrogant","animations:casual","animations:casual2","animations:casual3","animations:casual4","animations:casual5","animations:casual6","animations:confident","animations:business2","animations:business3","animations:femme","animations:flee","animations:gangster","animations:gangster2","animations:gangster3","animations:gangster4","animations:gangster5","animations:heels","animations:heels2","animations:muscle","animations:quick","animations:wide","animations:scared", }
    },
    {
        id = "expressions",
        displayName = "Expressions",
        icon = "#expressions",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    {
        id = "apartments",
        displayName = "Apartment",
        icon = "#apartments-start",
        enableMenu = function()
            return (not isDead and #(GetEntityCoords(PlayerPedId()) - altaApartments) <= 1)
        end,
        subMenus = {"apartments:alta:enter"}
    },
    {
        id = "blips",
        displayName = "Blips",
        icon = "#blips",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"blips:gasstations", "blips:barbershop", "blips:tattooshop", "blips:clothing"}
    },
    {
        id = "cuff",
        displayName = "Cuff Actions",
        icon = "#cuffs",
        enableMenu = function()
            return (not isDead and not isHandcuffed and not isHandcuffedAndWalking and (exports["plutorp-inventory"]:hasEnoughOfItem("cuffs",1,false)))
        end,
        subMenus = { "cuffs:uncuff", "cuffs:cuff", "cuffs:remmask"}
    },
    {
        id = "medic",
        displayName = "Medical",
        icon = "#medic",
        enableMenu = function()
            return (not isDead and isMedic)
        end,
        subMenus = {"medic:revive", "police:panic", "medic:heal", "general:escort", "general:putinvehicle", "general:unseatnearest", "general:checktargetstates" }
    },
     {
         id = "news",
         displayName = "News",
         icon = "#news",
         enableMenu = function()
             return (not isDead and isNews)
         end,
         subMenus = { "news:setCamera", "news:setMicrophone", "news:setBoom" }
     },
    {
        id = "vehicle",
        displayName = "Vehicle",
        icon = "#vehicle-options-vehicle",
        functionName = "veh:options",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end
    }, 
    {
        id = "oxygentank",
        displayName = "Remove Oxygen Tank",
        icon = "#oxygen-mask",
        functionName = "RemoveOxyTank",
        enableMenu = function()
            return not isDead and hasOxygenTankOn
        end
    },

    {
        id = "open-garage",
        displayName = "Open Garage",
        icon = "#warehouse",
        functionName = "garages:open",
        enableMenu = function()
            for k,v in ipairs(GarageLocations) do
                local pos = v.loc
                if #(vector3(pos[1],pos[2],pos[3]) - GetEntityCoords(PlayerPedId())) < 3.0 and not isDead and not IsPedInAnyVehicle(PlayerPedId(), false) then
                    return true
                end
            end
            return false
        end
    },


    {
        id = "park-vehicle-garage",
        displayName = "Store Vehicle",
        icon = "#warehouse",
        functionName = "garages:StoreVehicle",
        enableMenu = function()
            for k,v in ipairs(GarageLocations) do
                local pos = v.loc
                if #(vector3(pos[1],pos[2],pos[3]) - GetEntityCoords(PlayerPedId())) < 3.0 and not isDead and not IsPedInAnyVehicle(PlayerPedId(), false) then
                    return true
                end
            end
            return false
        end
    },

    {
        id = "mining",
        displayName = "Start Mining",
        icon = "#mines",
        functionName = "start-mining",

        enableMenu = function()
            local platerpedid = PlayerPedId()
            local plyCoords = GetEntityCoords(platerpedid)
            local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,-591.09088134766, 2070.9375, 131.24809265137,false)
            
            return (distance <= 15.0)
            
        end
    },

    {
        id = "benny:enter1",
        displayName = "Enter Benny's ($350)",
        icon = "#general-check-vehicle",
        functionName = "bennys:civ:repair:cl",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocation) <= 10)
        end,
    },
    {
        id = "benny:enter2",
        displayName = "Enter Benny's",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:bridge",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationBridge) <= 10)
        end,
    },
    {
        id = "benny:enter3",
        displayName = "Enter Benny's",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:paleto",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - billyLocationPaleto) <= 10)
        end,
    },
    {
        id = "benny:enter4",
        displayName = "Enter Benny's",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:mrpd",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationMRPD) <= 10)
        end,
    },

    {
        id = "benny:enter5",
        displayName = "Enter Tuner's",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:tunershop",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationTunershop) <= 4)
        end,
    },

    {
        id = "benny:enter6",
        displayName = "Enter Benny's",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:bennys2",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocation2) <= 3)
        end,
    },

    {
        id = "benny:enter7",
        displayName = "Enter Tuner Shop",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:tuners2",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationTunershop2) <= 4)
        end,
    },
    
    {
        id = "benny:enter8",
        displayName = "Enter Hayes Autos",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:hayes",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationBridge) <= 3)
        end,
    },

    {
        id = "benny:enter9",
        displayName = "Enter Hayes Autos",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:hayes2",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationHayes) <= 3)
        end,
    },

    {
        id = "benny:enter10",
        displayName = "Enter Auto Exotic",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:autoexotic",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationAutoExotic) <= 10)
        end,
    },

    {
        id = "police-impound",
        displayName = "Impound Options",
        icon = "#impound-vehicle",
        functionName = "ImpoundVeh",
        enableMenu = function()
            return ((isPolice or exports["plutorp_manager"]:isPed("myjob") == "DOJ") and not isDead) and not IsPedInAnyVehicle(PlayerPedId(), false)
        end
    },

    {
        id = "open-radio",
        displayName = "Radio",
        icon = "#news-job-news-boom",
        enableMenu = function()
            return (isPolice and not isDead)
        end,
        subMenus = {"radio:1", "radio:2","radio:3", "radio:4","radio:5", "radio:6","radio:7", "radio:8","radio:9", "radio:10",}
    },
    {
        id = "open-radio",
        displayName = "Radio",
        icon = "#news-job-news-boom",
        enableMenu = function()
            return (isMedic and not isDead)
        end,
        subMenus = {"radio:1", "radio:2","radio:3", "radio:4","radio:5", "radio:6","radio:7", "radio:8","radio:9", "radio:10",}
    },
    {
        id = "open-dispatch",
        displayName = "Dispatch",
        icon = "#general-check-over-target",
        functionName = "show:dispatch",
        enableMenu = function()
            return (isMedic and not isDead)
        end
    },

    {
        id = "mdt",
        displayName = "MDT",
        icon = "#mdt",
        functionName = "plutorp-mdt:hotKeyOpen",
        enableMenu = function()
            return ((isPolice or exports["plutorp_manager"]:isPed("myjob") == "DOJ") and not isDead)
        end
    }
}

newSubMenus = {
    -- ['open:garage'] = {
    --     title = "Open Garage",
    --     icon = "#warehouse",
    --     functionName = "garages:open"
    -- },
    -- ['park:vehicle'] = {
    --     title = "Park Vehicle",
    --     icon = "#warehouse",
    --     functionName = "garages:StoreVehicle"
    -- },

    ['apartments:alta:enter'] = {
        title = "Enter Apartment",
        icon = "#apartments-start",
        functionName = "apartments:alta:enter"
    },    

    ['general:emotes'] = {
        title = "Emotes",
        icon = "#general-emotes",
        functionName = "emotes:OpenMenu"
    },    

    ['general:checkoverself'] = {
        title = "Examine Self",
        icon = "#general-check-over-self",
        functionName = "Evidence:CurrentDamageList"
    },
    ['general:checktargetstates'] = {
        title = "Examine Target",
        icon = "#general-check-over-target",
        functionName = "requestWounds"
    },
    ['general:checkvehicle'] = {
        title = "Examine Vehicle",
        icon = "#general-check-vehicle",
        functionName = "veh:requestUpdate"
    },
    ['general:escort'] = {
        title = "Escort",
        icon = "#general-escort",
        functionName = "escortPlayer"
    },
    ['give:number'] = {
        title = "Share Contacts",
        icon = "#general-escort",
        functionName = "phone:number"
    },
    ['general:putinvehicle'] = {
        title = "Seat Vehicle",
        icon = "#general-put-in-veh",
        functionName = "police:forceEnter"
    },
    ['general:unseatnearest'] = {
        title = "Unseat Nearest",
        icon = "#general-unseat-nearest",
        functionName = "unseatPlayer"
    },    
    ['general:flipvehicle'] = {
        title = "Flip Vehicle",
        icon = "#general-flip-vehicle",
        functionName = "FlipVehicle"
    },
    
    ['animations:joy'] = {
        title = "Joy",
        icon = "#animation-joy",
        functionName = "AnimSet:Joy"
    },
    ['animations:sexy'] = {
        title = "Sexy",
        icon = "#animation-sexy",
        functionName = "AnimSet:Sexy"
    },
    ['animations:moon'] = {
        title = "Moon",
        icon = "#animation-moon",
        functionName = "AnimSet:Moon"
    },
    ['animations:tired'] = {
        title = "Tired",
        icon = "#animation-tired",
        functionName = "AnimSet:Tired"
    },
    ['animations:arrogant'] = {
        title = "Arrogant",
        icon = "#animation-arrogant",
        functionName = "AnimSet:Arrogant"
    },
    
    ['animations:casual'] = {
        title = "Casual",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual"
    },
    ['animations:casual2'] = {
        title = "Casual 2",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual2"
    },
    ['animations:casual3'] = {
        title = "Casual 3",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual3"
    },
    ['animations:casual4'] = {
        title = "Casual 4",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual4"
    },
    ['animations:casual5'] = {
        title = "Casual 5",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual5"
    },
    ['animations:casual6'] = {
        title = "Casual 6",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual6"
    },
    ['animations:confident'] = {
        title = "Confident",
        icon = "#animation-confident",
        functionName = "AnimSet:Confident"
    },
    
    ['animations:business2'] = {
        title = "Business 2",
        icon = "#animation-business",
        functionName = "AnimSet:Business2"
    },
    ['animations:business3'] = {
        title = "Business 3",
        icon = "#animation-business",
        functionName = "AnimSet:Business3"
    },
    
    ['animations:femme'] = {
        title = "Femme",
        icon = "#animation-female",
        functionName = "AnimSet:Femme"
    },
    ['animations:flee'] = {
        title = "Flee",
        icon = "#animation-flee",
        functionName = "AnimSet:Flee"
    },
    ['animations:gangster'] = {
        title = "Gangster",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster"
    },
    ['animations:gangster2'] = {
        title = "Gangster 2",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster2"
    },
    ['animations:gangster3'] = {
        title = "Gangster 3",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster3"
    },
    ['animations:gangster4'] = {
        title = "Gangster 4",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster4"
    },
    ['animations:gangster5'] = {
        title = "Gangster 5",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster5"
    },
    
    ['animations:heels'] = {
        title = "Heels",
        icon = "#animation-female",
        functionName = "AnimSet:Heels"
    },
    ['animations:heels2'] = {
        title = "Heels 2",
        icon = "#animation-female",
        functionName = "AnimSet:Heels2"
    },
    
    ['animations:hipster'] = {
        title = "Hipster",
        icon = "#animation-hipster",
        functionName = "AnimSet:Hipster"
    },
    ['animations:hiking'] = {
        title = "Hiking",
        icon = "#animation-hiking",
        functionName = "AnimSet:Hiking"
    },
    
    ['animations:jog'] = {
        title = "Jog",
        icon = "#animation-jog",
        functionName = "AnimSet:Jog"
    },
    
    ['animations:muscle'] = {
        title = "Muscle",
        icon = "#animation-tough",
        functionName = "AnimSet:Muscle"
    },
    
    ['animations:quick'] = {
        title = "Quick",
        icon = "#animation-quick",
        functionName = "AnimSet:Quick"
    },
    ['animations:wide'] = {
        title = "Wide",
        icon = "#animation-wide",
        functionName = "AnimSet:Wide"
    },
    ['animations:scared'] = {
        title = "Scared",
        icon = "#animation-scared",
        functionName = "AnimSet:Scared"
    },
    ['animations:guard'] = {
        title = "Guard",
        icon = "#animation-guard",
        functionName = "AnimSet:Guard"
    },
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },
    -- ['animations:hurry'] = {
    --     title = "Hurry",
    --     icon = "#animation-hurry",
    --     functionName = "AnimSet:Hurry"
    -- },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:nonchalant'] =
    {
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        functionName = "AnimSet:NonChalant"
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:money'] = {
        title = "Money",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "Swagger",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:shady'] = {
        title = "Shady",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Man Eater",
        icon = "#animation-maneater",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "ChiChi",
        icon = "#animation-chichi",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "Default",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },




    ['blips:gasstations'] = {
        title = "Gas Stations",
        icon = "#blips-gasstations",
        functionName = "CarPlayerHud:ToggleGas"
    },    
   
    ['blips:clothing'] = {
        title = "Clothing Store",
        icon = "#blips-clothing",
        functionName = "clothing:blips"
    },
    ['blips:barbershop'] = {
        title = "Barber Shop",
        icon = "#blips-barbershop",
        functionName = "hairDresser:ToggleHair"
    },    
    ['blips:tattooshop'] = {
        title = "Tattoo Shop",
        icon = "#blips-tattooshop",
        functionName = "tattoo:ToggleTattoo"
    },
   

    
    ['cuffs:cuff'] = {
        title = "Cuff",
        icon = "#cuffs-cuff",
        functionName = "civ:cuffFromMenu"
    },
    ['cuffs:uncuff'] = {
        title = "Uncuff",
        icon = "#cuffs-uncuff",
        functionName = "police:uncuffMenu"
    },
    ['cuffs:remmask'] = {
        title = "Remove Mask Hat",
        icon = "#cuffs-remove-mask",
        functionName = "police:remmask"
    },
    ['bill:suspect'] = {
        title = "Fine Suspect",
        icon = "#animation-money",
        functionName = "police:bill"
    },
    ['cuffs:checkinventory'] = {
        title = "Search Person",
        icon = "#cuffs-check-inventory",
        functionName = "police:checkInventory"
    },
    ['cuffs:unseat'] = {
        title = "Unseat",
        icon = "#cuffs-unseat-player",
        functionName = "unseatPlayerCiv"
    },
    ['cuffs:checkphone'] = {
        title = "Read Phone",
        icon = "#cuffs-check-phone",
        functionName = "police:checkPhone"
    },
    ['medic:revive'] = {
        title = "Revive",
        icon = "#medic-revive",
        functionName = "revive"
    },

    ['medic:heal'] = {
        title = "Heal",
        icon = "#medic-heal",
        functionName = "ems:heal"
    },
    ['medic:stomachpump'] = {
        title = "Stomach pump",
        icon = "#medic-stomachpump",
        functionName = "ems:stomachpump"
    },
    ['medic:panic'] = {
        title = "Panic Button",
        icon = "#medic-panic",
        functionName = "police:panic"
    },
    ['police:cuff'] = {
        title = "Cuff",
        icon = "#cuffs-cuff",
        functionName = "police:cuffFromMenu"
    },
    ['police:checkbank'] = {
        title = "Check Bank",
        icon = "#police-check-bank",
        functionName = "police:checkBank"
    },

    ['police:removeweapons'] = {
        title = "Remove Weapons License",
        icon = "#police-action-remove-weapons",
        functionName = "police:removeWeapon"
    },
    ['police:gsr'] = {
        title = "GSR Test",
        icon = "#police-action-gsr",
        functionName = "police:gsr"
    },

    ['police:panic'] = {
        title = "Panic Button",
        icon = "#police-action-panic",
        functionName = "police:panic"
    },

    ['police:dnaswab'] = {
        title = "DNA Swab",
        icon = "#police-action-dna-swab",
        functionName = "evidence:dnaSwab"
    },
    ['police:placespike'] = {
        title = "Place Spikes",
        icon = "#vehicle-options",
        functionName = "placespikes"
    },
    ['police:removespike'] = {
        title = "Remove Spikes",
        icon = "#vehicle-options",
        functionName = "removespikes"
    },
    ['police:barriers'] = {
        title = "Place Cones",
        icon = "#police-cone",
        functionName = "barriers:cone"
    },
    ['police:barrier'] = {
        title = "Remove Barriers",
        icon = "#vehicle-options",
        functionName = "barriers:pickup"
    },
    ['police:toggleradar'] = {
        title = "Toggle Radar",
        icon = "#police-vehicle-radar",
        functionName = "startSpeedo"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },
    ['police:runplate'] = {
        title = "Run Plate",
        icon = "#police-vehicle-plate",
        functionName = "clientcheckLicensePlate"
    },
    ["radio:1"] = {
        title="Channel 1",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "1" }
    },
    ["radio:2"] = {
        title="Channel 2",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "2" }
    },
    ["radio:3"] = {
        title="Channel 3",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "3" }
    },
    ["radio:4"] = {
        title="Channel 4",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "4" }
    },
    ["radio:5"] = {
        title="Channel 5",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "5" }
    },
    ["radio:6"] = {
        title="Channel 6",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "6" }
    },
    ["radio:7"] = {
        title="Channel 7",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "7" }
    },
    ["radio:8"] = {
        title="Channel 8",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "8" }
    },
    ["radio:9"] = {
        title="Channel 9",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "9" }
    },
    ["radio:10"] = {
        title="Channel 10",
        icon="#news-job-news-microphone",
        functionName = "ChannelSet",
        functionParameters =  { "10" }
    },
    ['news:setCamera'] = {
        title = "Camera",
        icon = "#news-job-news-camera",
        functionName = "camera:setCamera"
    },
    ['news:setMicrophone'] = {
        title = "Microphone",
        icon = "#news-job-news-microphone",
        functionName = "camera:setMic"
    },
    ['news:setBoom'] = {
        title = "Microphone Boom",
        icon = "#news-job-news-boom",
        functionName = "camera:setBoom"
    },
    ['weed:currentStatusServer'] = {
        title = "Request Status",
        icon = "#weed-cultivation-request-status",
        functionName = "weed:currentStatusServer"
    },   
    ['weed:weedCrate'] = {
        title = "Remove A Crate",
        icon = "#weed-cultivation-remove-a-crate",
        functionName = "weed:weedCrate"
    },
    ['cocaine:currentStatusServer'] = {
        title = "Request Status",
        icon = "#meth-manufacturing-request-status",
        functionName = "cocaine:currentStatusServer"
    },
    ['cocaine:methCrate'] = {
        title = "Remove A Crate",
        icon = "#meth-manufacturing-remove-a-crate",
        functionName = "cocaine:methCrate"
    },
    ["expressions:angry"] = {
        title="Angry",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="Drunk",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="Dumb",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="Electrocuted",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="Grumpy",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="Happy",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="Injured",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="Joyful",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:mouthbreather"] = {
        title="Mouthbreather",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },
    ["expressions:normal"]  = {
        title="Normal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="One Eye",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="Shocked",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="Sleeping",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="Smug",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="Speculative",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="Stressed",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="Sulking",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="Weird",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["expressions:weird2"]  = {
        title="Weird 2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
    },

    ["license:grantWeapon"]  = {
        title="Grant Firearms License",
        icon="#judge-licenses-grant-weapon",
        functionName = "police:giveweapon",
    },
    ["license:removeweapons"]  = {
        title="Revoke Firearms License",
        icon="#judge-licenses-remove-weapon",
        functionName = "police:removeweapon",
    },


    ["license:grantHunting"]  = {
        title="Grant Hunting License",
        icon="#judge-licenses-grant-weapon",
        functionName = "police:givehunting",
    },

    ["license:removehunting"]  = {
        title="Revoke Hunting License",
        icon="#judge-licenses-remove-weapon",
        functionName = "police:removehunting",
    },


    ["license:grantFishing"]  = {
        title="Grant Fishing License",
        icon="#judge-licenses-grant-weapon",
        functionName = "police:givefishing",
    },

    ["license:removefishing"]  = {
        title="Revoke Fishing License",
        icon="#judge-licenses-remove-weapon",
        functionName = "police:removefishing",
    }
}

RegisterNetEvent("menu:setCuffState")
AddEventHandler("menu:setCuffState", function(pTargetId, pState)
    cuffStates[pTargetId] = pState
end)


RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent("plutorp-jobmanager:playerBecameJob")
AddEventHandler("plutorp-jobmanager:playerBecameJob", function(job, name, notify)
    if isMedic and job ~= "ems" then isMedic = false end
    if isPolice and job ~= "police" then isPolice = false end
    if isDoctor and job ~= "doctor" then isDoctor = false end
    if isNews and job ~= "news" then isNews = false end
    if job == "police" then isPolice = true end
    if job == "ems" then isMedic = true end
    if job == "news" then isNews = true end
    if job == "doctor" then isDoctor = true end
    myJob = job
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)


RegisterNetEvent("police:currentHandCuffedState")
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffedAndWalking = pIsHandcuffedAndWalking
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('enablegangmember')
AddEventHandler('enablegangmember', function(pGangNum)
    gangNum = pGangNum
end)

RegisterNetEvent("makenews")
AddEventHandler("makenews", function()
    isNews = true
end)

RegisterNetEvent("menu:update:vehicles", function()
    TakenOut = not TakenOut
end)


RegisterNetEvent("menu:veh:purchase", function()
    TakenOut = true
end)

RegisterNetEvent("menu:veh:relog", function()
    TakenOut = false
end)

StoreVehicleBS = {
    [1] = { loc = {-1181.2923583984, -906.15093994141, 13.762735366821}},
}

GarageLocations = {
	[1] = { loc = {484.77066040039,-77.643089294434,77.600166320801}},
	[2] = { loc = {399.51190185547,-1346.2742919922,31.121940612793}},
	[3] = { loc = {82.359413146973,6418.9575195313,31.479639053345}},
	[4] = { loc = {-606.86322021484,-2236.7624511719,6.0779848098755}},
	[5] = { loc = {364.27685546875,297.84490966797,103.49515533447}},
	[6] = { loc = {-338.31619262695,266.79782104492,85.741966247559}},
	[7] = { loc = {273.66683959961,-343.83737182617,44.919876098633}},
	[8] = { loc = {66.215492248535,13.700443267822,69.047248840332}},
	[9] = { loc = {211.79,-808.38,30.833}},
	[10] = { loc = {-153.09889221191, -1172.3297119141, 23.753244400024}},
	[11] = { loc = {570.81,2729.85,42.07}},
	[12] = { loc = {-1287.1, 293.02, 64.82}},
	[13] = { loc = {-1579.01,-889.11,9.38}},
	[14] = { loc = {-298.08322143555,-990.45611572266,31.080966949463}},
    [14.1] = { loc = {-301.53567504883,-989.30126953125,31.080966949463}}, ---301.53567504883, -989.30126953125, 31.080966949463 Heading: 191.60260009766
	[15] =  { loc = {986.28, -208.47, 70.46}},
	[16] =  { loc = {847.36, -3219.15, 5.97}},
	[17] = { loc = {-25.56, -1426.93, 30.66}},
	[18] = { loc = {339.36, -2043.96, 21.28}},
	[19] = { loc = {115.55, -1949.68, 20.69}},
	[20] = { loc = {1399.31, 1118.17, 114.84}},
	[21] = { loc = {-679.19, -884.62, 24.49}},

	--Del Perro
	[22] =  { loc = {-1486.4266357422, -509.69250488281, 32.860633850098 }},
    [23] =  { loc = {1519.3479003906, 3764.5424804688, 34.037261962891 }},
    -- MRPD
    [24] = { loc = {445.26556396484, -986.23608398438, 25.699857711792}},
    -- Le Mesa PD
    [25] = { loc = {833.45129394531, -1270.9822998047, 26.283060073853}},
}