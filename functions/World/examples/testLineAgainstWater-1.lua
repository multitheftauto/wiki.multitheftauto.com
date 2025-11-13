function checkForWater()
    if isPedOnGround(localPlayer) then
        local px, py, pz = getElementPosition(localPlayer)
        if testLineAgainstWater(px, py, pz, px, py, pz - 500) then
            outputChatBox("Yes, there is water below you.")
        else
            outputChatBox("This place looks a bit dry.")
        end
    end
end
addCommandHandler("isanywaterbelowme", checkForWater)