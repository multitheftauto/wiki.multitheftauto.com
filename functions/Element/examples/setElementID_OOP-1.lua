local players = Element.getAllByType("player")

for i = 1, #players do
    players[i].id = "player"..i -- Change element IDs to 'player1', 'players2', 'players3'...
    outputDebugString("Player[" .. i .. "] = " ..players[i].id) -- Output all the new element IDs
end