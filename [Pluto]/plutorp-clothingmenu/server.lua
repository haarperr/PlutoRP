local function checkExistenceClothes(cid, cb)
    exports.ghmattimysql:execute("SELECT cid FROM character_current WHERE cid = @cid LIMIT 1;", {["cid"] = cid}, function(result)
        local exists = result and result[1] and true or false
        cb(exists)
    end)
end

local function checkExistenceFace(cid, cb)
    exports.ghmattimysql:execute("SELECT cid FROM character_face WHERE cid = @cid LIMIT 1;", {["cid"] = cid}, function(result)
        local exists = result and result[1] and true or false
        cb(exists)
    end)
end

RegisterServerEvent("plutorp-clothingmenu:insert_character_current")
AddEventHandler("plutorp-clothingmenu:insert_character_current",function(data)
    if not data then return end
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    if not characterId then return end
    checkExistenceClothes(characterId, function(exists)
        local values = {
            ["cid"] = characterId,
            ["model"] = json.encode(data.model),
            ["drawables"] = json.encode(data.drawables),
            ["props"] = json.encode(data.props),
            ["drawtextures"] = json.encode(data.drawtextures),
            ["proptextures"] = json.encode(data.proptextures),
        }

        if not exists then
            local cols = "cid, model, drawables, props, drawtextures, proptextures"
            local vals = "@cid, @model, @drawables, @props, @drawtextures, @proptextures"

            exports.ghmattimysql:execute("INSERT INTO character_current ("..cols..") VALUES ("..vals..")", values, function()
            end)
            return
        end

        local set = "model = @model,drawables = @drawables,props = @props,drawtextures = @drawtextures,proptextures = @proptextures"
        exports.ghmattimysql:execute("UPDATE character_current SET "..set.." WHERE cid = @cid", values)
    end)
end)

RegisterServerEvent("plutorp-clothingmenu:insert_character_face")
AddEventHandler("plutorp-clothingmenu:insert_character_face",function(data)
    if not data then return end
    local src = source

    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id

    if not characterId then return end

    checkExistenceFace(characterId, function(exists)
        if data.headBlend == "null" or data.headBlend == nil then
            data.headBlend = '[]'
        else
            data.headBlend = json.encode(data.headBlend)
        end
        local values = {
            ["cid"] = characterId,
            ["hairColor"] = json.encode(data.hairColor),
            ["headBlend"] = data.headBlend,
            ["headOverlay"] = json.encode(data.headOverlay),
            ["headStructure"] = json.encode(data.headStructure),
        }

        if not exists then
            local cols = "cid, hairColor, headBlend, headOverlay, headStructure"
            local vals = "@cid, @hairColor, @headBlend, @headOverlay, @headStructure"

            exports.ghmattimysql:execute("INSERT INTO character_face ("..cols..") VALUES ("..vals..")", values, function()
            end)
            return
        end

        local set = "hairColor = @hairColor,headBlend = @headBlend, headOverlay = @headOverlay,headStructure = @headStructure"
        exports.ghmattimysql:execute("UPDATE character_face SET "..set.." WHERE cid = @cid", values )
    end)
end)

RegisterServerEvent("plutorp-clothingmenu:get_character_face")
AddEventHandler("plutorp-clothingmenu:get_character_face",function(pSrc)
    local src = (not pSrc and source or pSrc)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id

    if not characterId then return end

    exports.ghmattimysql:execute("SELECT cc.model, cf.hairColor, cf.headBlend, cf.headOverlay, cf.headStructure FROM character_face cf INNER JOIN character_current cc on cc.cid = cf.cid WHERE cf.cid = @cid", {['cid'] = characterId}, function(result)
        if (result ~= nil and result[1] ~= nil) then
            local temp_data = {
                hairColor = json.decode(result[1].hairColor),
                headBlend = json.decode(result[1].headBlend),
                headOverlay = json.decode(result[1].headOverlay),
                headStructure = json.decode(result[1].headStructure),
            }
            local model = tonumber(result[1].model)
            if model == 1885233650 or model == -1667301416 then
                TriggerClientEvent("plutorp-clothingmenu:setpedfeatures", src, temp_data)
            end
        else
            TriggerClientEvent("plutorp-clothingmenu:setpedfeatures", src, false)
        end
	end)
end)

RegisterServerEvent("plutorp-clothingmenu:get_character_current")
AddEventHandler("plutorp-clothingmenu:get_character_current",function(pSrc)
    local src = (not pSrc and source or pSrc)
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = char.id
    if not cid then return end
    exports.ghmattimysql:execute("SELECT * FROM character_current WHERE cid = @cid", {['cid'] = cid}, function(result)
        local temp_data = {
            model = result[1].model,
            drawables = json.decode(result[1].drawables),
            props = json.decode(result[1].props),
            drawtextures = json.decode(result[1].drawtextures),
            proptextures = json.decode(result[1].proptextures),
        }
        TriggerClientEvent("plutorp-clothingmenu:setclothes", src, temp_data, 0)
	end)
end)

