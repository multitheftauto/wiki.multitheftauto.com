local newColShape = ColShape.Sphere(1, 2, 3, 4) -- create our new colshape
local players = newColShape.getElementsWithin("player") -- get all the players inside the sphere

for _, thePlayer in ipairs(players) do -- use a generic for loop to step through each player
    outputChatBox(thePlayer.name .. " is in our new sphere") -- print their name to the chat
end
