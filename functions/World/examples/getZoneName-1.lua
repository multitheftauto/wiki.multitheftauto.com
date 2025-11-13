function outputPlayerZone(thePlayer)
    -- get the player position
    x, y, z = getElementPosition(thePlayer)
    -- get the player zone
    zone = getZoneName(x, y, z)
    -- get the player city (citiesonly as true)
    city = getZoneName(x, y, z, true)
    -- output to local player's chatbox
    outputChatBox("City: ".. city .." / Zone: ".. zone, thePlayer)
end
addCommandHandler("getloc", outputPlayerZone)