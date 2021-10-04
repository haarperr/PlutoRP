MRP.Core = MRP.Core or {}

function MRP.Core.ConsoleLog(self, msg, mod)
    if not tostring(msg) then return end
    if not tostring(mod) then mod = "No Module" end
    
    local pMsg = string.format("[MRP LOG - %s] %s", mod, msg)
    if not pMsg then return end

end

RegisterNetEvent("plutorp-core:consoleLog")
AddEventHandler("plutorp-core:consoleLog", function(msg, mod)
    MRP.Core:ConsoleLog(msg, mod)
end)

function getModule(module)
    if not MRP[module] then 
      --  print("Warning: '" .. tostring(module) .. "' module doesn't exist") 
        return false 
    end
    return MRP[module]
end

function addModule(module, tbl)
    if MRP[module] then 
       -- print("Warning: '" .. tostring(module) .. "' module is being overridden") 
    end
    MRP[module] = tbl
end

MRP.Core.ExportsReady = false

function MRP.Core.WaitForExports(self)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if exports and exports["plutorp-core"] then
                TriggerEvent("plutorp-core:exportsReady")
                MRP.Core.ExportsReady = true
                return
            end
        end
    end)
end

exports("getModule", getModule)
exports("addModule", addModule)

MRP.Core:WaitForExports()

