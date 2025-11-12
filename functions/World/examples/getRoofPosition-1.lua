setTimer (
    function ()
        local playerX, playerY, playerZ = getElementPosition (localPlayer)
        local roofZ = getRoofPosition (playerX, playerY, playerZ)
        setCameraShakeLevel ((roofZ) and 0 or 255 )
    end, 100, 0
)