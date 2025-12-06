function isTargetPlayer()
    local target = Camera.target -- or Camera.getTarget()
    if (getElementType(target) == "player") then -- If target is a player
        return true -- Return true
    else
        return false -- Otherwise, return false.
    end
end
