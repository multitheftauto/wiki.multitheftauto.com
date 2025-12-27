function joinTime()
    setElementData(source, "joinTime", getTickCount()) -- Store the current tick count in the player's data with the key 'joinTime'
end
-- Make our 'joinTime' function be called when a player joins
addEventHandler("onPlayerJoin", root, joinTime)

function showJoinTime(source, commandName, playerName)
    if (playerName) then -- see if a player was specified
        local thePlayer = getPlayerFromName(playerName) -- get the player element for the specified player
        if (thePlayer) then -- if one was found...
            local timeOnline = (getTickCount() - getElementData(thePlayer, "joinTime")) / 1000 -- calculates the time since join
            outputChatBox(getPlayerName(thePlayer) .. " joined " .. timeOnline .. " seconds ago", source) -- output the player's join time
        else
            outputChatBox("Couldn't find '" .. playerName .. "'", source) -- display an error
        end
    else
        -- display when the player who used the function joined and inform how to see other people's join time
        local timeOnline = (getTickCount() - getElementData(source, "joinTime")) / 1000 -- calculate the time since join
        outputChatBox("You joined " .. timeOnline .. " seconds ago", source)
        outputChatBox("Use 'join_time <player name>' to see other people's join time", source)
    end
end
-- Add a console command joinTime, that takes an optional parameter of a player's name
addCommandHandler("joinTime", showJoinTime)
