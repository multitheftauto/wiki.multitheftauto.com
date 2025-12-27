-- Create two vehicles
local vehicle1 = Vehicle(411, 0, 0, 3)
local vehicle2 = Vehicle(415, 5, 0, 3)

-- Toggle collision between the two vehicles
addCommandHandler("toggleCollision", function()
    local currentState = vehicle1:isCollidableWith(vehicle2)
    vehicle1:setCollidableWith(vehicle2, not currentState)
    outputChatBox("Collision state toggled.")
end)