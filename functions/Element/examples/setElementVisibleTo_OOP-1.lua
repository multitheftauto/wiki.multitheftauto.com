-- Find the player called someguy
local someguy = Player("someguy")
-- If the player was found then
if (someguy) then
    -- Get the player's position into the variables x, y and z
    local x, y, z = someguy:getPosition()
    -- Create a marker at the player's position
    local myMarker = Marker(x, y, z)

    -- Then make the marker invisible to the whole dimension (root for the first)
    myMarker:setVisibleTo(root, false)
    -- Set marker visibility to true for someguy
    myMarker:setVisibleTo(someguy, true)

    -- The order in which you do the visibility changes does not matter, but ideally trues should be set before falses in order to prevent a momentary flicker.
end
