-- define our handler function
function onPlayerSpawnHandler()
    -- get the player's name, source is the player because he was spawned
    local playerName = getPlayerName(source)
    -- output in the chat box that they've spawned
    outputChatBox(playerName .. " has spawned!")
end
addEventHandler("onPlayerSpawn", root, onPlayerSpawnHandler) -- root is a predefined global variable for getRootElement()
