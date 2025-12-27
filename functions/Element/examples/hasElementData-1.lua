function favoriteAnimal(source, commandName, playerName)
    local thePlayer = source
    if playerName then -- see if a player was specified
        thePlayer = getPlayerFromName(playerName) -- get the player element for the specified player
        if not thePlayer then -- if we still couldn't find a player with the specified name...
            outputChatBox("Couldn't find '" .. playerName .. "'", source) -- display an error
            return
        end
    end

    if hasElementData(thePlayer, "favoriteAnimal") then -- check if the player has a favorite animal set
        local favoriteAnimal = getElementData(thePlayer, "favoriteAnimal") -- get the player's favorite animal
        outputChatBox(getPlayerName(thePlayer) .. "'s favorite animal is: " .. favoriteAnimal, source) -- output the player's favorite animal
    else
        outputChatBox(getPlayerName(thePlayer) .. " does not have a favorite animal!", source) -- output the player's lack of a favorite animal
    end
end
-- Add a console command joinTime, that takes an optional parameter of a player's name
addCommandHandler("favoriteAnimal", favoriteAnimal)
