local targetPosition = Vector3(-2627.32, -1083.2, 433.35) -- Somewhere in Mount Chilliad

local function moveCameraToTarget(deltaTime)
    local currentPosition = Vector3(getCameraMatrix())
    local direction = targetPosition - currentPosition
    direction:normalize() -- Get a direction vector by normalizing the vector from the current position to the target position
    setCameraMatrix(currentPosition + direction * deltaTime * 0.05, -2589.45, -1174.49, 418.09)
end
addEventHandler("onClientPreRender", root, moveCameraToTarget)