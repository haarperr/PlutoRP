Config = {}

-- priority list can be any identifier. (hex steamid, steamid34, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    --Management / Developers
    ["steam:1100001121a445e"] = 99, --NSG
    ["steam:11000013e78c9d2"] = 99, --NOS
    --High Staff
    --Low Staff
    --Tier 3 (70)
    --Tier 2 (60)S
    --Tier 1 (50)
}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 50 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 120

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = true

-- how much priority power grace time will give
Config.GracePower = 85

-- how long grace time lasts in seconds
Config.GraceTime = 30

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 75000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Joining Pluto RP...",
    connecting = "\xE2\x8F\xB3Connecting to Pluto RP...",
    idrr = "\xE2\x9D\x97[PRPQueue] Error: Couldn't retrieve any of your id's, try restarting.",
    err = "\xE2\x9D\x97[PRPQueue] There was an error",
    pos = "\xF0\x9F\x90\x8CYou are %d/%d in queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[PRPQueue] Error: Error adding you to connecting list",
    timedout = "\xE2\x9D\x97[PRPQueue] Error: Timed out?",
    wlonly = "\xE2\x9D\x97[PRPQueue] You must be whitelisted to join this server. To apply, head to : https://discord.gg/ew7B6HjshC",
    steam = "\xE2\x9D\x97 [PRPQueue] Error: Steam must be running"
}