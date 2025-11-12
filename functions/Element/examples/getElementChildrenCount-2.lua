local teamRed = getElementByID("red") -- find the parent element by its ID
local count = getElementChildrenCount (teamRed) -- get the total number of children
outputChatBox("Team red has " .. count .. " spawnpoints") -- output: Team red has 4 spawnpoints