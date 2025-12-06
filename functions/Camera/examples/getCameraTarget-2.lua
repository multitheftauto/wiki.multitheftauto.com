function isTargetPlayer()
    local target = getCameraTarget()
    if (getElementType(target) == "player") then -- If target is a player
        return true -- Return true
    else
        return false -- Otherwise, return false.
    end
end
