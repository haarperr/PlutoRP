MRP.Player = MRP.Player or {}
MRP.LocalPlayer = MRP.LocalPlayer or {}

local function GetUser()
    return MRP.LocalPlayer
end

function MRP.LocalPlayer.setVar(self, var, data)
    GetUser()[var] = data
end

function MRP.LocalPlayer.getVar(self, var)
    return GetUser()[var]
end

function MRP.LocalPlayer.setCurrentCharacter(self, data)
    if not data then return end
    GetUser():setVar("character", data)
end

function MRP.LocalPlayer.getCurrentCharacter(self)
    return GetUser():getVar("character")
end

RegisterNetEvent("plutorp-core:networkVar")
AddEventHandler("plutorp-core:networkVar", function(var, val)
    MRP.LocalPlayer:setVar(var, val)
end)

