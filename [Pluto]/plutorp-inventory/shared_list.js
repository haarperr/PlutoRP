let itemList = {}

// weapons
itemList["-1045183535"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Revolver",
    price: 250,
    weight: 3,
    craft: [{
        itemid: "scrapmetal",
        amount: 150
    }],
    nonStack: true,
    model: "",
    image: "revolver.png",
    weapon: true,
    deg: false
}

itemList["-1746263880"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Colt M1892",
    price: 250,
    weight: 3,
    craft: [{
        itemid: "aluminium",
        amount: 70
    }, {
        itemid: "steel",
        amount: 70
    }],
    nonStack: true,
    model: "",
    image: "marston-revolver.png",
    weapon: true,
    deg: false
}

//'Parachute'
itemList["-72657034"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Parachute",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 80
    }, {
        itemid: "rubber",
        amount: 35
    }],
    weight: 30,
    nonStack: true,
    model: "",
    image: "parachute.png",
    weapon: false,
    deg: true
}

//'Assault Rifle'
itemList["-1074790547"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Assault Rifle",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 80
    }, {
        itemid: "rubber",
        amount: 50
    }],
    weight: 15,
    nonStack: true,
    model: "",
    image: "assault-rifle.png",
    weapon: true,
    deg: true
} 

 //'Pistol'
itemList["-1075685676"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "9mm Pistol",
    price: 10,
    craft: [{
        itemid: "copper",
        amount: 50
    }, {
        itemid: "glass",
        amount: 80
    }, {
        itemid: "steel",
        amount: 10
    }],
    weight: 2,
    nonStack: true,
    model: "",
    image: "pistol.png",
    weapon: true,
    deg: true
}

itemList["-1810795771"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Pool Cue",
    price: 0,
    weight: 2,
    nonStack: true,
    model: "",
    image: "poolcue.png",
    weapon: true,
    deg: true
}

itemList["-2084633992"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Carbine Rifle",
    price: 1500,
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 10
    }, {
        itemid: "rubber",
        amount: 70
    }],
    weight: 15,
    nonStack: true,
    model: "",
    image: "weapon_carbine-rifle.png",
    weapon: true,
    deg: true
}

itemList["-538741184"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Shank",
    craft: [{
        itemid: "methbag",
        amount: 25
    }, {
        itemid: "ciggy",
        amount: 100
    }],
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "switchblade.png",
    weapon: true,
    deg: true
}

// use this heavy
itemList["-771403250"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Heavy Pistol",
    price: 250,
    craft: [{
        itemid: "goldbar",
        amount: 50
    }, {
        itemid: "aluminium",
        amount: 100
    }],
    weight: 13,
    nonStack: true,
    model: "",
    image: "heavy-pistol.png",
    weapon: true,
    deg: true
}


itemList["-86904375"] = {
    fullyDegrades: false,
    decayrate: 0.01,
    displayname: "Carbine Rifle mk2",
    price: 2500,
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 10
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 15,
    nonStack: true,
    model: "",
    image: "762saltmaker.png",
    weapon: true,
    deg: true
}


itemList["100416529"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Sniper Rifle",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 100
    }, {
        itemid: "scrapmetal",
        amount: 40
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 12,
    nonStack: true,
    model: "",
    image: "huntingrifle.png",
    weapon: true,
    deg: true
}

// Sticky Bomb C4
itemList['741814745'] = {
  displayname: 'Sticky Bomb',
  price: 250,
  craft: [{
     itemid: "aluminium", 
     amount: 350 
  },{
     itemid: "scrapmetal", 
     amount: 350
  },{
     itemid: 'rubber', 
     amount: 300
  }],
  weight: 11,
  nonStack: false,
  model: '',
  image: 'sticky-bomb.png',
  weapon: true,
  contraband: true,
  deg: false
};


