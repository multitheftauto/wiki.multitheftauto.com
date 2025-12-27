local newColShape = ColShape.Sphere(1, 2, 3, 4) -- create our new colshape
local elems = newColShape.elementsWithin -- get all elements within colshape

for _, elem in ipairs(elems) do -- use a generic for loop to step through each element
    if (elem.type == 'player') then -- check if this is a player
        outputChatBox(thePlayer.name .. " is in our new sphere") -- print their name to the chat
    end
end
