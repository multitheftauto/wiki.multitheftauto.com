function processPlayerTriggerEventThreshold()
    kickPlayer(source, "Event spam")
end
addEventHandler("onPlayerTriggerEventThreshold", root, processPlayerTriggerEventThreshold)