Citizen.CreateThread(function()
  
    RegisterCommand('+generalUse', function() end, false)
    RegisterCommand('-generalUse', function() end, false)
    exports["plutorp-keymapping"]:registerKeyMapping("general", "Player", "General Use", "+generalUse", "-generalUse", "E", true)

    RegisterCommand('+housingMain', function() end, false)
    RegisterCommand('-housingMain', function() end, false)
    exports["plutorp-keymapping"]:registerKeyMapping("housingMain", "Housing", "Housing Main", "+housingMain", "-housingMain", "H", true)


    RegisterCommand('+housingSecondary', function() end, false)
    RegisterCommand('-housingSecondary', function() end, false)
    exports["plutorp-keymapping"]:registerKeyMapping("housingSecondary", "Housing", "Housing Secondary", "+housingSecondary", "-housingSecondary", "G", true)

    RegisterCommand('+generalUseThird', function() end, false)
    RegisterCommand('-generalUseThird', function() end, false)
    exports["plutorp-keymapping"]:registerKeyMapping("generalUseThird", "Player", "General Use Third", "+generalUseThird", "-generalUseThird", "G", true)
    
    RegisterCommand('+ShowRecentDispatch', function() end, false)
    RegisterCommand('-ShowRecentDispatch', function() end, false)
    exports["plutorp-keymapping"]:registerKeyMapping("ShowRecentDispatch", "Police/EMS", "Show Recent Dispatch", "+ShowRecentDispatch", "-ShowRecentDispatch", "Z", true)
    
end)

