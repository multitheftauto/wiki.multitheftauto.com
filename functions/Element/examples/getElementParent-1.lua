function spawnpointUse(thePlayer) -- this function gets called whenever a spawnpoint is used
    local theSpawnGroup = getElementParent(source) -- get the spawnpoint's parent element
    -- announce the parent's ID and the player who spawned there:
    outputChatBox(getPlayerName(thePlayer) .. " spawned at team " .. getElementID(theSpawnGroup) .. "'s spawnpoint.")
    -- Example output: "Joe spawned at team blue's spawnpoint."
end
addEventHandler("onSpawnpointUse", root, spawnpointUse)
