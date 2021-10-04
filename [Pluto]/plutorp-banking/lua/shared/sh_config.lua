SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 7 -- How many days should the transaction history go back in the bank?

-- SimpleBanking.Config["business_ranks"] = { -- what ranks can see the society accounts in the menu, and deposit/withdraw/transfer from them?
--     ["owner"] = true,
--     ["coowner"] = true, -- Add additionals like I have here, don't forget the comma. Job rank must be lowercase!
-- 	["boss"] = true,
-- }

-- SimpleBanking.Config["business_ranks_overrides"] = {
--     ["police"] = { 
--         ["4"] = true,
--         ["5"] = true,
--     },
-- 	["police"] = { 
--         ["boss"] = true,
--         ["lieutenant"] = true,
--         ["sergeant"] = true,
--     },
-- 	["cardealer"] = { 
--         ["boss"] = true,
--     },
-- 	["ambulance"] = { 
--         ["boss"] = true,
--         ["chief_doctor"] = true,
--     },
-- 	["taxi"] = { 
--         ["boss"] = true,
-- 		["uber"] = true,
--     },
-- }
