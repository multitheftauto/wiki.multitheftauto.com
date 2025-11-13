local function checkMap ( thePlayer )
    local mapName = getMapName() -- get the maps name
	if (mapName and mapName ~= "None") then -- if map name was set and it isn't "None" (default map name)
        outputChatBox("You're playing map called \"" .. mapName .. "\"", thePlayer) -- print out the map name
    else -- there was no name so tell that to player
        outputChatBox("You're playing an unnamed map.", thePlayer) -- print out the message
    end
end
addCommandHandler("checkmap", checkMap)