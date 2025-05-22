local players = getElementsByType("player")
local newPlayerPosition = Vector3(-#players - 1, 0, 10) -- Initialize the position vector for the first player in the list
for _, player in ipairs(players) do
    -- Move each player 1 unit forward in X from the previous one
    newPlayerPosition.x = newPlayerPosition.x + 1
    setElementPosition(player, newPlayerPosition)
end