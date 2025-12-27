local playersTable = getElementsWithinRange(0, 0, 3, 20, "player") -- get all player elements within 20 units of 0, 0, 3

for _, playerElement in pairs(playersTable) do -- use a generic for loop to step through each player
    local playerName = getPlayerName(playerElement) -- get player name

    outputChatBox(playerName .. " is within range") -- print their name to the chat
end
