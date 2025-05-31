function makeSettingsChangesVisible(setting, oldValue, newValue)
    local whatItWas = fromJSON(oldValue)
    local whatItsNow = fromJSON(newValue)
    outputDebugString("The setting "..setting.." was "..whatItWas.." and has been changed to "..whatItsNow..".") -- Making the setting change visible in debug (use /debugscript [number] to see it)
end
addEventHandler("onSettingChange", root, makeSettingsChangesVisible)