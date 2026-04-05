addEventHandler("onClientRender", root,
    function()
        local camX, camY, camZ, targetX, targetY, targetZ = getCameraMatrix()
        local dirX = targetX - camX
        local dirY = targetY - camY
        local dirZ = targetZ - camZ

        local endX = camX + dirX * 100
        local endY = camY + dirY * 100
        local endZ = camZ + dirZ * 100

        for _, vehicle in ipairs(getElementsByType("vehicle")) do
            local hit, _, _, textureName = processLineAgainstMesh(
                vehicle,
                camX, camY, camZ,
                endX, endY, endZ
            )

            if hit and textureName then
                print("Hit texture: " .. textureName)
                break
            end
        end
    end
)