itemList["101631238"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Fire Ext",
    price: 50,
    craft: [{
        itemid: "aluminium",
        amount: 100
    }, {
        itemid: "scrapmetal",
        amount: 40
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 25,
    nonStack: true,
    model: "",
    image: "fire-extinguisher.png",
    weapon: true,
    deg: false
}


itemList["1141786504"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Golfclub",
    price: 250,
    weight: 10,
    nonStack: true,
    model: "",
    image: "golfclub.png",
    weapon: true,
    deg: false
}


itemList["1198879012"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Flaregun",
    price: 250,
    weight: 4,
    nonStack: true,
    model: "",
    image: "flaregun.png",
    weapon: true,
    deg: false
}


itemList["1233104067"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Flare",
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "flare.png",
    weapon: true,
    deg: false
}

itemList["126349499"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Snowball",
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "snowball.png",
    weapon: true,
    deg: false
}

itemList["1317494643"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Hammer",
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "hammer.png",
    weapon: true,
    deg: false
}


itemList["137902532"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Vintage Pistol",
    price: 1150,
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 10,
    nonStack: true,
    model: "",
    image: "vintage-pistol.png",
    weapon: true,
    deg: true
}


itemList["1432025498"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Shotgun",
    price: 10,
    craft: [{
        itemid: "aluminium",
        amount: 5
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "pump-shotgun.png",
    weapon: true,
    deg: true
}


itemList["1593441988"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Combat Pistol",
    price: 1500,
    craft: [{
        itemid: "steel",
        amount: 65
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 10,
    nonStack: true,
    model: "",
    image: "combat-pistol.png",
    weapon: true,
    deg: true
}

itemList["1649403952"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Draco",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 55
    }, {
        itemid: "plastic",
        amount: 10
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 15,
    nonStack: true,
    model: "",
    image: "cmp-rifle.png",
    weapon: true,
    deg: true
}

itemList["171789620"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Combat PDW Mk2",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 333
    }, {
        itemid: "plastic",
        amount: 211
    }, {
        itemid: "rubber",
        amount: 222
    }],
    weight: 6.5,
    nonStack: true,
    model: "",
    image: "combat-pdw.png",
    weapon: true,
    deg: true
}


itemList["1737195953"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Nightstick",
    price: 0,
    weight: 1,
    nonStack: true,
    model: "",
    image: "nightstick.png",
    weapon: true,
    deg: false
}


itemList["2017895192"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Sawnoff",
    price: 250,
    craft: [{
        itemid: "steel",
        amount: 50
    }, {
        itemid: "aluminium",
        amount: 30
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "sawnoff-shotgun.png ",
    weapon: true,
    deg: true
}

itemList["2210333304"] = {
    fullyDegrades: false,
    decayrate:  0.01,
    displayname: "Carbine Rifle",
    price: 10,
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 10
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 15,
    nonStack: true,
    model: "",
    image: "carbine-rifle.png",
    weapon: true,
    deg: true
}

itemList["pd_badge"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "PD BADGE",
    price: 10,
    weight: 0,
    nonStack: true,
    model: "",
    image: "pd_badge.png",
    information: "Rep the set!",
    deg: false
}


itemList["2227010557"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Crowbar",
    price: 125,
    weight: 18,
    nonStack: true,
    model: "",
    image: "crowbar.png",
    weapon: true,
    deg: false
}


itemList["2343591895"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Flash Light",
    price: 50,
    weight: 2,
    nonStack: true,
    model: "",
    image: "flashlight.png",
    weapon: true,
    deg: false
}


itemList["2460120199"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Dagger",
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "dagger.png",
    weapon: true,
    deg: false
}


itemList["2484171525"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Cue",
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "pool-cue.png",
    weapon: true,
    deg: false
}


itemList["2508868239"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Bat",
    price: 87,
    weight: 6,
    nonStack: true,
    model: "",
    image: "baseball-bat.png",
    weapon: true,
    deg: false
}


itemList["2578377531"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Pistol 50",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 155
    }, {
        itemid: "plastic",
        amount: 100
    }, {
        itemid: "valuablegoods",
        amount: 10
    }],
    weight: 13,
    nonStack: true,
    model: "",
    image: "pistol-50.png",
    weapon: true,
    deg: true
}


itemList["2578778090"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Knife",
    price: 78,
    weight: 8,
    nonStack: true,
    model: "",
    image: "knife.png",
    weapon: true,
    deg: false
}

itemList["3218215474"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "SNS Pistol",
    price: 1250,
    craft: [{
        itemid: "scrapmetal",
        amount: 8
    }],
    weight: 10,
    nonStack: true,
    model: "",
    image: "sns-pistol.png",
    weapon: true,
    deg: true
}


itemList["3219281620"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "PD Glock",
    price: 10,
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 8,
    nonStack: true,
    model: "",
    image: "glock.png",
    weapon: true,
    deg: true
}

itemList["324215364"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "UZI",
    price: 25000,
    craft: [{
        itemid: "valuablegoods",
        amount: 10
    }, {
        itemid: "aluminium",
        amount: 200
    }, {
        itemid: "rubber",
        amount: 200
    }],
    weight: 15,
    nonStack: true,
    model: "",
    image: "micro-smg2.png",
    weapon: true,
    deg: true
}

itemList["3441901897"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Metal Hatchet",
    price: 125,
    craft: [{
        itemid: "metal",
        amount: 4
    }, {
        itemid: "stick",
        amount: 1
    }, {
        itemid: "string",
        amount: 1
    }],
    weight: 6,
    nonStack: true,
    model: "",
    image: "hatchet.png",
    weapon: true,
    deg: true
}


itemList["3523564046"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Heavy Pistol",
    price: 250,
    craft: [{
        itemid: "goldbar",
        amount: 35
    }],
    weight: 13,
    nonStack: true,
    model: "",
    image: "heavy-pistol.png",
    weapon: true,
    deg: true
}


itemList["3638508604"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Knuckle",
    craft: [{
        itemid: "aluminium",
        amount: 25
    }, {
        itemid: "scrapmetal",
        amount: 10
    }],
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "knuckle-dusters.png",
    weapon: true,
    deg: false
}

itemList["3713923289"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Machete",
    price: 250,
    weight: 11,
    nonStack: true,
    model: "",
    image: "machete.png",
    weapon: true,
    deg: false
}

itemList["4024951519"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Assault SMG",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 155
    }, {
        itemid: "plastic",
        amount: 100
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 6.5,
    nonStack: true,
    model: "",
    image: "assault-smg.png",
    weapon: true,
    deg: true
}


itemList["4191993645"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Hatchet",
    price: 250,
    weight: 5,
    nonStack: true,
    model: "",
    image: "hatchet.png",
    weapon: true,
    deg: false
}


itemList["4192643659"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Bottle",
    price: 250,
    weight: 1,
    nonStack: true,
    model: "",
    image: "glass-bottle.png",
    weapon: true,
    deg: false
}


itemList["419712736"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Wrench",
    price: 250,
    weight: 2,
    nonStack: true,
    model: "",
    image: "wrench.png",
    weapon: true,
    deg: false
}


itemList["453432689"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Beretta",
    price: 1000,
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 13,
    nonStack: true,
    model: "",
    image: "pistol2.png",
    weapon: true,
    deg: true
}


itemList["487013001"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Beanbag SG",
    price: 10,
    craft: [{
        itemid: "aluminium",
        amount: 5
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 7,
    nonStack: true,
    model: "",
    image: "pump-shotgun2.png",
    weapon: true,
    deg: true
}


itemList["584646201"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "AP Pistol",
    price: 250,
    craft: [{
        itemid: "valuablegoods",
        amount: 1
    }, {
        itemid: "goldbar",
        amount: 1
    }],
    weight: 14,
    nonStack: true,
    model: "",
    image: "ap-pistol.png",
    weapon: true,
    deg: true
}


itemList["615608432"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Moly",
    craft: [{
        itemid: "methbag",
        amount: 35
    }, {
        itemid: "ciggy",
        amount: 25
    }],
    price: 250,
    weight: 11,
    nonStack: false,
    model: "",
    image: "molotov.png",
    weapon: true,
    deg: false
}


itemList["736523883"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "SMG",
    price: 1750,
    craft: [{
        itemid: "aluminium",
        amount: 155
    }, {
        itemid: "plastic",
        amount: 100
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 15,
    nonStack: true,
    model: "",
    image: "smg.png",
    weapon: true,
    deg: true
}

itemList["883325847"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Petrol Can",
    price: 250,
    weight: 11,
    nonStack: true,
    model: "",
    image: "petrol-can.png",
    weapon: true,
    deg: false
}


itemList["911657153"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Stun Gun",
    price: 0,
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    weight: 1,
    nonStack: true,
    model: "",
    image: "stun-gun.png",
    weapon: true,
    deg: false
}


itemList["940833800"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Homemade Weapon",
    price: 250,
    craft: [{
        itemid: "stick",
        amount: 1
    }, {
        itemid: "string",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "homemade.png",
    weapon: true,
    deg: true
}

itemList["extended_ap"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Ext AP Mag",
    price: 250,
    craft: [{
        itemid: "aluminium",
        amount: 30
    }, {
        itemid: "valuablegoods",
        amount: 5
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "ap-pistol-clip.png",
    deg: false
}


itemList["extended_micro"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Ext Micro Mag",
    price: 210,
    craft: [{
        itemid: "copper",
        amount: 150
    }, {
        itemid: "valuablegoods",
        amount: 5
    }],
    weight: 3,
    nonStack: true,
    model: "",
    image: "micro-smg-clip.png",
    deg: false
} 


itemList["extended_sns"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Ext SNS Mag",
    price: 250,
    craft: [{
        itemid: "scrapmetal",
        amount: 6
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "sns-pistol-clip.png",
    deg: false
}


itemList["extended_tec9"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Ext Tec 9 Mag",
    price: 250,
    craft: [{
        itemid: "copper",
        amount: 60
    }, {
        itemid: "goldbar",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "micro-smg-clip.png",
    deg: false
}


itemList["silencer_l"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "L Silencer",
    price: 510,
    craft: [{
        itemid: "valuablegoods",
        amount: 5
    }, {
        itemid: "aluminium",
        amount: 150
    }, {
        itemid: "copper",
        amount: 150
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "lsilencer.png",
    deg: false
}


itemList["silencer_l2"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "L Silencer MkII",
    price: 510,
    craft: [{
        itemid: "goldbar",
        amount: 3
    }, {
        itemid: "copper",
        amount: 10
    }, {
        itemid: "goldbar",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "lsilencer.png",
    deg: false
}


itemList["silencer_s"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "S Silencer",
    price: 510,
    craft: [{
        itemid: "valuablegoods",
        amount: 5
    }, {
        itemid: "copper",
        amount: 200
    }, {
        itemid: "rubber",
        amount: 150
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "ssilencer.png",
    deg: false
}


itemList["silencer_s2"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "S Silencer MKII",
    price: 510,
    craft: [{
        itemid: "goldbar",
        amount: 3
    }, {
        itemid: "scrapmetal",
        amount: 20
    }, {
        itemid: "goldbar",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "ssilencer.png",
    deg: false
}


itemList["SmallScope"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "2x Medium Scope",
    price: 550,
    craft: [{
        itemid: "goldbar",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "sscope.png",
    deg: false
}


itemList["sniperammo"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Sniper Ammo x5",
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 10,
    weight: 7,
    nonStack: false,
    model: "",
    image: "rifle-ammo.png",
    deg: false
}


itemList["subammo"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Sub Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 250
    }, {
        itemid: "plastic",
        amount: 250
    }, {
        itemid: "valuablegoods",
        amount: 3
    }],
    price: 1500,
    weight: 5,
    nonStack: false,
    model: "",
    image: "sub-ammo.png",
    deg: false
}

itemList["subammo2"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Sub Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 0,
    weight: 5,
    nonStack: false,
    model: "",
    image: "sub-ammo.png",
    deg: false
}

itemList["TinyScope"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "2x S Scope",
    price: 550,
    craft: [{
        itemid: "goldbar",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "tscope.png",
    deg: false
}


itemList["heavyammo"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Heavy Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 10,
    weight: 7,
    nonStack: false,
    model: "",
    image: "rifle-ammo.png",
    deg: false
}

// LMG ammo is not actually being used for anything and has no "use function". It's the same as Heavy Ammo.
itemList["lmgammo"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "LMG Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "lmg-ammo.png",
    deg: false
}

itemList["shotgunammo"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "SG Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 10,
    weight: 7,
    nonStack: false,
    model: "",
    image: "shotgun-ammo.png",
    deg: false
}

itemList["MediumScope"] = {
    illegal: true,
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "2x L Scope",
    price: 550,
    craft: [{
        itemid: "goldbar",
        amount: 1
    }],
    weight: 11,
    nonStack: true,
    model: "",
    image: "lscope.png",
    deg: false
}


itemList["pistolammo"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Pistol Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 50
    }, {
        itemid: "rubber",
        amount: 50
    }],
    price: 10,
    weight: 3,
    nonStack: false,
    model: "",
    image: "pistolammo.png",
    deg: false
}

itemList["pistolammocrim"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Pistol Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 50
    }, {
        itemid: "rubber",
        amount: 50
    }],
    price: 500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "pistolammo.png",
    deg: false
}


itemList["rifleammo"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Rifle Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 0,
    weight: 7,
    nonStack: false,
    model: "",
    image: "np_rifle-ammo.png",
    deg: false
}

itemList["rifleammocrim"] = {
    fullyDegrades: true,
    decayrate: 1.0,
    displayname: "Rifle Ammo x50",
    craft: [{
        itemid: "aluminium",
        amount: 1
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "valuablegoods",
        amount: 4
    }],
    price: 1500,
    weight: 7,
    nonStack: false,
    model: "",
    image: "np_rifle-ammo.png",
    deg: false
}


itemList["tuner"] = {
    fullyDegrades: true,
    decayrate: 2.0,
    displayname: "Tuner Chip",
    craft: [{
        itemid: "electronics",
        amount: 200
    }],
    price: 500,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tuner.png",
    information: "Use inside a tuner vehicle to tune it..",
    deg: false
}


itemList["repairkit"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "Repair Kit",
    craft: [{
        itemid: "electronics",
        amount: 25
    }],
    price: 800,
    weight: 1,
    nonStack: false,
    model: "",
    image: "repairkit.png",
    deg: false
}


itemList["1gcocaine"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.5,
    displayname: "5g 35% Coke",
    craft: [{
        itemid: "glucose",
        amount: 0.01
    }, {
        itemid: "coke5g",
        amount: 0.1
    }],
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cocaine-baggy.png",
    information: "35% Cut Cocaine. ",
    deg: false
}

itemList["cocapaste"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.5,
    displayname: "Coca Paste",
    price: 100,
    weight: 1,
    nonStack: false,
    model: "",
    image: "paste.png",
    information: "mhmmm a Coca Paste.",
    deg: false
}

itemList["cocaleaf"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.5,
    displayname: "Coca Leaf",
    price: 100,
    weight: 3,
    nonStack: false,
    model: "",
    image: "leaf.png",
    information: "Cocaine Leaf.",
    deg: false
}

itemList["1gcrack"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.5,
    displayname: "5g Crack",
    craft: [{
        itemid: "bakingsoda",
        amount: 0.01
    }, {
        itemid: "coke5g",
        amount: 0.1
    }],
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "crack.png",
    information: "Crack... ",
    deg: false
}


itemList["coke50g"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.5,
    displayname: "Coke Brick (50g)",
    price: 1000,
    weight: 25,
    nonStack: false,
    model: "",
    image: "cocaine-brick.png",
    information: "Increases your Stamina and Movement Speed <br> Breaks down into product.",
    deg: false
}


itemList["coke5g"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.5,
    displayname: "Coke Baggy (5g)",
    craft: [{
        itemid: "coke50g",
        amount: 0.1
    }],
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cocaine-baggy.png",
    information: "Increases your Stamina and Movement Speed",
    deg: false
}


itemList["joint"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.75,
    displayname: "Joint",
    craft: [{
        itemid: "weedq",
        amount: 1
    }, {
        itemid: "rollingpaper",
        amount: 1
    }],
    price: 85,
    weight: 1,
    nonStack: false,
    model: "",
    image: "prp_joint.png",
    information: "Its a Joint, man. ",
    deg: false
}


itemList["maleseed"] = {
    fullyDegrades: true,
    decayrate: 2.0,
    displayname: "Male Seed",
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "weed-seed.png",
    information: "Plant near females to make them produce seeds. ",
    deg: false
}


itemList["femaleseed"] = {
    fullyDegrades: true,
    decayrate: 2.0,
    displayname: "Female Seed",
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "weed-seed.png",
    information: "Thank you.",
    deg: false
}

itemList["highgrademaleseed"] = {
    fullyDegrades: true,
    decayrate: 2.0,
    displayname: "highgrade seed",
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "highgrademaleseed.png",
    information: "Thank you.",
    deg: false
}

itemList["plantpot"] = {
    fullyDegrades: true,
    decayrate: 2.0,
    displayname: "Plantpot",
    price: 20,
    weight: 0,
    nonStack: false,
    model: "",
    image: "plantpot.png",
    information: "Thank you.",
    deg: false
}

itemList["purifiedwater"] = {
    fullyDegrades: true,
    decayrate: 2.0,
    displayname: "purifiedwater",
    price: 20,
    weight: 0,
    nonStack: false,
    model: "",
    image: "water.png",
    information: "Thank you.",
    deg: false
}

itemList["methbag"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 2.0,
    displayname: "Ass Meth (1g)",
    price: 500,
    weight: 0,
    nonStack: false,
    model: "",
    image: "meth-baggy.png",
    information: "-7 Jail <br> +5 Stink <br> Increases your Stamina and Movement Speed - smells funny though <br> If it has roleplay stats, it must be roleplay.",
    deg: false
}


itemList["oxy"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.75,
    displayname: "Oxy 100mg",
    price: 150,
    weight: 1,
    nonStack: false,
    model: "",
    image: "Oxy.png",
    information: "Stop's Bleeding!",
    deg: false
}

itemList["painkiller"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.75,
    displayname: "painkiller",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "aspirin.png",
    information: "Given by EMS!",
    deg: false
}


itemList["weed12oz"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.0025,
    displayname: "Weed 250 Oz",
    price: 250,
    weight: 35,
    nonStack: false,
    model: "",
    image: "box-of-weed-12-18-oz.png",
    information: "Lowers Stress <br> Breaks Down into other Product",
    deg: false
}


itemList["weed5oz"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.5,
    displayname: "Weed 5 Oz",
    price: 500,
    weight: 5,
    nonStack: false,
    model: "",
    image: "weed-brick-40-Oz.png",
    information: "Lowers Stress <br> Breaks Down into other Product",
    deg: false
}


itemList["weedoz"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.3,
    displayname: "Weed Oz",
    price: 200,
    weight: 4,
    nonStack: false,
    model: "",
    image: "weed-4-Oz.png",
    information: "Lowers Stress",
    deg: false
}


itemList["weedq"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.3,
    displayname: "Weed Q",
    craft: [{
        itemid: "weedoz",
        amount: 0.25
    }],
    price: 65,
    weight: 2,
    nonStack: false,
    model: "",
    image: "weed-oz.png",
    information: "Lowers Stress",
    deg: false
}


itemList["wetbud"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.3,
    displayname: "Wet Bud",
    price: 30,
    weight: 4,
    nonStack: false,
    model: "",
    image: "wet.png",
    information: "Dry It?",
    deg: false
}


itemList["driedbud"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.3,
    displayname: "Dried Bud (2 Grams)",
    price: 30,
    weight: 2,
    nonStack: false,
    model: "",
    image: "buddry2.png",
    information: "Dry It?",
    deg: false
}


itemList["smallbud"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.3,
    displayname: "Packed Bud (2 Grams)",
    price: 30,
    weight: 2,
    nonStack: false,
    model: "",
    image: "buddry.png",
    information: "Sell It?",
    deg: false
}


itemList["joint2"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.75,
    displayname: "Joint",
    craft: [{
        itemid: "smallbud",
        amount: 1.0
    }, {
        itemid: "rollingpaper",
        amount: 1
    }],
    price: 15,
    weight: 1,
    nonStack: false,
    model: "",
    image: "prp_joint.png",
    information: "Its a Joint, man. ",
    deg: false
}


itemList["lsdtab"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.0,
    displayname: "LSD Tab",
    price: 200,
    weight: 1,
    nonStack: false,
    model: "",
    image: "lsdtab.png",
    information: "For spectacular trips, or whatever.",
    deg: true
}


itemList["badlsdtab"] = {
    fullyDegrades: true,
    illegal: true,
    decayrate: 0.0,
    displayname: "LSD Tab",
    price: 200,
    weight: 1,
    nonStack: false,
    model: "",
    image: "badlsdtab.png",
    information: "For spectacular trips, or whatever.",
    deg: true
}


// other drugy shit

itemList["aspirin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Aspirin",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "aspirin.png",
    information: "Its an Aspirin",
    deg: false
}


itemList["cabsinthe"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cannabis Absinthe",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cannabis-absinthe.png",
    information: "Duuude..bro...",
    deg: false
}


itemList["redwine"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Red Wine",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "red-wine-bottle.png",
    information: "No crime just wine",
    deg: false
}

itemList["rum"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rum",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rum.png",
    information: "Why is it gone?",
    deg: false
}


itemList["tequila"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Tequila",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tequila.png",
    information: "Tequilya brand",
    deg: false
}


itemList["tequilashot"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Shot of Tequila",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tequila-shot.png",
    information: "Uno mas por favor",
    deg: false
}


itemList["vodka"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Vodka",
    price: 125,
    weight: 1,
    nonStack: false,
    model: "",
    image: "vodka.png",
    information: "Sates Thirst",
    deg: false
}


itemList["whiskey"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Whiskey",
    price: 150,
    weight: 1,
    nonStack: false,
    model: "",
    image: "whiskey.png",
    information: "Sates Thirst",
    deg: false
}


itemList["420bar"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "420 Bar",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "420-bar.png",
    information: "Duuuude brah...",
    deg: false
}


itemList["69box"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "69 Cigar Box",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "69-cigar-box.png",
    information: "A taste of Cuba",
    deg: false
}


itemList["69pack"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "69 Brand Pack",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "69-brand-pack.png",
    information: "Just one more",
    deg: false
}


itemList["champagne"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Champagne",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "champagne.png",
    information: "Time to celebrate",
    deg: false
}


itemList["cgummies"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cannabis Gummies",
    price: 98,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cannabis-gummies.png",
    information: "Duuude...",
    deg: false
}


itemList["chloroform"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Chloroform",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "chloroform.png",
    information: "Special recipe!",
    deg: false
}

itemList["drugx"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Drug X",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "drug-x.png",
    information: "Now in testing by Humane Labs",
    deg: false
}



// food

itemList["beer"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Beer",
    price: 80,
    weight: 1,
    nonStack: false,
    model: "",
    image: "beer.png",
    information: "Sates Thirst",
    deg: false
}


itemList["bfsandwich"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Breakfast Sandwich",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "breakfast-sandwich.png",
    information: "Rise and shine",
    deg: false
}


itemList["cbballs"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cluckin Balls",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cluckin-balls.png",
    information: "Ooh..salty. 440Cal",
    deg: false
}


itemList["cbbucket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Chicken Bucket",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "chicken-bucket.png",
    information: "I like chicken! 2350Cal",
    deg: false
}


itemList["cbclucker"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Little Clucker",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "little-clucker.png",
    information: "Cluckin toy not included",
    deg: false
}


itemList["cbdrink"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cluckin Drink",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cluckin-drink.png",
    information: "Hell Cluckin Yeah",
    deg: false
}


itemList["cbfarmers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Farmer's Surprise",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "farmers-surprise.png",
    information: "The chewy bits arent harmful",
    deg: false
}


itemList["cbfowl"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Fowl Burger",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "fowl-burger.png",
    information: "If you enjoyed it, the chicken didnt die in vain! 900Cal",
    deg: false
}


itemList["cbfries"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cluckin Fries",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cluckin-fries.png",
    information: "Cluckinsize included. 680Cal",
    deg: false
}


itemList["cbrings"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cluckin Rings",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cluckin-rings.png",
    information: "Suffering never tasted so good! 850Cal",
    deg: false
}


itemList["cbrownie"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cannabis Brownie",
    price: 125,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cannabis-brownie.png",
    information: "Dude...",
    deg: false
}


itemList["cbveggy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Veggy Salad",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "veggy-salad.png",
    information: "Mystery chewy bits included. 750Cal",
    deg: false
}


itemList["cocoab"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cocoa Butter",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cocoa-butter.png",
    information: "Hecho en Guatemala",
    deg: false
}


itemList["cookie"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cookie",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cookie.png",
    information: "Baked with love",
    deg: false
}


itemList["crabcakes"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Crab Cakes",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "crab-cakes.png",
    information: "Scrumptious",
    deg: false
}


itemList["energybar"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Energy Bar",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "energy-bar.png",
    information: "Ego Chaser bars for chads",
    deg: false
}


itemList["pizza"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pizza Slice",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pizza-slice.png",
    information: "Check for pineapple",
    deg: false
}


itemList["sushiplate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sushi Plate",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "sushi-plate.png",
    information: "Dip fish-side first",
    deg: false
}


itemList["sushiroll"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sushi Rolls",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "sushi-rolls.png",
    information: "Made fresh",
    deg: false
}


itemList["wings"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Wings",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "wings.png",
    information: "Dont lick your fingers",
    deg: false
}


itemList["chips"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Chips",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "chips.png",
    information: "Phat Chips yeeeaaah.",
    deg: false
}


itemList["chocobar"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Chocolate Bar",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "chocolate-bar.png",
    information: "Mmm...Meteorite Bar",
    deg: false
}


itemList["macmix"] = { 
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mac & Cheese Mix",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "macandcheesemix.png",
    information: "Sapid",
    deg: false
}

itemList["maccheese"] = { 
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mac & Cheese",
    craft: [{
        itemid: "macmix",
        amount: 1
    }],
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "macn-cheese.png",
    information: "Sapid",
    deg: false
}


itemList["meteorite"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Fukang Meteorite",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "fukang-meteorite.png",
    information: "Out of this world",
    deg: false
}


itemList["pancakes"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pancakes",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pancakes.png",
    information: "Flat but tasty",
    deg: false
}


itemList["panini"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Panini Sandwich",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "panini-sandwich.png",
    information: "Piquant",
    deg: false
}


itemList["pinacolada"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pina Colada",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pina-colada.png",
    information: "And getting caught in the rain",
    deg: false
}


itemList["popcorn"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Popcorn",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "popcorn.png",
    information: "Dis gon b gud",
    deg: false
}


itemList["ramen"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ramen",
    craft: [{
        itemid: "water",
        amount: 1
    }],
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ramen.png",
    information: "Itadakimasu!",
    deg: false
}


itemList["bubblelasagna"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "'Lasagna'",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "bubblelasagna.png",
    information: "Cooked.. somehow..",
    deg: false
}


itemList["spaghetti"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Spaghetti",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "spaghetti.png",
    information: "Knees weak...",
    deg: false
}


itemList["spaghettican"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Can of Spaghetti",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "spaghetti-can.png",
    information: "Fresh from the trunk, awight?",
    deg: false
}


itemList["torta"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Torta",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "torta.png",
    information: "El mejor jamon",
    deg: false
}


// dayz food
itemList["coffee"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Coffee",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "coffee.png",
    information: "Wow, its strong.",
    deg: false
}


itemList["cola"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Cola",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "cola.png",
    information: "Sates Thirst",
    deg: false
}


itemList["burrito"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Burrito",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "burrito.png",
    information: "Burrito",
    deg: false
}


itemList["eggsbacon"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Eggs and Bacon",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1.2,
    nonStack: false,
    model: "",
    image: "eggs-and-bacon.png",
    information: "Great start to your morning",
    deg: false
}


itemList["donut"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Donut",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "donut.png",
    information: "Powered by Francis™",
    deg: false
}


itemList["foodgoods"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Food goods",
    price: 500,
    weight: 1,
    nonStack: false,
    model: "",
    image: "food-goods.png",
    deg: false
}


itemList["foodingredient"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Ingredients",
    price: 15,
    weight: 1,
    nonStack: false,
    model: "",
    image: "ingredients.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}


itemList["fries"] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: "Fries",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "fries.png",
    information: "Sates Hunger and reduces stress.",
    deg: false
}


itemList["greencow"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Green Cow",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 2,
    nonStack: false,
    model: "",
    image: "green-cow.png",
    information: "Slightly Increases Stamina and Speed",
    deg: false
}


itemList["churro"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Churro",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "churro.png",
    information: "Basically a long donut.",
    deg: false
}


itemList["bakingsoda"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Baking Soda",
    price: 50,
    weight: 0.3,
    nonStack: false,
    model: "",
    image: "bakingsoda.png",
    information: "it is what it is",
    deg: false
}


itemList["bleederburger"] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: "The Bleeder",
    craft: [{
        itemid: "bun",
        amount: 1
    }, {
        itemid: "patty",
        amount: 1
    }, {
        itemid: "tomato",
        amount: 1
    }, {
        itemid: "lettuce",
        amount: 1
    }],
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "the-bleeder.png",
    information: "Sates Hunger and reduces stress.",
    deg: false
}


itemList["water"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "Water",
    price: 8,
    weight: 1,
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    nonStack: false,
    model: "",
    image: "water.png",
    information: "Sates Thirst",
    deg: false
}


itemList["hotdog"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Hot Dog",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "hotdog.png",
    information: "Dont ask what is in it",
    deg: false
}

itemList["icecream"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Ice Cream",
    craft: [{
        itemid: "icecreammix",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "icecream.png",
    information: "Made from real human titty milk.",
    deg: false
}


itemList["jailfood"] = {
    fullyDegrades: true,
    decayrate: 0.001,
    displayname: "Jail Food",
    price: 0,
    weight: 50,
    nonStack: false,
    model: "",
    image: "jailfood.png",
    information: "+5 fat <br> Looks as bad as the Sheriff's aim.",
    deg: false
}


itemList["sandwich"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    displayname: "Sandwich",
    price: 15,
    weight: 1,
    nonStack: false,
    model: "",
    image: "sandwich.png",
    information: "Sates Hunger",
    deg: false
}


itemList["torpedo"] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: "Torpedo",
    craft: [{
        itemid: "bun",
        amount: 1
    }, {
        itemid: "patty",
        amount: 1
    }],
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "torpedo.png",
    information: "Sates Hunger and reduces stress.",
    deg: false
}


itemList["treat"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Dog Treat",
    price: 69,
    weight: 1,
    nonStack: false,
    model: "",
    image: "treat.png",
    information: "Feed to dog",
    deg: false
}


itemList["hamburger"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "Hamburger",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 20,
    weight: 1,
    nonStack: false,
    model: "",
    image: "hamburger.png",
    information: "Sates Hunger",
    deg: false
}


itemList["weedtaco"] = {
    fullyDegrades: true,
    decayrate: 0.00012,
    displayname: "Delivery",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 5,
    nonStack: false,
    model: "",
    image: "paperbag.png",
    information: "This aint free taco.",
    deg: false
}

itemList["illegaldelivery"] = {
    fullyDegrades: true,
    decayrate: 0.00012,
    displayname: "Delivery Product",
    price: 10,
    weight: 6,
    nonStack: false,
    model: "",
    image: "box.png",
    information: "This aint free taco.",
    deg: false
}


itemList["fishtaco"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Fish Taco",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "fishtaco.png",
    information: "Make like the fishes.",
    deg: false
}


itemList["heartstopper"] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: "The Heart Stopper",
    craft: [{
        itemid: "bun",
        amount: 1
    }, {
        itemid: "patty",
        amount: 1
    }, {
        itemid: "tomato",
        amount: 1
    }, {
        itemid: "lettuce",
        amount: 1
    }],
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "the-heart-stopper.png",
    information: "Sates Hunger and reduces stress.",
    deg: false
}


itemList["moneyshot"] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: "Money Shot",
    craft: [{
        itemid: "bun",
        amount: 1
    }, {
        itemid: "patty",
        amount: 1
    }, {
        itemid: "tomato",
        amount: 1
    }, {
        itemid: "lettuce",
        amount: 1
    }],
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "money-shot.png",
    information: "Sates Hunger and reduces stress.",
    deg: false
}


itemList["meatfree"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Meat Free",
    craft: [{
        itemid: "bun",
        amount: 1
    }, {
        itemid: "tomato",
        amount: 1
    }, {
        itemid: "lettuce",
        amount: 1
    }],
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "meat-free.png",
    information: "Sates Hunger and reduces stress.",
    deg: false
}


itemList["mshake"] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: "Milkshake",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "milkshake.png",
    information: "Hand-scooped for you",
    deg: false
}


itemList["taco"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Taco",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "taco.png",
    information: "This aint free taco.",
    deg: false
}


itemList["freshmeat"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Fresh Meat",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "rawmeat.png",
    information: "Meat, Wow..",
    deg: false
}



// materials

itemList["aluminium"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Aluminium",
    price: 10,
    weight: 0,
    nonStack: false,
    model: "",
    image: "aluminum.png",
    deg: false
}


itemList["fabric"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Fabric",
    price: 12,
    weight: 0,
    nonStack: false,
    model: "",
    image: "fabric.png",
    deg: false
}


itemList["plastic"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Plastic",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "plastic.png",
    deg: false
}


itemList["copper"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Copper",
    price: 10,
    weight: 0,
    nonStack: false,
    model: "",
    image: "copper.png",
    deg: false
}


itemList["electronics"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Electronics",
    price: 15,
    weight: 0,
    nonStack: false,
    model: "",
    image: "electronics.png",
    deg: false
}


itemList["rubber"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Rubber",
    price: 10,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rubber.png",
    deg: false
}


itemList["scrapmetal"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Scrap Metal",
    price: 15,
    weight: 0,
    nonStack: false,
    model: "",
    image: "scrap-metal.png",
    deg: false
}


itemList["steel"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Steel",
    price: 15,
    weight: 0,
    nonStack: false,
    model: "",
    image: "steel.png",
    deg: false
}


itemList["glass"] = {
    craft: [{
        itemid: "recyclablematerial",
        amount: 1
    }],
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Glass",
    price: 12,
    weight: 0,
    nonStack: false,
    model: "",
    image: "glass.png",
    deg: false
}


itemList["advlockpick"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "Adv Lock Pick",
    craft: [{
        itemid: "aluminium",
        amount: 30
    }, {
        itemid: "plastic",
        amount: 30
    }, {
        itemid: "rubber",
        amount: 30
    }],
    price: 500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "advanced-lockpick.png",
    deg: false
}


itemList["armor"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "Chest Armor",
    craft: [{
        itemid: "aluminium",
        amount: 5
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 150,
    weight: 15,
    nonStack: false,
    model: "",
    image: "np_chest-armor.png",
    information: "Protects your chest more!",
    deg: false
}


itemList["pdarmor"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "PD Armor",
    craft: [{
        itemid: "aluminium",
        amount: 5
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 50,
    weight: 10,
    nonStack: false,
    model: "",
    image: "armor.png",
    information: "Protects your chest more!",
    deg: false
}


itemList["bandage"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "Bandage",
    price: 15,
    weight: 3,
    nonStack: false,
    model: "prop_ld_health_pack",
    image: "bandage.png",
    information: "Heals Wounds and Reduces Bleeding",
    deg: false
}

itemList["firstaid"] = {
    fullyDegrades: true,
    decayrate: 0.25,
    displayname: "First Aid Kit",
    price: 185,
    weight: 3,
    nonStack: false,
    model: "prop_ld_health_pack",
    image: "plutorp_bandage.png",
    information: "Heals Wounds and Reduces Bleeding",
    deg: false
}


// general items

itemList["aluminiumoxide"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Aluminium Oxide",
    price: 55,
    weight: 1,
    nonStack: false,
    model: "",
    image: "aluminum-oxide.png",
    deg: false
}


itemList["advrepairkit"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Adv Repair Kit",
    craft: [{
        itemid: "electronics",
        amount: 45
    }],
    price: 150,
    weight: 5,
    nonStack: false,
    model: "",
    image: "repair-toolkit.png",
    information: "1 Time use - degrades engine parts more than basic tool kits, repairs engine to full.",
    deg: false
}


itemList["assphone"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Ass Phone",
    price: 500,
    weight: 5,
    nonStack: false,
    model: "",
    image: "poophone.png",
    information: "-7 Jail <br> +5 Vibrate <br> You cant seem to work out the lock code? <br> If it has roleplay stats, it must be roleplay.",
    deg: false
}

// custom items

itemList["ace"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ace of Spades",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ace-of-spades.png",
    information: "Up your sleeve",
    deg: false
}


itemList["agothic"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "American Gothic",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "american-gothic.png",
    information: "Wood 1930",
    deg: false
}


itemList["armxray"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Arm X-Ray",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "arm-xray.png",
    information: "Ouch...",
    deg: false
}


itemList["atacos"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Tacos de Asada",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tacos-de-asada.png",
    information: "I could eat ten",
    deg: false
}


itemList["azpapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Aztecas Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "aztecas-papers.png",
    information: "Orale",
    deg: false
}


itemList["anime"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Anime Poster",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "np_anime-poster.png",
    information: "Weebs in uwu",
    deg: false
}


itemList["antlers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Antlers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "antlers.png",
    information: "A fine prize",
    deg: false
}


itemList["aodcut"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "AoD MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "aod-cut.png",
    information: "The fruits of Lester Arnold's labor",
    deg: false
}


itemList["bluebelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blue 622 Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "blue-belt.png",
    information: "Blue 622 - Sensei",
    deg: false
}


itemList["blackbelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Black Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "black-belt.png",
    information: "Master Rank 4/4",
    deg: false
}


itemList["blackchip"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Black Chip",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "black-chip.png",
    information: "Feel nice in your hand",
    deg: false
}


itemList["bglass"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Beer Glass",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "glass-of-beer.png",
    information: "Wait for this all to blow over",
    deg: false
}


itemList["bobross"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bob Ross Photo",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "bob-ross-photo.png",
    information: "Happy little loose ends...",
    deg: false
}


itemList["bondicut"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bondi Boys Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "bondi-cut.png",
    information: "And an old rocking chair",
    deg: false
}


itemList["bspapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ballas Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ballas-papers.png",
    information: "You good?",
    deg: false
}


itemList["bucket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bucket",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "bucket.png",
    deg: false
}


itemList["burialmask"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Burial Mask",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "burial-mask.png",
    information: "Mask of Tutankhamun",
    deg: false
}

itemList["rocket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rocket",
    price: 150,
    weight: 10,
    nonStack: false,
    model: "",
    image: "rocket.png",
    information: "Cause baby, you're a firework ",
    deg: false
}

itemList["firework1"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sparklers",
    price: 150,
    weight: 8,
    nonStack: false,
    model: "",
    image: "firewrokbox.png",
    information: "Cause baby, you're a firework ",
    deg: false
}

itemList["firework2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Novelty Fireworks",
    price: 150,
    weight: 8,
    nonStack: false,
    model: "",
    image: "firework.png",
    information: "Cause baby, you're a firework ",
    deg: false
}
itemList["fountain"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Fountain firework",
    price: 150,
    weight: 8,
    nonStack: false,
    model: "",
    image: "fountain.png",
    information: "Cause baby, you're a firework ",
    deg: false
}

itemList["mask"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mask",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "mask.png",
    information: "Who Dat?",
    deg: false
}

itemList["hat"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hat",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "hat.png",
    information: "Aye Nice Hat!",
    deg: false
}



itemList["braab"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Braab Shirt",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "braab-tshirt.png",
    information: "Yikes",
    deg: false
}


itemList["brain"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Brain MRI",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "brain-mri.png",
    information: "Ow...",
    deg: false
}


itemList["bonsai"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bonsai Tree",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "bonsai-tree.png",
    information: "Be one with nature",
    deg: false
}


itemList["cactus"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cactus",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cactus.png",
    information: "For the lazy",
    deg: false
}


itemList["cathat"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Children's Book",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "childrens-book.png",
    information: "Its story time...",
    deg: false
}


itemList["camille"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Camille",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "camille.png",
    information: "Monet 1866",
    deg: false
}


itemList["carbattery"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Car Battery",
    price: 150,
    weight: 8,
    nonStack: false,
    model: "",
    image: "car-battery.png",
    information: "Car Battery",
    deg: false
}


itemList["carhood"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Car Hood",
    price: 150,
    weight: 12,
    nonStack: false,
    model: "",
    image: "car-hood.png",
    information: "Car Hood",
    deg: false
}


itemList["cashroll"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Roll of Cash",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cash-roll.png",
    information: "Whats the count..",
    deg: false
}

itemList["wetcash"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Wet cash roll",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "wetcash.png",
    information: "Wet needs to be procesed",
    deg: false
}

itemList["wetcash2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Wet cash stack",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "moneyroll.png",
    information: "sheesh needs to be procesed",
    deg: false
}

itemList["wetcash3"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Wet cash band",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rollofcash.png",
    information: "sheesh needs to be procesed",
    deg: false
}


itemList["cashstack"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Stack of Cash",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cash-stack.png",
    information: "All nice and sequential.",
    deg: false
}


itemList["bdiamond"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blue Diamond",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "blue-diamond.png",
    information: "Bavaria 1918.",
    deg: false
}


itemList["band"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Band of Notes",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cash-stack.png",
    information: "profit",
    deg: false
}


itemList["rollcash"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Small Notes",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cash-roll.png",
    information: "profit",
    deg: false
}



itemList["battery"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Battery",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "battery.png",
    deg: false
}


itemList["bazooka"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bazooka Suppressor",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "bazooka-suppressor.png",
    information: "Good for a single shot.",
    deg: false
}


itemList["binoculars"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Binoculars",
    craft: [{
        itemid: "aluminium",
        amount: 5
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 87,
    weight: 2,
    nonStack: false,
    model: "",
    image: "binoculars.png",
    deg: false
}


itemList["bloodbag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blood Bag",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "blood-bag.png",
    information: "Just my type",
    deg: false
}


itemList["bloodvial"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blood Vial",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "blood-tube.png",
    information: "Simon ese",
    deg: false
}


itemList["blueb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blue Bandana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "blue-bandana.png",
    information: "Simon ese",
    deg: false
}


itemList["bluechip"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blue Chip",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "blue-chip.png",
    information: "Double or nothing",
    deg: false
}


itemList["bmary"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bloody Mary",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "bloody-mary.png",
    information: "With a hint of lemon",
    deg: false
}


itemList["Boombox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Boombox",
    price: 85,
    weight: 2,
    nonStack: false,
    model: "",
    image: "boombox.png",
    information: "Its a prop, wow?",
    deg: false
}


itemList["Box"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box",
    price: 45,
    weight: 1,
    nonStack: false,
    model: "",
    image: "shipping-box.png",
    information: "sheeshhh",
    deg: false
}

itemList["bag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bag",
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "bag.png",
    information: "Idk m8",
    deg: false
}

itemList["breadboard"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Breadboard",
    price: 60,
    weight: 1,
    nonStack: false,
    model: "",
    image: "breadboard.png",
    deg: false
}


itemList["camera"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "skay NP69",
    price: 0,
    weight: 1,
    nonStack: false,
    model: "",
    image: "camera.png",
    information: "Good camera",
    deg: false
}


itemList["casing"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bullet Casing",
    price: 10,
    weight: 0,
    nonStack: true,
    model: "",
    image: "pistol-ammo.png",
    deg: false
}


itemList["certificate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Certificate",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "certificate.png",
    information: "You made it!",
    deg: false
}


itemList["cgpapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "CG Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cg-papers.png",
    information: "Wata woozers",
    deg: false
}


itemList["chalice"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pimp Chalice",
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pimp-chalice.png",
    information: "Morgan Freidmans Legendary Pimp Chalice.",
    deg: false
}


itemList["champion"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Championship Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "champion-belt.png",
    information: "Money is in the rematch.",
    deg: false
}


itemList["chestxray"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Chest X-Ray",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "chest-xray.png",
    information: "Argh...",
    deg: false
}


itemList["chglass"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Champagne Glass",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "champagne-glass.png",
    information: "To us",
    deg: false
}


itemList["cigar"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cigar",
    price: 30,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cigar.png",
    deg: false
}


itemList["ciggy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cigarette",
    price: 250,
    weight: 1,
    nonStack: false,
    model: "",
    image: "cigarette.png",
    deg: false
}


itemList["civtrophy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Civilian of the Year",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "civ-trophy.png",
    information: "The greatest law-abiding citizen",
    deg: false
}


itemList["ckatana"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cursed Katana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cursed-katana.png",
    information: "Very honorable katana to slay Gojira",
    deg: false
}


itemList["cleaninggoods"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cleaning goods",
    price: 500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "cleaning-goods.png",
    deg: false
}


itemList["clotion"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cannabis Lotion",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cannabis-lotion.png",
    information: "Bro..duuudee..",
    deg: false
}


itemList["clover"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Four-leaf Clover",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "clover.png",
    information: "+255 Luck",
    deg: false
}


itemList["clutch"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Clutch",
    price: 30,
    weight: 5,
    nonStack: false,
    model: "",
    image: "clutch.png",
    deg: false
}


itemList["comp"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Composition",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "composition.png",
    information: "What do you think it means?",
    deg: false
}


itemList["corpsefeet"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Feet",
    price: 50,
    weight: 0,
    nonStack: false,
    model: "",
    image: "feet2.png",
    information: "Wheres the rest of the body?",
    deg: false
}


itemList["corpsehands"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hands",
    price: 50,
    weight: 0,
    nonStack: false,
    model: "",
    image: "hands.png",
    information: "Wheres the rest of the body?",
    deg: false
}


itemList["coupon10"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "10% Off Coupon",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "coupon-ten.png",
    information: "Limit only one per sale!",
    deg: false
}


itemList["coupon15"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "15% Off Coupon",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "coupon-fifteen.png",
    information: "Does not include jail time",
    deg: false
}


itemList["coupon25"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "25% Off Coupon",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "coupon-25.png",
    information: "Expires 01/2045",
    deg: false
}


itemList["cpelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cougar Pelt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cougar-pelt.png",
    information: "The hunter becomes the hunted",
    deg: false
}


itemList["crane"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Origami Crane",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "origami-crane.png",
    information: "Gaff approved",
    deg: false
}


itemList["csuey"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Chop Suey",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "chop-suey.png",
    information: "Hopper 1929",
    deg: false
}


itemList["ctooth"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cougar Tooth",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cougar-tooth.png",
    information: "Stalks its prey",
    deg: false
}


itemList["ctrophy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cooking Trophy",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cooking-trophy.png",
    information: "Shokugeki victory",
    deg: false
}


itemList["cuffs"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hand Cuffs",
    craft: [{
        itemid: "scrapmetal",
        amount: 100
    }],
    price: 69,
    weight: 1,
    nonStack: false,
    model: "",
    image: "cuffs.png",
    deg: false
}


itemList["cultneck"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cult Necklace",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cult-necklace.png",
    information: "One of us...",
    deg: false
}


itemList["dcboard"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Diamond Chessboard",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "diamond-chessboard.png",
    information: "Deep Blue cant appreciate this",
    deg: false
}


itemList["dcert"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Death Certificate",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "d-certificate.png",
    information: "In memoriam",
    deg: false
}


itemList["decrypterenzo"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Decrypter Enzo",
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "decrypter-enzo.png",
    deg: false
}


itemList["decrypterfv2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Decrypter Fv2",
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "decrypter-fv2.png",
    deg: false
}


itemList["decryptersess"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Decrypter Sess",
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "decrypter-sess.png",
    deg: false
}


itemList["dhide"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Deer Hide",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "deer-hide.png",
    information: "Call peta",
    deg: false
}


itemList["diamondrec"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Diamond Record",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "diamond-record.png",
    information: "10 Million units sold!!",
    deg: false
}

itemList["casinofob"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key Fob (Casino)",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "casinofob.png",
    information: "You Won A CAR!! Trade it in and get the car at the!",
    deg: false
}


itemList["casinofob2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key Fob",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "casinofob.png",
    information: "Keyfob (Legal)",
    deg: false
}

itemList["casinomembership"] = {
    fullyDegrades: false,
    decayrate: 0.1,
    displayname: "Casino Membership",
    price: 1,
    weight: 0,
    nonStack: true,
    model: "",
    image: "casino_membership.png",
    information: "Go Gamble!",
    deg: false
}

itemList["dice"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pair of Dice",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dice.png",
    information: "Just takin out the trash",
    deg: false
}


itemList["dodo"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Dodo Statue",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dodo-statue.png",
    information: "Arent these extinct?",
    deg: false
}


itemList["dodospit"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Dodo Spit",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dodo-spit.png",
    information: "What the..why?!",
    deg: false
}


itemList["doramaar"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Dora Maar au Chat",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dora-maar-auchat.png",
    information: "Picasso 1941",
    deg: false
}


itemList["dragon"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Dragon",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dragon.png",
    information: "Hopefully its not useless like in GOT",
    deg: false
}


itemList["dream"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Dreamcatcher",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dreamcatcher.png",
    information: "Sleep well",
    deg: false
}


itemList["drill"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Drill",
    craft: [{
        itemid: "aluminium",
        amount: 50
    }, {
        itemid: "plastic",
        amount: 50
    }, {
        itemid: "rubber",
        amount: 50
    }],
    price: 150,
    weight: 20,
    nonStack: false,
    model: "",
    image: "drill.png",
    deg: false
}


itemList["drillbit"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Drill Bit",
    price: 100,
    weight: 2,
    nonStack: false,
    model: "",
    image: "drill-bit.png",
    deg: false
}


itemList["drivingtest"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Driving Test",
    price: 10,
    weight: 1,
    nonStack: true,
    model: "",
    image: "driving-test.png",
    deg: false
}


itemList["dskull"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Diamond Skull",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "diamond-skull.png",
    information: "For the Love of God - Hirst 2007",
    deg: false
}


itemList["DuffelBag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Black Duffel Bag",
    price: 350,
    weight: 0,
    nonStack: false,
    model: "",
    image: "duffel.png",
    information: "Its a prop, wow?",
    deg: false
}


itemList["dusche"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Dusche Gold",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dusche-gold.png",
    information: "Let it pour",
    deg: false
}


itemList["dye"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Dye",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "dye.png",
    deg: false
}


itemList["electronickit"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Electronic Kit",
    craft: [{
        itemid: "electronics",
        amount: 230
    }],
    price: 900,
    weight: 15,
    nonStack: false,
    model: "",
    image: "electronic-kit.png",
    deg: false
}


itemList["emptybaggies"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pack of Empty Baggies",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "pack-of-empty-baggies.png",
    deg: false
}


itemList["enchiladas"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Enchiladas",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "enchiladas.png",
    information: "Mas chile por favor",
    deg: false
}


itemList["ering"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Engagement Ring",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "engagement-ring.png",
    information: "Hope its a yes...",
    deg: false
}


itemList["erpring"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gold Band Ring.",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "engagement-ring.png",
    information: "Its a Sapphire Diamond & Gold ring. You look upon the ring and it reads 'Isaacs Dearest'...",
    deg: false
}


itemList["evidence"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Evidence",
    price: 0,
    weight: 1,
    nonStack: true,
    model: "",
    image: "evidence.png",
    deg: false
}


itemList["evidencebag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Evidence Bag",
    price: 0,
    weight: 0,
    nonStack: true,
    model: "",
    image: "evidence-bag.png",
    deg: false
}


itemList["faberge"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Faberge Egg",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "faberge-egg.png",
    information: "Rockford Hills easter egg",
    deg: false
}


itemList["failtest"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Failed Test",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "failed-test.png",
    information: "Try again later",
    deg: false
}


itemList["fakeplate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Fake Plate Kit",
    craft: [{
        itemid: "electronics",
        amount: 10
    }],
    price: 50,
    weight: 0,
    nonStack: false,
    model: "",
    image: "plate.png",
    information: "Use on a vehicle to alter its plate or change it back - 1 time use..",
    deg: false
}


itemList["fbumper"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Front Bumper",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "front-bumper.png",
    information: "Ill have the tuna, no crust",
    deg: false
}


itemList["feathers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Feathers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "feathers.png",
    information: "Get plucked",
    deg: false
}


itemList["femmes"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Les Femmes d'Alger",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "les-femmes-dalger.png",
    information: "Picasso 1955",
    deg: false
}


itemList["fertilizer"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Fertilizer",
    price: 20,
    weight: 3,
    nonStack: false,
    model: "",
    image: "fertilizer.png",
    information: "Cool.",
    deg: false
}


itemList["filetm"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Filet Mignon",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "filet-mignon.png",
    information: "Succulent",
    deg: false
}


itemList["flowers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Flowers",
    price: 50,
    weight: 10,
    nonStack: false,
    model: "",
    image: "flowers.png",
    information: "Wow, so beautiful.",
    deg: false
}


itemList["flyer"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Flyer",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "flyer.png",
    information: "Invite people to your business or event!",
    deg: false
}

itemList["frappuccino"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Frappuccino",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "frappuccino.png",
    information: "Its like I have ESPN or something",
    deg: false
}


itemList["frisbee"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Frisbee",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "frisbee.png",
    information: "And she would throw it back to me",
    deg: false
}


itemList["ftartlet"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Fruit Tartlet",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "fruit-tartlet.png",
    information: "Flavorsome",
    deg: false
}


itemList["ftoast"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "French Toast",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "french-toast.png",
    information: "Delectable",
    deg: false
}


itemList["fuse"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Fuse",
    price: 30,
    weight: 1,
    nonStack: false,
    model: "",
    image: "fuse.png",
    deg: false
}


itemList["gachet"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Portrait of Dr.Gachet",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "portrait-of-drgachet.png",
    information: "Van Gogh 1890",
    deg: false
}


itemList["glowing"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Glowing Substance",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "glowing-substance.png",
    information: "May cause unexpected mutations",
    deg: false
}


itemList["glucose"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "500g Glucose",
    price: 50,
    weight: 0,
    nonStack: false,
    model: "",
    image: "glucose.png",
    information: "Mmmm Glucose. Mix with 10g Cocaine Bags to make street cocaine.",
    deg: false
}

itemList["goldchip"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gold Chip",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gold-chip.png",
    information: "All in",
    deg: false
}


itemList["goldcoin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gold Coin",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gold-coin.png",
    information: "Check inside for chocolate",
    deg: false
}


itemList["goldrec"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gold Record",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gold-record.png",
    information: "500, 000 units sold",
    deg: false
}


itemList["grandtete"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Grand Tete Mince",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "grand-tete-mince.png",
    information: "Giacometti 1954",
    deg: false
}


itemList["greekbust"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Greek Bust",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "greek-bust.png",
    information: "You sure its Greek?",
    deg: false
}


itemList["greenb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Green Bandana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "green-bandana.png",
    information: "Ay yo my mans",
    deg: false
}


itemList["greenbelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Green Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "green-belt.png",
    information: "Adept Rank 2/4",
    deg: false
}


itemList["greenchip"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Green Chip",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "green-chip.png",
    information: "Fold em",
    deg: false
}

itemList["BobCatCard"] = {
    fullyDegrades: false,
    illegal: true,
    craft: [{
        itemid: "ciggy",
        amount: 30
    }],
    decayrate: 0.0,
    displayname: "Bobcat Security Card",
    price: 3500,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gruppe6.png",
    information: "Looks handy",
    deg: false
}

itemList["Gruppe6Card"] = {
    fullyDegrades: false,
    illegal: true,
    craft: [{
        itemid: "ciggy",
        amount: 30
    }],
    decayrate: 0.0,
    displayname: "Gruppe Truck Card",
    price: 3500,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gruppe6.png",
    information: "Looks handy",
    deg: false
}


itemList["Gruppe6Card2"] = {
    fullyDegrades: false,
    illegal: true,
    craft: [{
        itemid: "assphone",
        amount: 5
    }, {
        itemid: "methbag",
        amount: 35
    }, {
        itemid: "ciggy",
        amount: 150
    }],
    decayrate: 0.0,
    displayname: "G6 HS Card",
    price: 3500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "gruppe62.png",
    information: "Looks handy",
    deg: false
}


itemList["Gruppe6Card22"] = {
    fullyDegrades: false,
    illegal: true,
    craft: [{
        itemid: "assphone",
        amount: 5
    }, {
        itemid: "methbag",
        amount: 55
    }, {
        itemid: "ciggy",
        amount: 1000
    }],
    decayrate: 0.0,
    displayname: "Fleeca Card",
    price: 3500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "gruppe622.png",
    information: "Fleeca?",
    deg: false
}


itemList["Gruppe6Card222"] = {
    fullyDegrades: false,
    illegal: true,
    craft: [{
        itemid: "assphone",
        amount: 5
    }, {
        itemid: "methbag",
        amount: 55
    }, {
        itemid: "ciggy",
        amount: 1000
    }],
    decayrate: 0.0,
    displayname: "G6 V2 Card",
    price: 3500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "Gruppe6222.png",
    information: "Looks handy",
    deg: false
}


itemList["Gruppe6Card3"] = {
    fullyDegrades: false,
    illegal: true,
    craft: [{
        itemid: "assphone",
        amount: 5
    }, {
        itemid: "methbag",
        amount: 15
    }, {
        itemid: "ciggy",
        amount: 30
    }],
    decayrate: 0.0,
    displayname: "Purple Card",
    price: 3500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "gruppe63.png",
    information: "Looks handy",
    deg: false
}


itemList["gsfpapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "GSF Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gsf-papers.png",
    information: "Triple OG approved",
    deg: false
}


itemList["gticket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Golden Ticket",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "golden-ticket.png",
    information: "Ask Coop",
    deg: false
}

itemList["goldticket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gold Ticket",
    price: 40,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ticket1.png",
    information: "Arcade Ticket",
    deg: false
}

itemList["pinkticket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pink Ticket",
    price: 30,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ticket2.png",
    information: "Arcade Ticket",
    deg: false
}
itemList["blueticket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blue Ticket",
    price: 20,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ticket3.png",
    information: "Arcade Ticket",
    deg: false
}


itemList["gum"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gum",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gum.png",
    information: "Release Gum. You chew, you suck then POW",
    deg: false
}


itemList["hairtonic"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hair Tonic",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "hair-tonic.png",
    information: "If youre malding try this",
    deg: false
}


itemList["harness"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Racing Harness",
    craft: [{
        itemid: "aluminium",
        amount: 15
    }, {
        itemid: "fabric",
        amount: 15
    }],
    price: 10000,
    weight: 1,
    nonStack: true,
    model: "",
    image: "harness.png",
    information: "Stops you from being YEETED",
    deg: false
}


itemList["heavycutters"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Heavy Cutters",
    price: 700,
    weight: 9,
    nonStack: false,
    model: "",
    image: "heavy-cutters.png",
    deg: false
}


itemList["heavydutydrill"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Heavy Duty Drill",
    craft: [{
        itemid: "aluminium",
        amount: 85
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "heavy-duty-drill.png",
    deg: false
}


itemList["hlights"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Headlights",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "headlights.png",
    information: "Cant detail a car with the cover on",
    deg: false
}


itemList["holybook"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Holy Book",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "holy-book.png",
    information: "For followers only...",
    deg: false
}


itemList["holyhum"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Holy Hummus",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "holy-hummus.png",
    information: "Praise be",
    deg: false
}


itemList["homme"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "L'Homme Qui Marche",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lhomme-qui-marche.png",
    information: "Giacometti 1960",
    deg: false
}


itemList["horchata"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Horchata",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "horchata.png",
    information: "A la gran puchica!",
    deg: false
}


itemList["icbelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Intercontinental Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "intercontinental-belt.png",
    information: "Bah gawd!",
    deg: false
}


itemList["idcard"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Citizen Card",
    price: 500,
    weight: 0,
    nonStack: true,
    model: "",
    image: "citizen-card.png",
    deg: false
}


itemList["IFAK"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "IFAK",
    price: 0,
    weight: 2,
    nonStack: false,
    model: "",
    image: "ifak.png",
    information: "Heals you over time and clots wounds.",
    deg: false
}


itemList["inkedmoneybag"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Inked Money Bag",
    price: 100000,
    weight: 35,
    nonStack: false,
    model: "",
    image: "inked-money-bag.png",
    information: "This belongs to the Vault Bank",
    deg: false
}


itemList["inkset"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Inked Set",
    price: 500,
    weight: 15,
    nonStack: false,
    model: "",
    image: "inked-money-bag.png",
    deg: false
}


itemList["ironoxide"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Iron Oxide",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "iron-oxide.png",
    deg: false
}


itemList["jadeite"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Jadeite Stone",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "jadeite-stone.png",
    information: "With envy",
    deg: false
}


itemList["joker"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Joker Card",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "joker.png",
    information: "How bout a magic trick?",
    deg: false
}


itemList["katana"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Katana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "katana.png",
    information: "Steel folded over 1000 times",
    deg: false
}


itemList["key1"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "HandCuff Key",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "key1.png",
    information: "Numbered Key",
    deg: false
}


itemList["key2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key 2",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "key2.png",
    information: "Numbered Key",
    deg: false
}


itemList["key3"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key 3",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "key3.png",
    information: "Numbered Key",
    deg: false
}


itemList["keya"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key A",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "keya.png",
    information: "Lettered Key",
    deg: false
}


itemList["keyb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key B",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "keyb.png",
    information: "Lettered Key",
    deg: false
}


itemList["keyc"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key C",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "keyc.png",
    information: "Lettered Key",
    deg: false
}


itemList["latte"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Latte",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "latte.png",
    information: "Thats so fetch",
    deg: false
}


itemList["lbpapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "LB Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lb-papers.png",
    information: "I plead guilty mon",
    deg: false
}


itemList["lighter"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lighter",
    price: 100,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lighter.png",
    information: "Dont start a fire with this. ",
    deg: false
}


itemList["lockpick"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lockpick",
    craft: [{
        itemid: "aluminium",
        amount: 25
    }, {
        itemid: "plastic",
        amount: 25
    }, {
        itemid: "rubber",
        amount: 25
    }],
    price: 85,
    weight: 1,
    nonStack: false,
    model: "",
    image: "lockpick-set.png",
    deg: false
}


itemList["locksystem"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Air Pressure Lockpick",
    price: 3500,
    weight: 0,
    nonStack: false,
    model: "",
    image: "locksystem.png",
    information: "Used to blow out small locks - one time use.",
    deg: false
}


itemList["log"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Log",
    price: 10,
    weight: 2,
    nonStack: false,
    model: "",
    image: "wood.png",
    deg: false
}


itemList["logger"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Logger Beer",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "logger-beer.png",
    information: "Ming Ha Ling Bev. 2013",
    deg: false
}


itemList["lostcut"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter",
    deg: false
}


itemList["lostcut_aw"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Al Weaselton",
    deg: false
}


itemList["lostcut_cc"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Cooch Cassidy",
    deg: false
}


itemList["lostcut_cs"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Catherine Scratch",
    deg: false
}


itemList["lostcut_ga"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Gary Adams",
    deg: false
}


itemList["lostcut_gm"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Gazza Maloo",
    deg: false
}


itemList["lostcut_gs"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Greyson Sparks",
    deg: false
}


itemList["lostcut_jp"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Jason Paul",
    deg: false
}


itemList["lostcut_ng"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Negan Graham",
    deg: false
}


itemList["lostcut_rc"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Reginald Campbell",
    deg: false
}


itemList["lostcut_rd"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Reid Dankleaf",
    deg: false
}


itemList["lostcut_rr"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Rudi Rinsen",
    deg: false
}


itemList["lostcut_so"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Samuel O'Faolain",
    deg: false
}


itemList["lostcut_vm"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Victor Mason",
    deg: false
}


itemList["lostcut_wd"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Wyatt Derp",
    deg: false
}


itemList["lostcut_gt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of George Temple",
    deg: false
}


itemList["lostcut_ww"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Wade Willson",
    deg: false
}


itemList["lostcut_hm"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Holden Maloo",
    deg: false
}


itemList["lostcut_tr"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Taran Raid",
    deg: false
}


itemList["lostcut_dw"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />In honor of Denzel Washington",
    deg: false
}


itemList["lostcut_cd"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Cut",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-cut.png",
    information: "Sandy Shores Chapter<br />Property of Cherry Divine",
    deg: false
}


itemList["lostpapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Lost MC Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "lost-papers.png",
    information: "Does not work with meth",
    deg: false
}


itemList["lotion"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hand Lotion",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "hand-lotion.png",
    information: "My hands are dry I swear",
    deg: false
}


itemList["lspapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "LS Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ls-papers.png",
    information: "The city with the safest banks",
    deg: false
}


itemList["madamelr"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Madame LR",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "madame-lr.png",
    information: "Brancusi 1918",
    deg: false
}


itemList["maneki"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Maneki Neko",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "maneki-neko.png",
    information: "Good fortune beckons",
    deg: false
}


itemList["markedbills"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Marked Bills",
    price: 300,
    weight: 1,
    nonStack: false,
    model: "",
    image: "np_inked-money-bag.png",
    deg: false
}

itemList["martini"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Martini",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "martini.png",
    information: "Shaken, not stirred",
    deg: false
}


itemList["mdiptych"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Marilyn Diptych",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "marilyn-diptych.png",
    information: "Warhol 1962",
    deg: false
}


itemList["MedicalBag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Medical Bag",
    price: 25,
    weight: 0,
    nonStack: false,
    model: "",
    image: "medbag.png",
    information: "Its a prop, wow?",
    deg: false
}


itemList["mfalcon"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Maltese Falcon",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "maltese-falcon.png",
    information: "Highly prized movie prop",
    deg: false
}


itemList["Headphones"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Headphones",
    price: 250,
    weight: 1,
    nonStack: false,
    model: "",
    image: "headphones.png",
    information: "Bump your favorite songs!",
    deg: false
}


itemList["mixtape"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mixtape",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "mixtape.png",
    information: "Check it, yo",
    deg: false
}


itemList["mk2usbdevice"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "MKII USB Device",
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "mkii-usb-device.png",
    deg: false
}

itemList['toy_ott'] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: 'OTT Toy',
    price: 0,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'bs_toy_OTT.png',
    information: '(C2) 7/10. Collect them all!',
    collectible: true,
};

itemList["mobilephone"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "iPhone",
    price: 500,
    weight: 1,
    craft: [{
        itemid: "iphonebattery",
        amount: 1
    }, {
        itemid: "aluminium",
        amount: 25
    }],
    nonStack: true,
    model: "",
    image: "phone.png",
    deg: false
}


itemList["monalisa"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mona Lisa",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "mona-lisa.png",
    information: "Da Vinci 1517",
    deg: false
}


itemList["moonshine"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Moonshine Jug",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "moonshine-jug.png",
    information: "Using the same jugs since 1910",
    deg: false
}


itemList["moonshinej"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Moonshine Jar",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "jar-of-moonshine.png",
    information: "Almost paint thinner",
    deg: false
}


itemList["mtrophy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mic Trophy",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "mic-trophy.png",
    information: "A star is born",
    deg: false
}

itemList["mtrophy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mic Trophy",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "mic-trophy.png",
    information: "A star is born",
    deg: false
}

itemList["muffinmix"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Muffin Mix",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "muffinmix.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}

itemList["icecreammix"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Ice Cream Mix",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "icecreamingredients.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}




itemList["muffin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    craft: [{
        itemid: "muffinmix",
        amount: 1
    }],
    displayname: "Muffin",
    price: 85,
    weight: 0,
    nonStack: false,
    model: "",
    image: "muffin.png",
    information: "Is your muffin buttered?",
    deg: false
}


itemList["mugbeer"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mug of Beer",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "mug-of-beer.png",
    information: "Cheers!",
    deg: false
}


itemList["mvial"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mysterious Vial",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "mysterious-vial.png",
    information: "Do not drink",
    deg: false
}


itemList["nachos"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Nachos",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "nachos.png",
    information: "Delicioso",
    deg: false
}


itemList["negg"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Napoleonic Egg",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "napoleonic-egg.png",
    information: "Faberge Series (2/3)",
    deg: false
}


itemList["nitrous"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Nitrous Oxide",
    craft: [{
        itemid: "aluminium",
        amount: 35
    }],
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "nitrous-oxide.png",
    deg: false
}


itemList["nmenu"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Nanakaze Menu",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "nanakaze-menu.png",
    information: "Take a look feller",
    deg: false
}


itemList["no10"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "No. 10",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "no10.png",
    information: "Rothko 1950",
    deg: false
}


itemList["no5"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "No. 5",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "no5.png",
    information: "Pollock 1948",
    deg: false
}


itemList["oil"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Oil",
    price: 10,
    weight: 0,
    nonStack: false,
    model: "",
    image: "oil.png",
    deg: false
}


itemList["okay"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ass Lockpick",
    price: 5,
    craft: [{
        itemid: "shitlockpick",
        amount: 100
    }],
    weight: 10,
    nonStack: false,
    model: "",
    image: "shitlockpick.png",
    information: "TBH its still shit, so shit its almost identical... almost.",
    deg: false
}


itemList["onigiri"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Onigiri",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "onigiri.png",
    information: "Delicious rice balls",
    deg: false
}


itemList["onion"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Onion",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 12,
    nonStack: false,
    model: "",
    image: "onion.png",
    information: "Are your eyes watering?",
    deg: false
}


itemList["oxygentank"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Oxygen Tank",
    craft: [{
        itemid: "aluminium",
        amount: 15
    }, {
        itemid: "plastic",
        amount: 15
    }, {
        itemid: "rubber",
        amount: 10
    }],
    price: 120,
    weight: 1,
    nonStack: false,
    model: "",
    image: "oxygen-tank.png",
    deg: false
}


itemList["pallet"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pallet of Boxes",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pallet-of-boxes.png",
    information: "Transportable goods",
    deg: false
}


itemList["passtest"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Passed Test",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "passed-test.png",
    information: "Excellent work",
    deg: false
}


itemList["paynepic"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Portrait of Payne",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "payne-portrait.png",
    information: "Cue tongue pop",
    deg: false
}


itemList["pearlneck"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pearl Necklace",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "dragon",
    information: "Good way to finish a date",
    deg: false
}


itemList["pegg"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pink Faberge Egg",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pink-faberge-egg.png",
    information: "Faberge Series (3/3)",
    deg: false
}


itemList["petchicken"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pet Chicken",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pet-chicken.png",
    information: "Careful around Cluckin Bell",
    deg: false
}


itemList["petfish"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pet Fish",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pet-fish.png",
    information: "Gold fish memory",
    deg: false
}


itemList["petrock"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pet Rock",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pet-rock.png",
    information: "You dont even have to feed it",
    deg: false
}


itemList["turtle"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Turtle",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pet-turtle.png",
    deg: false
}


itemList["pix1"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Pixerium Stick Small",
    price: 300,
    weight: 0,
    nonStack: false,
    model: "",
    image: "decrypter-fv2.png",
    deg: false
}


itemList["pix2"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Pixerium Stick Large",
    price: 1000,
    weight: 0,
    nonStack: false,
    model: "",
    image: "decrypter-enzo.png",
    deg: false
}

itemList["icecream2"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Ice Cream",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 85,
    weight: 1,
    nonStack: false,
    model: "",
    image: "icecream.png",
    information: "Ew, from the taco shop!",
    deg: false
}

itemList["mshake2"] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: "Milk Shake",
    craft: [{
        itemid: "foodingredient",
        amount: 1
    }],
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "milkshake.png",
    information: "Ew, from the taco shop!",
    deg: false
}

itemList["platinumrec"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Platinum Record",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "platinum-record.png",
    information: "1 Million units sold!",
    deg: false
}


itemList["popsicle"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Popsicle",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "popsicle.png",
    information: "Is that sea salt?",
    deg: false
}


itemList["portal"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Portal",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "portal.png",
    information: "Paden 2012",
    deg: false
}


itemList["ppapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Prison Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "prison-papers.png",
    information: "Dont ask where its been...",
    deg: false
}


itemList["pupusas"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pupusas",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pupusas.png",
    information: "Mas curtido vos",
    deg: false
}


itemList["purpleb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Purple Bandana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "purple-bandana.png",
    information: "Straight outta da cul-de-sac",
    deg: false
}


itemList["qhearts"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Queen of Hearts",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "queen-of-hearts.png",
    information: "Off with their heads!",
    deg: false
}


itemList["qualityscales"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "High Quality Scales",
    craft: [{
        itemid: "aluminium",
        amount: 25
    }, {
        itemid: "plastic",
        amount: 10
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 1000,
    weight: 2,
    nonStack: false,
    model: "",
    image: "high-quality-scales.png",
    information: "Weighs Baggies with no loss",
    deg: false
}


itemList["radio"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Radio",
    craft: [{
        itemid: "electronics",
        amount: 30
    }, {
        itemid: "plastic",
        amount: 5
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 250,
    weight: 1,
    nonStack: false,
    model: "",
    image: "radio.png",
    information: "Used to chat with people on a radio channel",
    deg: false
}

itemList["pdradio"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "PD Radio",
    craft: [{
        itemid: "electronics",
        amount: 30
    }, {
        itemid: "plastic",
        amount: 5
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 350,
    weight: 3,
    nonStack: false,
    model: "",
    image: "radio.png",
    information: "Used to chat with people in the police department.",
    deg: false
}


itemList["rbumper"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rear Bumper",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rear-bumper.png",
    information: "You owe me a ten second car",
    deg: false
}


itemList["recoupon10"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "10% Off Deal",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "recoupon10.png",
    information: "May not be used for drugs",
    deg: false
}


itemList["recoupon15"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "15% Off Deal",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "recoupon15.png",
    information: "We are not liable for any raids or robberies",
    deg: false
}


itemList["recoupon20"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "20% Off Deal",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "recoupon20.png",
    information: "May or may not be exchanged for a hug from Mr. Payne",
    deg: false
}


itemList["recoupon5"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "5% Off Deal",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "recoupon5.png",
    information: "Southside shootings are complimentary",
    deg: false
}


itemList["recyclablematerial"] = {
    fullyDegrades: true,
    decayrate: 0.0,
    displayname: "Recyclable Material",
    price: 20,
    weight: 0,
    nonStack: false,
    model: "",
    image: "recyclable-material.png",
    deg: false
}


itemList["redb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Red Bandana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "red-bandana.png",
    information: "Lean with me",
    deg: false
}


itemList["redbelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Red Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "red-belt.png",
    information: "Expert Rank 3/4",
    deg: false
}


itemList["redchip"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Red Chip",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "red-chip.png",
    information: "Calling your bluff",
    deg: false
}


itemList["redpack"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Redwood Pack",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "redwood-pack.png",
    information: "I can stop anytime",
    deg: false
}


itemList["refinedwood"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Refined Wood",
    price: 15,
    weight: 1,
    nonStack: false,
    model: "",
    image: "wood.png",
    deg: false
}


itemList["repairtoolkit"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Repair Toolkit",
    craft: [{
        itemid: "aluminium",
        amount: 5
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 50,
    weight: 15,
    nonStack: false,
    model: "",
    image: "repair-toolkit.png",
    information: "Used by Tow Truck drivers and repair people.",
    deg: false
}


itemList["riflebody"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rifle Body",
    price: 70,
    weight: 10,
    nonStack: false,
    model: "",
    image: "rifle-body.png",
    deg: false
}

itemList["bodybag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Body Bag",
    price: 25,
    weight: 10,
    nonStack: false,
    model: "",
    image: "bodybag.png",
    deg: false
}

itemList["bodybag2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Heavy Body Bag",
    price: 70,
    weight: 10,
    nonStack: false,
    model: "",
    image: "bodybag.png",
    deg: false
}



itemList["riflebodybox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box (10+ Rifle Bodys)",
    price: 200,
    weight: 85,
    nonStack: false,
    model: "",
    image: "rifle-box.png",
    deg: false
}


itemList["rims"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Racing Rims",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "racing-rims.png",
    information: "Best rims for the job",
    deg: false
}


itemList["rnovel"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Romance Novel",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "romance-novel.png",
    information: "A hurricane of passion",
    deg: false
}


itemList["rolexwatch"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rolex Watch",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rolex-watch.png",
    deg: false
}


itemList["rollingpaper"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rolling Paper",
    price: 10,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rolling-paper.png",
    information: "Required to roll joints!",
    deg: false
}


itemList["rooster"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rooster Pin",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rooster-pin.png",
    information: "With egg in hand...",
    deg: false
}


itemList["rose"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rose",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rose.png",
    information: "Cue dramatic monologue",
    deg: false
}


itemList["rpelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rabbit Pelt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "rabbit-pelt.png",
    information: "Magdumping ruins the pelt",
    deg: false
}


itemList["rtrophy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Racing Trophy",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "racing-trophy.png",
    information: "All I do is win",
    deg: false
}


itemList["ruby"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ruby",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ruby.png",
    information: "Like a sunrise",
    deg: false
}


itemList["russian"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Matryoshka Doll",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "matryoshka-doll.png",
    information: "If he dies, he dies, cyka.",
    deg: false
}


itemList["sake"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sake",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "sake.png",
    information: "Kampai!",
    deg: false
}


itemList["salvator"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Salvator Mundi",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "salvator-mundi.png",
    information: "Da Vinci 1500",
    deg: false
}


itemList["sbsxray"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "SBS X-Ray",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "sbs-xray.png",
    information: "Warlord size",
    deg: false
}


itemList["scanner"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Radio Scanner",
    craft: [{
        itemid: "aluminium",
        amount: 5
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 500,
    weight: 15,
    nonStack: false,
    model: "",
    image: "radio-scanner.png",
    information: "Used to receive random radio chatter.",
    deg: false
}


itemList["scissors"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Scissors",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "scissors.png",
    information: "Fuck me up fam",
    deg: false
}


itemList["scoin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gold Coin",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "secret-coin.png",
    information: "Ens causa sui",
    deg: false
}


itemList["scream"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "The Scream",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "the-scream.png",
    information: "Munch 1893",
    deg: false
}


itemList["screen"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Screen",
    price: 120,
    weight: 1,
    nonStack: false,
    model: "",
    image: "screen.png",
    deg: false
}


itemList["scripted"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Script",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "script.png",
    information: "Scripted? Reee",
    deg: false
}


itemList["sealedbucket"] = {
    fullyDegrades: false,
    price: 5,
    decayrate: 0.0,
    displayname: "Sealed Bucket",
    weight: 1,
    nonStack: true,
    model: "",
    image: "sealed-bucket.png",
    deg: false
}


itemList["sealedevidencebag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sealed Evidence Bag",
    price: 0,
    weight: 0,
    nonStack: true,
    model: "",
    image: "sealed-evidence-bag.png",
    deg: false
}


itemList["seat"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Seat",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "seat.png",
    information: "Only for the most hardcore of racers",
    deg: false
}


itemList["secretfile"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Secret File",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "secret-file.png",
    information: "High level clearance required",
    deg: false
}


itemList["securityblack"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Security Card",
    price: 1500,
    weight: 1,
    nonStack: false,
    model: "",
    image: 'cblk.png',
    information: "Some sort of security card..",
    deg: false
}


itemList["securityblue"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Security Card",
    price: 1500,
    weight: 1,
    nonStack: false,
    model: "",
    image: 'cb.png',
    information: "Some sort of security card..",
    deg: false
}


itemList["SecurityCase"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Security Case",
    price: 350,
    weight: 0,
    nonStack: false,
    model: "",
    image: "securitycase.png",
    information: "Its a prop, wow?",
    deg: false
}


itemList["securitygold"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Security Card",
    price: 1500,
    weight: 1,
    nonStack: false,
    model: "",
    image: 'cgld.png',
    information: "Some sort of security card..",
    deg: false
}


itemList["securitygreen"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Security Card",
    price: 1500,
    weight: 1,
    nonStack: false,
    model: "",
    image: 'cg.png',
    information: "Some sort of security card..",
    deg: false
}



itemList["fcadrive"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "FCA USB DRIVE",
    price: 1500,
    weight: 1,
    craft: [{
        itemid: "electronics",
        amount: 25
    }, {
        itemid: "steel",
        amount: 25
    }, {
        itemid: "rubber",
        amount: 25
    }],
    nonStack: false,
    model: "",
    image: 'heist_usb_green.png',
    information: "Some sort of USB drive..",
    deg: false
}

itemList["racingusb1"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.1,
    displayname: "USB Device",
    craft: [{
        itemid: "electronics",
        amount: 20
    }, {
        itemid: "fabric",
        amount: 10
    }],
    price: 1500,
    weight: 2,
    nonStack: false,
    model: "",
    image: 'plutorp_racingusb.png',
    information: "Some sort of USB drive..",
    deg: false
}

itemList["racingusb0"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.1,
    displayname: "USB Device",
        craft: [{
        itemid: "electronics",
        amount: 40
    }, {
        itemid: "fabric",
        amount: 20
    }],
    price: 1500,
    weight: 2,
    nonStack: false,
    model: "",
    image: 'plutorp_racingusb.png',
    information: "This usb allows you to create things !",
    deg: false
}


itemList["securityred"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Security Card",
    price: 1500,
    weight: 1,
    nonStack: false,
    model: "",
    image: 'cr.png',
    information: "Some sort of security card..",
    deg: false
}


itemList["sfinger"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Severed Finger",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "severed-finger.png",
    information: "Now we're even",
    deg: false
}


itemList["sgrace"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Saying Grace",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "saying-grace.png",
    information: "Rockwell 1951",
    deg: false
}


itemList["shampoo"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Shampoo",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "shampoo.png",
    information: "Full of body and volume",
    deg: false
}


itemList["shearsoj"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Shears of Justice",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "shears-of-justice.png",
    information: "Justice prevails",
    deg: false
}


itemList["shipbox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Shipping Box",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "shipping-box.png",
    information: "Free 2day shipping",
    deg: false
}


itemList["shipcrate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Shipping Crate",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "shipping-crate.png",
    information: "This side up",
    deg: false
}

itemList["materialcrate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Material Crate",
    price: 150,
    weight: 50,
    nonStack: true,
    model: "",
    image: "shipping-crate.png",
    information: "Can hear electronics!",
    deg: false
}


itemList["shitlockpick"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ass Lockpick",
    price: 0,
    craft: [{
        itemid: "jailfood",
        amount: 5
    }],
    weight: 1,
    nonStack: false,
    model: "",
    image: "shitlockpick.png",
    information: "-5 Jail <br> -3 Strength <br> +3 Intelligence <br> Why the fuck is this so heavy? CoPixel das why. <br> If it has roleplay stats, it must be roleplay.",
    deg: false
}


itemList["silvercoin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Silver Coin",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "silver-coin.png",
    information: "Dont lose it",
    deg: false
}


itemList["slushy"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.25,
    displayname: "slushy",
    price: 10,
    weight: 5,
    nonStack: false,
    model: "",
    image: "slushy.png",
    information: "Super Nice mate",
    deg: false
}


itemList["smallscales"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Small Scales",
    craft: [{
        itemid: "aluminium",
        amount: 25
    }, {
        itemid: "plastic",
        amount: 1
    }, {
        itemid: "rubber",
        amount: 1
    }],
    price: 150,
    weight: 1,
    nonStack: false,
    model: "",
    image: "small-scale.png",
    information: "Weighs Baggies with minimal loss",
    deg: false
}


itemList["smirror"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Side Mirror",
    price: 1,
    weight: 25,
    nonStack: false,
    model: "",
    image: "side-mirror.png",
    information: "On green, I'm going for it",
    deg: false
}


itemList["snakeskin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Snakeskin",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "snakeskin.png",
    information: "Sssss",
    deg: false
}


itemList["snowpic"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Photo of Snow",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "snow-photo.png",
    information: "My beloved Jacqueline Snow",
    deg: false
}


itemList["snowvhs"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "The Ultimate Boomer",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "snow-vhs.png",
    information: "Filmed On the Samsung flip phone from 2003 this high quality boomer production value will have you questioning.... Is that a dick?",
    deg: false
}


itemList["sound"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sound System",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "sound-system.png",
    information: "Makes your ears bleed",
    deg: false
}


itemList["sozepic"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Photo of Soze",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "soze-photo.png",
    information: "The State PO-lice's finest",
    deg: false
}


itemList["spoiler"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Spoiler",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "spoiler.png",
    information: "Quarter mile at a time",
    deg: false
}


itemList["sprunk"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sprunk",
    price: 10,
    weight: 1,
    nonStack: false,
    model: "",
    image: "sprunk.png",
    information: "The Essence of Life",
    deg: false
}


itemList["sskirts"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Side Skirts",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "side-skirts.png",
    information: "Ride or die, remember?",
    deg: false
}


itemList["starrynight"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Starry Night",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "starry-night.png",
    information: "Neither ear nor there",
    deg: false
}


itemList["stolen10ctchain"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "10ct Gold Chain",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "10ct-gold-chain.png",
    deg: false
}


itemList["stolen2ctchain"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "2ct Gold Chain",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "2ct-gold-chain.png",
    deg: false
}


itemList["stolen5ctchain"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "5ct Gold Chain",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "5ct-gold-chain.png",
    deg: false
}


itemList["stolen8ctchain"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "8ct Gold Chain ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "8ct-gold-chain.png",
    deg: false
}


itemList["stolencasiowatch"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Casio Watch ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "casio-watch.png",
    deg: false
}


itemList["stolengameboy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Gameboy ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "gameboy.png",
    deg: false
}


itemList["stoleniphone"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Apple Iphone ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "apple-iphone.png",
    deg: false
}


itemList["stolennokia"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Nokia Phone ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "nokia-phone.png",
    deg: false
}


itemList["stolenoakleys"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Oakley Sunglasses ",
    price: 8,
    weight: 0,
    nonStack: false,
    model: "",
    image: "oakley-sunglesses.png",
    deg: false
}


itemList["stolenpixel3"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pixel 3 Phone ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "pixel-2-phone.png",
    deg: false
}


itemList["stolenpsp"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "PSP ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "psp.png",
    deg: false
}


itemList["stolenraybans"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ray Ban Sunglasses ",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "raybans.png",
    deg: false
}

itemList["hacklaptop"] = {
    fullyDegrades: false,
    decayrate: 0.01,
    displayname: "FCA Laptop",
    price: 999,
    weight: 15,
    nonStack: true,
    model: "",
    image: "hacklaptop.png",
    information: "Cyber breach into something...",
    deg: false
}

itemList["boostingpad"] = {
    fullyDegrades: false,
    decayrate: 0.1,
    displayname: "Boosting Pad",
    price: 999,
    weight: 15,
    nonStack: true,
    model: "",
    image: "hacklaptop.png",
    information: "Boosting?",
    deg: false
}

itemList["gokartticket"] = {
    fullyDegrades: false,
    decayrate: 0.01,
    displayname: "Go Kart Ticket",
    price: 999,
    weight: 1,
    nonStack: true,
    model: "",
    image: "ticket1.png",
    information: "Go Kart Ticket?",
    deg: false
}

itemList["stolens8"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Stolen Samsung S8",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "samsung-s8.png",
    deg: false
}

itemList["samsungs8"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Samsung S8",
    price: 5,
    weight: 1,
    craft: [{
        itemid: "samsungbattery",
        amount: 1
    }, {
        itemid: "aluminium",
        amount: 25
    }],
    nonStack: false,
    model: "",
    image: "samsung-s8.png",
    deg: false
}

itemList["samsungbattery"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Samsung Battery",
    price: 5,
    weight: 1,
    craft: [{
        itemid: "electronics",
        amount: 10
    }],
    nonStack: false,
    model: "",
    image: "samsungbattery.png",
    deg: false
}

itemList["iphonebattery"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "iPhone Battery",
    price: 5,
    weight: 1,
    craft: [{
        itemid: "electronics",
        amount: 15
    }],
    nonStack: false,
    model: "",
    image: "iphonebattery.png",
    deg: false
}

itemList["stooth"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Shark Tooth",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "shark-tooth.png",
    information: "Gonna need a bigger boat",
    deg: false
}


itemList["Suitcase"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Suitcase",
    price: 80,
    weight: 0,
    nonStack: false,
    model: "",
    image: "suitcase.png",
    information: "Its a prop, wow?",
    deg: false
}


itemList["sunflower"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sunflower",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "sunflower.png",
    information: "Super effective vs zombies",
    deg: false
}


itemList["swheel"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Steering Wheel",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "steering-wheel.png",
    information: "Winning is winning...",
    deg: false
}


itemList["tagbelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Tag Team Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tag-team-belt.png",
    information: "Off the turbuckle",
    deg: false
}


itemList["tbag"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Transport Bag",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "transport-bag.png",
    information: "Keeping your organs fresh",
    deg: false
}


itemList["tbear"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Teddy Bear",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "teddy-bear.png",
    information: "Hug me",
    deg: false
}


itemList["tealb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Teal Bandana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "teal-bandana.png",
    information: "Simon ese",
    deg: false
}


itemList["telvis"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Triple Elvis",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "triple-elvis.png",
    information: "Warhol 1963",
    deg: false
}


itemList["textbooka"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Textbook A",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "textbook-a.png",
    information: "Buy new of course",
    deg: false
}


itemList["thermite"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Thermite",
    craft: [{
        itemid: "aluminium",
        amount: 10
    }, {
        itemid: "plastic",
        amount: 10
    }, {
        itemid: "rubber",
        amount: 10
    }],
    price: 0,
    weight: 5,
    nonStack: false,
    model: "",
    image: "thermite.png",
    deg: false
}


itemList["ticket"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ticket",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "ticket.png",
    information: "Admit one",
    deg: false
}


itemList["tire"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Tire",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tire.png",
    information: "Im going to get another set",
    deg: false
}


itemList["tissuebox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box of Tissues",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tissue-box.png",
    information: "Not what it seems I swear",
    deg: false
}


itemList["Toolbox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Toolbox",
    price: 350,
    weight: 0,
    nonStack: false,
    model: "",
    image: "toolbox.png",
    information: "Its a prop, wow?",
    deg: false
}


itemList["toothneck"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Tooth Necklace",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "tooth-necklace.png",
    information: "Shes a beauty",
    deg: false
}


itemList["trophy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Trophy",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "trophy.png",
    information: "Winner!",
    deg: false
}


itemList["backpack"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Back Pack",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "backpack.png",
    information: "Open it?",
    deg: false
}


itemList["boomerphone"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Boomer Phone",
    price: 5,
    weight: 0,
    nonStack: false,
    model: "",
    image: "boomerphone.png",
    information: "Made for boomers, extra large buttons and screen.",
    deg: false
}


itemList["umbrella"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Umbrella",
    price: 500,
    weight: 3,
    nonStack: false,
    model: "",
    image: "umbrella.png",
    deg: false
}


itemList["umetal"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Unknown Metal",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "unknown-metal.png",
    information: "Dont lick your fingers",
    deg: false
}


itemList["usbdevice"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Unknown USB Device",
    price: 300,
    weight: 5,
    nonStack: false,
    model: "",
    image: "np_unknown-usb-device.png",
    deg: false
}


itemList["valuablegoods"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Valuable Goods",
    craft: [{
        itemid: "goldbar",
        amount: 7
    }],
    price: 4000,
    weight: 4,
    nonStack: false,
    model: "",
    image: "valuable-goods.png",
    deg: false
}


itemList["viagra"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Viagra",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "viagra.png",
    information: "Magic little blue pill",
    deg: false
}


itemList["voodoo"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Voodoo Doll",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "voodoo-doll.png",
    information: "Beware the spirits",
    deg: false
}


itemList["vpapers"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Vagos Papers",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "vagos-papers.png",
    information: "No prrrraaaaaablem",
    deg: false
}

itemList["vulture"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Vulture Statue",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "vulture-statue.png",
    information: "For the culture",
    deg: false
}


itemList["wallet"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Wallet",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "wallet.png",
    information: "Includes picture of mom",
    deg: false
}


itemList["watch"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Watch",
    price: 20,
    weight: 1,
    nonStack: false,
    model: "",
    image: "watch.png",
    information: "It's a Watch",
    deg: false
}


itemList["wedding"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Wedding Ring",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "wedding-ring.png",
    information: "Did you know fifty percent...",
    deg: false
}


itemList["weeping"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Weeping Woman",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "weeping-woman.png",
    information: "Picasso 1937",
    deg: false
}


itemList["wglass"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Glass of Whiskey",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "glass-of-whiskey.png",
    information: "On the rocks",
    deg: false
}


itemList["whitebelt"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "White Belt",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "white-belt.png",
    information: "Novice Rank 1/4",
    deg: false
}


itemList["whitechip"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "White Chip",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "white-chip.png",
    information: "Hit me",
    deg: false
}


itemList["whitepearl"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "White Pearl",
    price: 0,
    weight: 1,
    nonStack: false,
    model: "",
    image: "white-pearl.png",
    deg: false
}


itemList["whitewine"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "White Wine",
    price: 250,
    weight: 0,
    nonStack: false,
    model: "",
    image: "white-wine-bottle.png",
    information: "Made from real crime free grapes",
    deg: false
}


itemList["wineglass"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Glass of Wine",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "glass-wine.png",
    information: "Quite exquisite",
    deg: false
}


itemList["wlilies"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Water Lilies",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "water-lilies.png",
    information: "Monet 1907",
    deg: false
}


itemList["xscondom"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "XSmall Condom",
    price: 150,
    weight: 0,
    nonStack: false,
    model: "",
    image: "xs-condom.png",
    information: "Its the motion in the ocean",
    deg: false
}


itemList["ydiamond"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Yellow Diamond",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "yellow-diamond.png",
    information: "Forever",
    deg: false
}


itemList["yellowb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Yellow Bandana",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "yellow-bandana.png",
    information: "Im tellin you",
    deg: false
}


itemList["zebra"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Zebra",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "zebra.png",
    information: "Vasarely 1937",
    deg: false
}


itemList["fakesnowvhs"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bootleg Boomer",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "fake-snow-vhs.png",
    information: "At this point you can not even tell if it is a dick or the roundhay garden scene from 1888.",
    deg: false
}


itemList["wigglue"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Wig glue",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "wig-glue.png",
    information: "Recommended by Snow.",
    deg: false
}


itemList["marstonrevolver"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "John Marston's Cattleman Revolver",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "marston-revolver.png",
    information: "Owned by John Marston, this Cattleman Revolver features a black steel frame inlaid with gold and a custom bone grip.",
    deg: false
}


itemList["cloak"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cloak",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "cloak.png",
    information: "Only to be used for some cloak and dagger shit by NoPixel management.",
    deg: false
}

// Meth Start
itemList["sudafed"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Sudafed",
    price: 7,
    weight: 1,
    nonStack: false,
    model: "",
    image: "sudafed.png",
    information: "Some type of medicine.",
    deg: false
}

itemList["antifreeze"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Anti-Freeze",
    price: 2,
    weight: 1,
    nonStack: false,
    model: "",
    image: "antifreeze.png",
    information: "Hot and a lil bit of Cold.",
    deg: false
}

itemList["acetone"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Acetone",
    price: 7,
    weight: 1,
    nonStack: false,
    model: "",
    image: "acetone.png",
    information: "Go clean ur nails goof ah.",
    deg: false
}

itemList["methraw"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blue Powder?",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "meth.png",
    information: "Dont Do Drugs Kids!",
    deg: false
}

itemList["methbrick"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Meth Brick",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "meth_raw.png",
    information: "Suger or Salt?",
    deg: false
}

itemList["1gmeth"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "5g Meth",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "meth1g.png",
    information: "Kryptonite?",
    deg: false
}

itemList["drugbaggy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Empty Drug Baggy",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "meth_empty_baggy.png",
    information: "Supot?",
    deg: false
}

// Meth End

// Coke Start
itemList["cokecured"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Powder",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "meth_cured.png",
    information: "Sugar or Salt?",
    deg: false
}

itemList["cokeuncut"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Uncut Coke",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "cocaine_uncut.png",
    information: "Pablo?",
    deg: false
}

itemList["action"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Action Figure",
    price: 1,
    weight: 3,
    nonStack: false,
    model: "",
    image: "action-figure.png",
    information: "Superhero: Impotent Rage",
    deg: false
}

itemList["ibuprofen"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ibuprofen",
    price: 150,
    weight: 2,
    nonStack: false,
    model: "",
    image: "ibuprofen.png",
    information: "Cures all. Right?",
    deg: false
}
// Coke End

// Event items
itemList["Bankbox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bank Box",
    price: 1,
    weight: 10,
    nonStack: false,
    model: "",
    image: "bankbox.png",
    information: "A locked bank box.",
    deg: false
}


itemList["Bankboxkey"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Briefcase Key",
    price: 1,
    weight: 1,
    nonStack: false,
    model: "",
    image: "bankboxkey.png",
    information: "A key that seems to fit somewhere.",
    deg: false
}


itemList["Heirloom"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Family Heirloom",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "heirloom.png",
    information: "Ring with a weird emblem carved in to it.",
    deg: false
}


itemList["Hobonickel1"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hobonickel",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "hobonickel1.png",
    information: "A fancy looking coin. Maybe you should keep this on your person.",
    deg: false
}


itemList["Hobonickel2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hobonickel",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "hobonickel2.png",
    information: "A fancy looking coin. Maybe you should keep this on your person.",
    deg: false
}


itemList["Hobonickel3"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hobonickel",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "hobonickel3.png",
    information: "A fancy looking coin. Maybe you should keep this on your person.",
    deg: false
}


itemList["Routemap"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Route Map",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "routemap.png",
    information: "A map that is showing you the way.",
    deg: false
}


itemList["Securebriefcase"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Secure Briefcase",
    price: 1,
    weight: 10,
    nonStack: false,
    model: "",
    image: "securebriefcase.png",
    information: "A Briefcase that only a handful of people can open.",
    deg: false
}


itemList["secretkey"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Key",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "key1.png",
    information: "This key allows you to enter into a damp wet money launder!",
    deg: false
}


itemList["Securitykey"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Security Key",
    price: 1,
    weight: 0,
    nonStack: false,
    model: "",
    image: "securitykey.png",
    information: "And interesting looking key. Does not seem to fit in a lock.",
    deg: false
}


itemList["Largesupplycrate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Large Supply crate",
    price: 1,
    weight: 150,
    nonStack: true,
    model: "",
    image: "supplycrate_large.png",
    information: "A very big and heavy crate.",
    deg: false
}


itemList["Mediumsupplycrate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Medium Supply crate",
    price: 1,
    weight: 100,
    nonStack: true,
    model: "",
    image: "supplycrate_medium.png",
    information: "A semi-heavy crate.",
    deg: false
}


itemList["Smallsupplycrate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Small Supply crate",
    price: 1,
    weight: 50,
    nonStack: true,
    model: "",
    image: "supplycrate_small.png",
    information: "A smaller crate that doesn't have much weight to it.",
    deg: false
}

itemList["weaponbox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Weapon Box",
    price: 1,
    weight: 50,
    nonStack: true,
    model: "",
    image: "supplycrate_small.png",
    information: "FUCK 12 BOOM BOOM I WANT YOU IN MY ROOM!",
    deg: false
}


itemList["foodsupplycrate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Food Supply crate",
    price: 1,
    weight: 50,
    nonStack: true,
    model: "",
    image: "supplycrate_medium.png",
    information: "Special delivery for Siz Fulker!",
    deg: false
}

// Burgershot
itemList["potato"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Sack of Potato's",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_potato.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}

itemList["cheese"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Cheese",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "np_ingredients_cheese.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}

itemList["coffeebeans"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Coffee Beans",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "np_ingredients_coffeebeans.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}

itemList["tomato"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Tomato",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_tomato.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}


itemList["lettuce"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Lettuce",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_lettuce.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}


itemList["patty"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Cooked Patty",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_patty.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}

itemList["rawpatty"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Raw Patty",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_patty_raw.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}


itemList["bun"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Hamburger Bun",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_bun.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}


itemList["milkshakeformula"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Milk Shake Formula",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_ingredients_icecream.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}


itemList["hfcs"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "High-Fructose Syrup",
    price: 3,
    weight: 3,
    nonStack: false,
    model: "",
    image: "erp_ingredients_hfcs.png",
    information: "Used to craft food - be aware, food doesnt last forever!",
    deg: false
}

itemList['burgershotbag'] = {
    fullyDegrades: true,
    decayrate: 0.5,
    displayname: 'BurgerShot Bag',
    price: 1,
    weight: 4,
    nonStack: true,
    model: '',
    image: 'np_burgershot_bag.png',
    information: 'Contains your Burger Shot order... or does it?',
    deg: false
}

// Progression
itemList['godbook'] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: 'Dummies For Dummies',
    price: 1,
    weight: 0,
    nonStack: true,
    model: '',
    image: 'textbook-a.png',
    information: 'You look like you need knowlage',
    deg: false,
};


itemList['newaccountbox'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Presents',
    price: 350,
    weight: 0,
    nonStack: false,
    model: '',
    image: 'box.png',
    information: 'Welcome to NoPixel!',
    deg: true,
};


itemList['pimpcane'] = {
    fullyDegrades: false,
    decayrate: 2.0,
    displayname: 'Cane',
    price: 350,
    weight: 0,
    nonStack: false,
    model: '',
    image: 'pimp-cane.png',
    information: 'Walk with style.',
    deg: true,
};

itemList['packagereceipt'] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: 'Dodgy looking receipt',
    price: 40,
    weight: 0,
    nonStack: true,
    model: '',
    information: 'Cops investiage',
    image: 'receipt.png',
    deg: false,
};

itemList['ownerreceipt'] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: 'Work Receipt',
    price: 40,
    weight: 0,
    nonStack: true,
    model: '',
    image: 'receipt.png',
    deg: false,
};

itemList['receipt'] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: 'Receipt',
    price: 40,
    weight: 0,
    nonStack: true,
    model: '',
    image: 'receipt.png',
    deg: false,
};


itemList['softdrink'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Soft Drink',
    price: 350,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'softdrink.png',
    information: 'Tastes to good',
    deg: false,
};


itemList['bscoffee'] = {
    fullyDegrades: true,
    decayrate: 0.01,
    displayname: 'Cheap Coffee',
    price: 50,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'bscoffee.png',
    information: 'Tastes like dirt, but has the caffeine you need',
    deg: false,
};



// weapon_taser
itemList['-820634585'] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: 'Taser',
    price: 10,
    craft: [{
            itemid: 'aluminium',
            amount: 1
        },
        {
            itemid: 'plastic',
            amount: 1
        },
        {
            itemid: 'rubber',
            amount: 1
        },
    ],
    weight: 5,
    nonStack: true,
    model: '',
    image: 'stun-gun.png',
    weapon: true,
    deg: false,
};


itemList['taserammo'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Taser Cartridges',
    craft: [{
            itemid: 'aluminium',
            amount: 1
        },
        {
            itemid: 'plastic',
            amount: 1
        },
        {
            itemid: 'rubber',
            amount: 1
        },
    ],
    price: 10,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'taserammo.png',
    deg: false,
};


// Nail gun nailgun
itemList['1748076076'] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: 'Nail gun',
    price: 10,
    craft: [{
            itemid: 'aluminium',
            amount: 1
        },
        {
            itemid: 'plastic',
            amount: 1
        },
        {
            itemid: 'rubber',
            amount: 1
        },
    ],
    weight: 11,
    nonStack: true,
    model: '',
    image: 'nailgun.png',
    weapon: true,
    deg: true,
};


// weapon_glock
itemList['-120179019'] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: 'Glock',
    price: 10,
    craft: [{
            itemid: 'aluminium',
            amount: 1
        },
        {
            itemid: 'plastic',
            amount: 1
        },
        {
            itemid: 'rubber',
            amount: 1
        },
    ],
    weight: 13,
    nonStack: true,
    model: '',
    image: 'weapon_glock.png',
    weapon: true,
    deg: true,
};

// Hunting

itemList["deer"] = {
    fullyDegrades: false, 
    decayrate: 0.5, 
    displayname: "Fresh Meat", 
    price: 0, 
    weight: 2, 
    nonStack: false, 
    model: "", 
    image: "deer.png", 
    information: "Delicious" , 
    deg: false
};

// FISHING
itemList['fishingrod'] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: 'Fishing Rod',
    price: 65,
    weight: 10,
    nonStack: true,
    model: '',
    image: 'fishing-rod.png',
    information: 'Lets fish',
    deg: false,
};


itemList['fishingbass'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Bass',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishing-bass.png',
    information: 'Striped Bass. Bass like the fish, not the officer',
    deg: false,
};


itemList['fish'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Fish',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fish.png',
    information: 'Fishy...',
    deg: false,
};

itemList['fishbait'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Fishing bait',
    price: 10,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishbait.png',
    information: 'Go catch fish.',
    deg: false,
};


itemList['cutfish'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Cut Fish',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'cutfish.png',
    information: 'Half Fishy...???',
    deg: false,
};


itemList['fishingbluefish'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Bluefish',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishing-bluefish.png',
    information: 'Whoever coined this name was a genius',
    deg: false,
};


itemList['fishingflounder'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Flounder',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishing-flounder.png',
    information: 'I went fishing and all I got was this lousy flounder',
    deg: false,
};


itemList['fishingmackerel'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Mackerel',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishing-mackerel.png',
    information: 'Sometimes holy',
    deg: false,
};


itemList['fishingcod'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Cod',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishing-cod.png',
    information: 'Modern Warfare',
    deg: false,
};


itemList['fishingwhale'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Baby Whale',
    price: 1,
    weight: 100,
    nonStack: true,
    model: '',
    image: 'fishing-whale.png',
    information: 'A fucking whale! Someone might be interested in buying it? Lol, jk. Throw it back. Unless..?',
    deg: false,
};


itemList['fishingdolphin'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Baby Dolphin',
    price: 1,
    weight: 100,
    nonStack: true,
    model: '',
    image: 'fishing-dolphin.png',
    information: 'A fucking dolphin! Someone might be interested in buying it? Lol, jk. Throw it back. Unless..?',
    deg: false,
};


itemList['fishingshark'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Baby Shark',
    price: 1,
    weight: 100,
    nonStack: true,
    model: '',
    image: 'fishing-shark.png',
    information: 'A fucking shark! Someone might be interested in buying it? Lol, jk. Throw it back. Unless..?',
    deg: false,
};

// FISHING JUNK

itemList['fishingboot'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Boot',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishingboot.png',
    information: 'insert shit here',
    deg: false,
};


itemList['fishinglog'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Log',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishinglog.png',
    information: 'insert shit here',
    deg: false,
};


itemList['fishingtin'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Tincan',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishingtin.png',
    information: 'insert shit here',
    deg: false,
};


itemList['-102323637'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Old broken bottle',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'glass-bottle.png',
    information: 'insert shit here',
    deg: false,
};


itemList['fishingtacklebox'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Tackle box',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishingtacklebox.png',
    information: 'insert shit here',
    deg: false,
};


itemList['fishingchest'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Treasure chest',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishingchest.png',
    information: 'insert shit here',
    deg: false,
};


itemList['fishinglockbox'] = {
    fullyDegrades: true,
    decayrate: 0.02,
    displayname: 'Lockbox',
    price: 1,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'fishinglockbox.png',
    information: 'insert shit here',
    deg: false,
};


itemList['fishingtunac'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Tuna Chip',
    craft: [{
        itemid: 'electronics',
        amount: 100
    }],
    price: 500,
    weight: 0,
    nonStack: false,
    model: '',
    image: 'tuner.png',
    information: 'Works better on boats.',
    deg: false,
};

// FISHING END

// Chicken Start
itemList['alive_chicken'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Alive Chicken',
    craft: [{
        itemid: '',
        amount: 100
    }],
    price: 500,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'alive_chicken.png',
    information: 'Poor Cardo',
    deg: false,
};
itemList['slaughtered_chicken'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Dead Chicken',
    craft: [{
        itemid: '',
        amount: 100
    }],
    price: 500,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'slaughtered_chicken.png',
    information: 'Damn that looks good',
    deg: false,
};
itemList['packaged_chicken'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Packaged Chicken',
    craft: [{
        itemid: '',
        amount: 100
    }],
    price: 500,
    weight: 3,
    nonStack: false,
    model: '',
    image: 'packaged_chicken.png',
    information: 'Ready to deliver',
    deg: false,
};
// Chicken End

// Mining Start
itemList['stone'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Stone',
    craft: [{
        itemid: '',
        amount: 100
    }],
    price: 500,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'stone.png',
    information: 'Ready to wash',
    deg: false,
};

itemList['washedstone'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Washed Stone',
    craft: [{
        itemid: '',
        amount: 0
    }],
    price: 100,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'washedstone.png',
    information: 'Ready to wash you stones',
    deg: false,
};

itemList['pickaxe'] = {
    fullyDegrades: true,
    decayrate: 0,
    displayname: 'Pickaxe',
    craft: [{
        itemid: '',
        amount: 0
    }],
    price: 150,
    weight: 7,
    nonStack: false,
    model: '',
    image: 'pickaxe.png',
    information: 'Ready to Mine',
    deg: false,
};

itemList['specialaxe'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Pickaxe',
    craft: [{
        itemid: '',
        amount: 70
    }],
    price: 500,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'specialaxe.png',
    information: 'Ready to destroy',
    deg: false,
};

itemList['sledgehammer'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Sledge Hammer',
    craft: [{
        itemid: '',
        amount: 70
    }],
    price: 500,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'sledgehammer.png',
    information: 'Ready to destroy',
    deg: false,
};


itemList['washedpan'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Wash Pan',
    craft: [{
        itemid: '',
        amount: 70
    }],
    price: 100,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'washpan.png',
    information: 'Hmmmm?',
    deg: false,
};

itemList["goldbar"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Gold Bar",
    craft: [{
        itemid: "",
        amount: 100
    }],
    price: 550,
    weight: 1,
    nonStack: false,
    model: "",
    image: "gold-bar.png",
    information: 'Ready to Melt',
    deg: false,
};

itemList['silverbar'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Silver Bar',
    craft: [{
        itemid: '',
        amount: 100
    }],
    price: 500,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'silverbar.png',
    information: 'Ready to deliver',
    information: 'Ready to Melt',
    deg: false,
};

itemList["ironbar"] = {
    fullyDegrades: false,
    illegal: true,
    decayrate: 0.0,
    displayname: "Iron Bar",
    craft: [{
        itemid: "",
        amount: 10
    }],
    price: 0,
    weight: 1,
    nonStack: false,
    model: "",
    image: "ironbar.png",
    information: 'Ready to Melt',
    deg: false,
};

itemList['copperbar'] = {
    fullyDegrades: true,
    decayrate: 0.1,
    displayname: 'Copper Bar',
    craft: [{
        itemid: '',
        amount: 100
    }],
    price: 500,
    weight: 1,
    nonStack: false,
    model: '',
    image: 'copperbar.png',
    information: 'Ready to Melt',
    deg: false,
};
// Mining End

// Hunting Start
itemList["huntingcarcass1"] = {
    fullyDegrades: false, 
    decayrate: 0.5, 
    displayname: "Carcass Level 1", 
    price: 0, 
    weight: 25, 
    nonStack: false, 
    model:  "", 
    image: "huntingcarcass1.png", 
    information: "Dam this shit looks hot! Level 1", 
    deg: false 
};
itemList["huntingcarcass2"] = {
    fullyDegrades: false, 
    decayrate: 0.5, 
    displayname: "Carcass Level 2", 
    price: 0, 
    weight: 50, 
    nonStack: false, 
    model:  "", 
    image: "huntingcarcass2.png", 
    information: "Dam this shit looks hot! Level 2", 
    deg: false 
};
itemList["huntingcarcass3"] = {
    fullyDegrades: false, 
    decayrate: 0.5, 
    displayname: "Carcass Level 3", 
    price: 0, 
    weight: 75, 
    nonStack: false, 
    model:  "", 
    image: "huntingcarcass3.png", 
    information: "Dam this shit looks hot! Level 3", 
    deg: false 
};
itemList["huntingcarcass4"] = {
    fullyDegrades: false, 
    decayrate: 0.5, 
    displayname: "Carcass Red", 
    price: 0, 
    weight: 100, 
    nonStack: false, 
    model:  "", 
    image: "huntingcarcass4.png", 
    information: "Dam this shit looks hot! What do I do with this now?", 
    deg: false 
};
// Hunting End


//rp shipment items

itemList["contract5"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Cargo Shipments",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "gallery_5star.png",
    information: "Big Shipments!",
    deg: false
}

itemList["boxofweed"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Weed Brick",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "box-of-weed-12-18-oz.png",
    information: "You already know.",
    deg: false
}

itemList["boxofweed2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "420",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "cocaine-brick.png",
    information: "You already know.",
    deg: false
}

itemList["barrel"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Barrel",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "barrel.png",
    information: "Please Be Careful!",
    deg: false
}

itemList["shippingcreate"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "shipping-crate.png",
    information: "Please Be Careful!",
    deg: false
}

itemList["shippingbox"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "shipping-box.png",
    information: "Please Be Careful!",
    deg: false
}

itemList["supplycreatelarge"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "supplycrate_large.png",
    information: "Please Be Careful!",
    deg: false
}


itemList["supplycreatemedium"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "supplycrate_medium.png",
    information: "Please Be Careful!",
    deg: false
}


itemList["supplycreatesmall"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Box",
    price: 50,
    weight: 1,
    nonStack: false,
    model: "",
    image: "supplycrate_small.png",
    information: "Please Be Careful!",
    deg: false
}

itemList["laptop4"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Yellow laptop",
    price: 50,
    weight: 5,
    craft: [{
        itemid: "electronics",
        amount: 70
    }, {
        itemid: "aluminium",
        amount: 70
    }],
    nonStack: false,
    model: "",
    image: "laptop01.png",
    information: "What could this be?",
    deg: false
}

itemList["laptop2"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Blue laptop",
    price: 50,
    weight: 5,
    craft: [{
        itemid: "electronics",
        amount: 70
    }, {
        itemid: "aluminium",
        amount: 70
    }],
    nonStack: false,
    model: "",
    image: "laptop02.png",
    information: "What could this be?",
    deg: false
}

itemList["laptop3"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Green laptop",
    price: 50,
    weight: 5,
    craft: [{
        itemid: "electronics",
        amount: 25
    }, {
        itemid: "aluminium",
        amount: 25
    }],
    nonStack: false,
    model: "",
    image: "laptop03.png",
    information: "What could this be?",
    deg: false
}

itemList["laptop1"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Red laptop",
    price: 50,
    weight: 5,
    craft: [{
        itemid: "electronics",
        amount: 35
    }, {
        itemid: "aluminium",
        amount: 35
    }],
    nonStack: false,
    model: "",
    image: "laptop04.png",
    information: "What could this be?",
    deg: false
}

itemList["vpnxj"] = {
    fullyDegrades: false,
    decayrate: 0.1,
    displayname: "VPN",
    price: 300,
    weight: 10,
    nonStack: false,
    model: "",
    image: "vpn-xj.png",
    deg: false
}

itemList["rentalpapers"] = {
    fullyDegrades: false,
    decayrate: 0.1,
    displayname: "Rental Papers",
    price: 0,
    weight: 1,
    nonStack: false,
    model: "",
    image: "rental_papers.png",
    information: "Question it?",
    deg: false
}

itemList["pdkeyfob"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Car Keyfob (PD)",
    price: 0,
    weight: 2,
    nonStack: false,
    model: "",
    image: "keyfob.png",
    information: "Police Issued",
    deg: false
}

//Herion shit

itemList["opiumpoppy"] = {
    fullyDegrades: false,
    decayrate: 0.5,
    displayname: "Opium Poppy",
    price: 0,
    weight: 3,
    nonStack: false,
    model: "",
    image: "opiumpoppy.png",
    information: "Freshly Picked",
    deg: false
}

// Vangelico

itemList["thermalcharge"] = {
    fullyDegrades: false,
    decayrate: 1,
    displayname: "Thermal Charge",
    price: 15000,
    weight: 10,
    nonStack: true,
    model: "",
    image: "plutorp_thermite_charge.png",
    information: "Highly obtained thing to own.",
    deg: false
}

// fredrickshi

itemList["jimpass"] = {
    fullyDegrades: false,
    decayrate: 0.1,
    displayname: "Jim Pass",
    price: 5000,
    weight: 10,
    nonStack: true,
    model: "",
    image: "burial-mask.png",
    information: "You dont wanna loose this",
    deg: false
}


// Pokemon

itemList["pokemonfolder"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pokemon File",
    price: 150,
    weight: 1,
    nonStack: false,
    model: "",
    image: "pokemonfolder.png",
    weapon: false,
    deg: false
}

itemList["shiningpack"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pokemon Pack",
    price: 500,
    weight: 1,
    nonStack: false,
    model: "",
    image: "shiningpack.png",
    weapon: false,
    deg: false
}

itemList["bulbasaur"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Bulbasaur Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "bulbasaur.png",
    weapon: false,
    deg: false
}

itemList["ivysaur"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ivysaur Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "ivysaur.png",
    weapon: false,
    deg: false
}

itemList["breloom"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Breloom Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "breloom.png",
    weapon: false,
    deg: false
}

itemList["torkoal"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Torkoal Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "torkoal.png",
    weapon: false,
    deg: false
}

itemList["larvesta"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Larvesta Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "larvesta.png",
    weapon: false,
    deg: false
}

itemList["litten"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Litten Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "litten.png",
    weapon: false,
    deg: false
}

itemList["torracat"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Torracat Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "torracat.png",
    weapon: false,
    deg: false
}

itemList["totodile"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Totodile Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "totodile.png",
    weapon: false,
    deg: false
}

itemList["croconaw"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Croconaw Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "croconaw.png",
    weapon: false,
    deg: false
}

itemList["qwilfish"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Qwilfish Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "qwilfish.png",
    weapon: false,
    deg: false
}

itemList["buizel"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Buizel Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "buizel.png",
    weapon: false,
    deg: false
}

itemList["pikachu"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Pikachu Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "pikachu.png",
    weapon: false,
    deg: false
}

itemList["voltorb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Voltorb Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "voltorb.png",
    weapon: false,
    deg: false
}

itemList["plusle"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Plusle Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "plusle.png",
    weapon: false,
    deg: false
}

itemList["minun"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Minun Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "minun.png",
    weapon: false,
    deg: false
}

itemList["ekans"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Ekans Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "ekans.png",
    weapon: false,
    deg: false
}

itemList["jynx"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Jynx Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "jynx.png",
    weapon: false,
    deg: false
}

itemList["golett"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Golett Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "golett.png",
    weapon: false,
    deg: false
}

itemList["stunfisk"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Stunfisk Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "stunfisk.png",
    weapon: false,
    deg: false
}

itemList["purrloin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Purrloin Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "purrloin.png",
    weapon: false,
    deg: false
}

itemList["scraggy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Scraggy Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "scraggy.png",
    weapon: false,
    deg: false
}

itemList["zorua"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Zorua Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "zorua.png",
    weapon: false,
    deg: false
}

itemList["shaymin"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Shaymin Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "shaymin.png",
    weapon: false,
    deg: false
}

itemList["virizion"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Virizion Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "virizion.png",
    weapon: false,
    deg: false
}

itemList["reshiram"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Reshiram Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "reshiram.png",
    weapon: false,
    deg: false
}

itemList["palkia"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Palkia Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "palkia.png",
    weapon: false,
    deg: false
}

itemList["manaphy"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Manaphy Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "manaphy.png",
    weapon: false,
    deg: false
}

itemList["keldeo"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Keldeo Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "keldeo.png",
    weapon: false,
    deg: false
}

itemList["raikou"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Raikou Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "raikou.png",
    weapon: false,
    deg: false
}

itemList["zekrom"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Zekrom Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "zekrom.png",
    weapon: false,
    deg: false
}

itemList["latios"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Latios Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "latios.png",
    weapon: false,
    deg: false
}

itemList["marshadow"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Marshadow Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "marshadow.png",
    weapon: false,
    deg: false
}

itemList["yveltal"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Yveltal Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "yveltal.png",
    weapon: false,
    deg: false
}

itemList["hoopa"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Hoopa Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "hoopa.png",
    weapon: false,
    deg: false
}

itemList["genesect"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Genesect Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "genesect.png",
    weapon: false,
    deg: false
}

itemList["volcanion"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Volcanion Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "volcanion.png",
    weapon: false,
    deg: false
}

itemList["mew"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Mew Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "mew.png",
    weapon: false,
    deg: false
}

itemList["jiranchi"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Jiranchi Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "jiranchi.png",
    weapon: false,
    deg: false
}

itemList["rayquaza"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Rayquaza Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "rayquaza.png",
    weapon: false,
    deg: false
}

itemList["arceus"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Arceus Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "arceus.png",
    weapon: false,
    deg: false
}

itemList["venusaur"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Venusaur Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "venusaur.png",
    weapon: false,
    deg: false
}

itemList["carnivine"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Carnivine Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "carnivine.png",
    weapon: false,
    deg: false
}

itemList["volcarona"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Volcarona Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "volcarona.png",
    weapon: false,
    deg: false
}

itemList["incineroar"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Incineroar Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "incineroar.png",
    weapon: false,
    deg: false
}

itemList["feraligatr"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Feraligatr Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "feraligatr.png",
    weapon: false,
    deg: false
}

itemList["floatzel"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Floatzel Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "floatzel.png",
    weapon: false,
    deg: false
}

itemList["electrode"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Electrode Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "electrode.png",
    weapon: false,
    deg: false
}

itemList["arbok"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Arbok Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "arbok.png",
    weapon: false,
    deg: false
}

itemList["golurk"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Golurk Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "golurk.png",
    weapon: false,
    deg: false
}

itemList["spiritomb"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Spiritomb Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "spiritomb.png",
    weapon: false,
    deg: false
}

itemList["liepard"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Liepard Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "liepard.png",
    weapon: false,
    deg: false
}

itemList["scrafty"] = {
    fullyDegrades: false,
    decayrate: 0.0,
    displayname: "Scrafty Card",
    price: 250,
    weight: 0,
    nonStack: true,
    model: "",
    image: "scrafty.png",
    weapon: false,
    deg: false
}

// crab shit

itemList["crab"] = {
    fullyDegrades: false,
    decayrate: 1.2,
    displayname: "Crab",
    price: 100000,
    weight: 2,
    nonStack: false,
    model: "",
    image: "crab.png",
    deg: false
}

itemList["crabcage"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Crab Cage",
    price: 100,
    weight: 5,
    nonStack: true,
    model: "",
    image: "crabcage.png",
    deg: false
}

// custom house robbery items

itemList["gamingkeyboard"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Gaming Keyboard",
    price: 25,
    weight: 3,
    nonStack: true,
    model: "",
    image: "gamingkeyboard.png",
    deg: false
}

itemList["gamingmouse"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Gaming Mouse",
    price: 25,
    weight: 3,
    nonStack: true,
    model: "",
    image: "gamingmouse.png",
    deg: false
}

itemList["gamingpc"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Gaming PC",
    price: 25,
    weight: 7,
    nonStack: true,
    model: "",
    image: "pc.png",
    deg: false
}

itemList["ps5"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Playstation 5",
    price: 25,
    weight: 5,
    nonStack: true,
    model: "",
    image: "ps5.png",
    deg: false
}

itemList["nitendoswitch"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Nitendo switch",
    price: 25,
    weight: 4,
    nonStack: true,
    model: "",
    image: "nitendoswitch.png",
    deg: false
}

// drilling shit

itemList["goldore"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Gold ore",
    price: 25,
    weight: 4,
    nonStack: true,
    model: "",
    image: "goldore.png",
    deg: false
}

itemList["uncutruby"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Uncut Ruby",
    price: 25,
    weight: 4,
    nonStack: true,
    model: "",
    image: "uncutruby.png",
    deg: false
}

itemList["uncutsapphire"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Uncut Sapphire",
    price: 25,
    weight: 4,
    nonStack: true,
    model: "",
    image: "uncutsapphire.png",
    deg: false
}

itemList["silverore"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Silver Ore",
    price: 25,
    weight: 4,
    nonStack: true,
    model: "",
    image: "silverore.png",
    deg: false
}

// great idea mate

itemList["rustyweapon"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Rusty Weapon",
    price: 1500,
    weight: 6,
    nonStack: true,
    model: "",
    image: "rusty_weapon.png",
    deg: false
}

itemList["polishkit"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Polishing Kit",
    price: 250,
    weight: 7,
    nonStack: true,
    model: "",
    image: "polishing_kit.png",
    deg: false
}

// added shit

itemList["safecracker"] = {
    fullyDegrades: false,
    decayrate: 1.0,
    displayname: "Safe Cracker",
    price: 10000,
    weight: 4,
    nonStack: true,
    model: "",
    image: "safecracker.png",
    deg: false
}
