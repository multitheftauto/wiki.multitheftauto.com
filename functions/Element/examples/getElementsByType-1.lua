local players = getElementsByType("player") -- get a table of all the players in the server
for theKey, thePlayer in ipairs(players) do -- use a generic for loop to step through each player
    if (isPlayerInVehicle(thePlayer)) then -- if the player is in a vehicle, announce it
        outputChatBox(getPlayerName(thePlayer) .. " is in a vehicle")
    else -- if the player isn't in a vehicle, announce that he/she is on foot
        outputChatBox(getPlayerName(thePlayer) .. " is on foot")
    end
end
