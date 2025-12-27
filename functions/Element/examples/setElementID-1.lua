local players = getElementsByType("player")

for i = 1, #players do
    setElementID(players[i], "player" .. i) -- Change element IDs to 'player1', 'players2', 'players3'...
    outputDebugString("Player[" .. i .. "] = " .. getElementID(players[i])) -- Output all the new element IDs
end

-- Could also be --

for i = 1, #players do
    setElementID(players[i], getPlayerName(players[i])) -- Change the element ID to the players name.
    outputDebugString("Player[" .. i .. "] = " .. getElementID(players[i]))
end
