local myJob = nil
local isPolice = false
local isEMS = false

local accessCheckCache = {}
local accessCheckCacheTimer = {}
local businesses = {}
local businessesCacheTimer = nil

local securityAccess = {}
function setSecuredAccesses(pAccesses, pType)
    securityAccess[pType] = pAccesses
    accessCheckCache[pType] = {}
    accessCheckCacheTimer[pType] = {}
end

function clearAccessCache()
    for accessType, _ in pairs(accessCheckCache) do
        accessCheckCacheTimer[accessType] = {}
    end
end


RegisterNetEvent("plutorp-jobmanager:playerBecameJob")
AddEventHandler("plutorp-jobmanager:playerBecameJob", function(job, name, notify)
    if isPolice and job ~= "police" then isPolice = false end
    if isEMS and job ~= "ems" then isEMS = false end
    if isDoc and job ~= "ems" then isDoc = false end
    if isTher and job ~= "ems" then isTher = false end

    if job == "police" then isPolice = true end
    if job == "ems" then isEMS = true end
    if job == "ems" then isDosc = true end
    if job == "ems" then isTher = true end
    clearAccessCache()
end)

function getBusinesses()
    if businessesCacheTimer ~= nil and businessesCacheTimer + 60000 > GetGameTimer() then -- 1 minute
        return businesses
    end

    local characterId = exports["plutorp_manager"]:isPed("cid")
    local employment = RPC.execute("GetEmploymentInformation", { character = { id = characterId } })
    businesses = employment
    return businesses
end

function hasSecuredAccess(pId, pType)
    if accessCheckCacheTimer[pType][pId] ~= nil and accessCheckCacheTimer[pType][pId] + 60000 > GetGameTimer() then -- 1 minute
        return accessCheckCache[pType][pId] == true
    end

    local characterId = exports['plutorp_manager']:isPed("cid")
    accessCheckCacheTimer[pType][pId] = GetGameTimer()

    local job = exports['plutorp_manager']:isPed("myjob")

    local authorized = securityAccess[pType][pId]
    if not authorized then return end
    if authorized.forceUnlocked then
      return false
    end
 
    if  (authorized.access.job and authorized.access.job[myJob] or false)
        or  (authorized.access.job["PD"] ~= nil and isPolice or isEMS)
        or  (authorized.access.job["police"] ~= nil and isPolice)
        or  (authorized.access.job["EMS"] ~= nil and isEMS)
        or  (authorized.access.job["ems"] ~= nil and isEMS)
        or  (authorized.access.job["ems"] ~= nil and isEMS)
        or  (authorized.access.job["Public"] ~= nil)
        or  (authorized.access.cid ~= nil and authorized.access.cid[characterId] ~= nil)
    then
      --  print("gettintg here")
        accessCheckCache[pType][pId] = true
        return true
    end

    if authorized.access.item ~= nil then
        accessCheckCacheTimer[pType][pId] = 0
        for i, v in pairs(authorized.access.item) do
            if exports["plutorp-inventory"]:hasEnoughOfItem(i, 1, false) then
                return true
            end
        end
    end

    local employment = getBusinesses()
    if employment ~= nil then
        for _, business in pairs(employment) do
            if authorized.access.business and authorized.access.business[employment.code] == true then
                if employment.permissions == "property_keys" then
                    accessCheckCache[pType][pId] = true
                    return true
                end
            end
        end
    end
  
    accessCheckCache[pType][pId] = false
    return false
end