RegisterServerEvent("plutorp-clothingmenu:retrieve_tats")
AddEventHandler("plutorp-clothingmenu:retrieve_tats", function(pSrc)
    local src = (not pSrc and source or pSrc)
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute("SELECT * FROM playersTattoos WHERE identifier = @identifier", {['identifier'] = char.id}, function(result)
        if(#result == 1) then
			TriggerClientEvent("plutorp-clothingmenu:settattoos", src, json.decode(result[1].tattoos))
		else
			local tattooValue = "{}"
			exports.ghmattimysql:execute("INSERT INTO playersTattoos (identifier, tattoos) VALUES (@identifier, @tattoo)", {['identifier'] = char.id, ['tattoo'] = tattooValue})
			TriggerClientEvent("plutorp-clothingmenu:settattoos", src, {})
		end
	end)
end)

RegisterServerEvent("plutorp-clothingmenu:set_tats")
AddEventHandler("plutorp-clothingmenu:set_tats", function(tattoosList)
	local src = source
	local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute("UPDATE playersTattoos SET tattoos = @tattoos WHERE identifier = @identifier", {['tattoos'] = json.encode(tattoosList), ['identifier'] = char.id})
end)


RegisterServerEvent("plutorp-clothingmenu:get_outfit")
AddEventHandler("plutorp-clothingmenu:get_outfit",function(slot)
    if not slot then return end
    local src = source

    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id

    if not characterId then return end

    exports.ghmattimysql:execute("SELECT * FROM character_outfits WHERE cid = @cid and slot = @slot", {
        ['cid'] = characterId,
        ['slot'] = slot
    }, function(result)
        if result and result[1] then
            if result[1].model == nil then
                TriggerClientEvent("DoLongHudText", src, "Can not use.",2)
                return
            end

            local data = {
                model = result[1].model,
                drawables = json.decode(result[1].drawables),
                props = json.decode(result[1].props),
                drawtextures = json.decode(result[1].drawtextures),
                proptextures = json.decode(result[1].proptextures),
                hairColor = json.decode(result[1].hairColor)
            }

            TriggerClientEvent("plutorp-clothingmenu:setclothes", src, data , 0)

            local values = {
                ["cid"] = characterId,
                ["model"] = data.model,
                ["drawables"] = json.encode(data.drawables),
                ["props"] = json.encode(data.props),
                ["drawtextures"] = json.encode(data.drawtextures),
                ["proptextures"] = json.encode(data.proptextures),
            }

            local set = "model = @model, drawables = @drawables, props = @props,drawtextures = @drawtextures,proptextures = @proptextures"
            exports.ghmattimysql:execute("UPDATE character_current SET "..set.." WHERE cid = @cid",values)
        else
            TriggerClientEvent("DoLongHudText", src, "No outfit on slot " .. slot,2)
            return
        end
	end)
end)

RegisterServerEvent("plutorp-clothingmenu:set_outfit")
AddEventHandler("plutorp-clothingmenu:set_outfit",function(slot, name, data)
    if not slot then return end
    local src = source

    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id

    if not characterId then return end

    exports.ghmattimysql:execute("SELECT slot FROM character_outfits WHERE cid = @cid and slot = @slot", {
        ['cid'] = characterId,
        ['slot'] = slot
    }, function(result)
        if result and result[1] then
            local values = {
                ["cid"] = characterId,
                ["slot"] = slot,
                ["name"] = name,
                ["model"] = json.encode(data.model),
                ["drawables"] = json.encode(data.drawables),
                ["props"] = json.encode(data.props),
                ["drawtextures"] = json.encode(data.drawtextures),
                ["proptextures"] = json.encode(data.proptextures),
                ["hairColor"] = json.encode(data.hairColor),
            }

            local set = "model = @model,name = @name,drawables = @drawables,props = @props,drawtextures = @drawtextures,proptextures = @proptextures,hairColor = @hairColor"
            exports.ghmattimysql:execute("UPDATE character_outfits SET "..set.." WHERE cid = @cid and slot = @slot",values)
        else
            local cols = "cid, model, name, slot, drawables, props, drawtextures, proptextures, hairColor"
            local vals = "@cid, @model, @name, @slot, @drawables, @props, @drawtextures, @proptextures, @hairColor"

            local values = {
                ["cid"] = characterId,
                ["name"] = name,
                ["slot"] = slot,
                ["model"] = data.model,
                ["drawables"] = json.encode(data.drawables),
                ["props"] = json.encode(data.props),
                ["drawtextures"] = json.encode(data.drawtextures),
                ["proptextures"] = json.encode(data.proptextures),
                ["hairColor"] = json.encode(data.hairColor)
            }

            exports.ghmattimysql:execute("INSERT INTO character_outfits ("..cols..") VALUES ("..vals..")", values, function()
                TriggerClientEvent("DoLongHudText", src, name .. " stored in slot " .. slot,1)
            end)
        end
	end)
end)


RegisterServerEvent("plutorp-clothingmenu:remove_outfit")
AddEventHandler("plutorp-clothingmenu:remove_outfit",function(slot)

    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    local slot = slot

    if not cid then return end

    exports.ghmattimysql:execute( "DELETE FROM character_outfits WHERE cid = @cid AND slot = @slot", { ['cid'] = cid,  ["slot"] = slot } )
    TriggerClientEvent("DoLongHudText", src,"Removed slot " .. slot .. ".",1)
end)

RegisterServerEvent("plutorp-clothingmenu:list_outfits")
AddEventHandler("plutorp-clothingmenu:list_outfits",function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    local slot = slot
    local name = name
    if not cid then return end
    exports.ghmattimysql:execute("SELECT slot, name FROM character_outfits WHERE cid = @cid", {['cid'] = cid}, function(skincheck)  
        for i = 1, #skincheck do
            TriggerClientEvent('plutorp-context:sendMenu', src, {
                {
                    id = skincheck[i].slot,
                    header = "Outfit Name: " ..skincheck[i].name,
                    txt = "slot | "..skincheck[i].slot,
                    params = {
                        event = "plutorp-clothingmenu:list:outfits",
                        args = {
                            slot = skincheck[i].slot
                        }
                    }
                },
            })
        end
	end)
end)

RegisterServerEvent("plutorp-clothingmenu:attempt:change", function(pSlot, pNewName)
    local pSrc = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(pSrc)
    local cid = user:getCurrentCharacter().id

    exports.ghmattimysql:execute('UPDATE character_outfits SET name = @name WHERE cid = @cid AND slot = @slot', {
        ['@name'] = pNewName,
        ['@cid'] = cid,
        ['@slot'] = pSlot
    }, function()
    end)

    TriggerClientEvent("DoLongHudText", pSrc, "You have successfully re-named a outfit")
    Citizen.Wait(100)
    TriggerClientEvent("plutorp-clothingmenu:return", pSrc)

end)

RegisterServerEvent("plutorp-clothingmenu:options:oufits", function(pSlot)
    local src = source
    TriggerClientEvent('plutorp-context:sendMenu', src, {
		{
			id = 1,
			header = "🡸 Go Back",
			txt = "",
			params = {
				event = "plutorp-clothingmenu:return"
			}
		},
		{
			id = 2,
			header = "Use Outfit",
			txt = "Change your current clothes to this saved outfit",
			params = {
				event = "plutorp-clothingmenu:use:outfit",
				args = {
					slot = pSlot
				}
			}
			
		},
        {
			id = 3,
			header = "Delete Outfit",
			txt = "Delete the outfit from the wardrobe",
			params = {
				event = "plutorp-clothingmenu:remove:outfit",
				args = {
					slot = pSlot
				}
			}
			
		},
        {
			id = 4,
			header = "Rename Outfit",
			txt = "Change the name of the current outfit selected",
			params = {
				event = "plutorp-clothingmenu:attempt:change",
				args = {
					slot = pSlot
				}
			}
			
		},
	})
end)


RegisterServerEvent("clothing:checkIfNew")
AddEventHandler("clothing:checkIfNew", function()
    local src = source
    local user = exports["plutorp-core"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    local dateCreated = user:getCurrentCharacter()

    exports.ghmattimysql:execute("SELECT count(rank) whitelist FROM jobs_whitelist WHERE cid = @cid LIMIT 1", {
        ['cid'] = cid
    }, function(isWhitelisted)
        exports.ghmattimysql:scalar("SELECT count(model) FROM character_current WHERE cid = @cid LIMIT 1", {
            ['cid'] = cid
        }, function(result)
            local isService = false;
          
            if result == 0 then
                return
            else
                exports.ghmattimysql:execute("SELECT * FROM characters where id = @cid", {['@cid'] = cid}, function(data)
                    if data[1].jail_time >= 1 then
                        TriggerClientEvent("hotel:createRoom", src, false, false)
                    elseif data[1].jail_time <= 0 then
                        TriggerClientEvent("hotel:createRoom", src, true, true)
                    end
                end)
                TriggerEvent("plutorp-clothingmenu:get_character_current", src)
            end
            TriggerClientEvent("plutorp-clothingmenu:inService",src,isService)
    	end)
    end)
end)

RegisterServerEvent("clothing:checkMoney")
AddEventHandler("clothing:checkMoney", function(askingPrice)
    local src = source
    local target = exports["plutorp-core"]:getModule("Player"):GetUser(src)

    if not askingPrice then
        askingPrice = 0
    end

    if (tonumber(target:getCash()) >= askingPrice) then
        target:removeMoney(askingPrice)
        TriggerClientEvent("DoShortHudText", src, "You Paid $"..askingPrice, 8)
        TriggerClientEvent("clothing:close", src)
    else
        TriggerClientEvent("DoShortHudText", src, "You need $"..askingPrice, 2)
    end
end)
