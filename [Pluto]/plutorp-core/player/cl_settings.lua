MRP.SettingsData = MRP.SettingsData or {}
MRP.Settings = MRP.Settings or {}

MRP.Settings.Current = {}
-- Current bind name and keys
MRP.Settings.Default = {
  ["tokovoip"] = {
    ["stereoAudio"] = true,
    ["localClickOn"] = true,
    ["localClickOff"] = true,
    ["remoteClickOn"] = true,
    ["remoteClickOff"] = true,
    ["clickVolume"] = 0.8,
    ["radioVolume"] = 0.8,
    ["phoneVolume"] = 0.8,
    ["releaseDelay"] = 200
  },
  ["hud"] = {

  }

}


function MRP.SettingsData.setSettingsTable(settingsTable, shouldSend)
  if settingsTable == nil then
    MRP.Settings.Current = MRP.Settings.Default
    TriggerServerEvent('plutorp-core:sv:player_settings_set',MRP.Settings.Current)
    MRP.SettingsData.checkForMissing()
  else
    if shouldSend then
      MRP.Settings.Current = settingsTable
      TriggerServerEvent('plutorp-core:sv:player_settings_set',MRP.Settings.Current)
      MRP.SettingsData.checkForMissing()
    else
       MRP.Settings.Current = settingsTable
       MRP.SettingsData.checkForMissing()
    end
  end

  TriggerEvent("event:settings:update",MRP.Settings.Current)

end

function MRP.SettingsData.setSettingsTableGlobal(self, settingsTable)
  MRP.SettingsData.setSettingsTable(settingsTable,true);
end

function MRP.SettingsData.getSettingsTable()
    return MRP.Settings.Current
end

function MRP.SettingsData.setVarible(self,tablename,atrr,val)
  MRP.Settings.Current[tablename][atrr] = val
  TriggerServerEvent('plutorp-core:sv:player_settings_set',MRP.Settings.Current)
end

function MRP.SettingsData.getVarible(self,tablename,atrr)
  return MRP.Settings.Current[tablename][atrr]
end

function MRP.SettingsData.checkForMissing()
  local isMissing = false

  for j,h in pairs(MRP.Settings.Default) do
    if MRP.Settings.Current[j] == nil then
      isMissing = true
      MRP.Settings.Current[j] = h
    else
      for k,v in pairs(h) do
        if  MRP.Settings.Current[j][k] == nil then
           MRP.Settings.Current[j][k] = v
           isMissing = true
        end
      end
    end
  end
  

  if isMissing then
    TriggerServerEvent('plutorp-core:sv:player_settings_set',MRP.Settings.Current)
  end


end

RegisterNetEvent("plutorp-core:cl:player_settings")
AddEventHandler("plutorp-core:cl:player_settings", function(settingsTable)
  MRP.SettingsData.setSettingsTable(settingsTable,false)
end)


RegisterNetEvent("plutorp-core:cl:player_reset")
AddEventHandler("plutorp-core:cl:player_reset", function(tableName)
  if MRP.Settings.Default[tableName] then
      if MRP.Settings.Current[tableName] then
        MRP.Settings.Current[tableName] = MRP.Settings.Default[tableName]
        MRP.SettingsData.setSettingsTable(MRP.Settings.Current,true)
      end
  end
end)