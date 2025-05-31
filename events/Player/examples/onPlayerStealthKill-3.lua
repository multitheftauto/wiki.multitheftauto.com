local function preventStealthAnimation(thePlayer)
    setPedAnimation(thePlayer, "ped", "0", -1, true, true, true, true, 350)
end

function onPlayerStealthKill(targetPlayer)
    setTimer(preventStealthAnimation, 50, 1, source)
end
addEventHandler("onPlayerStealthKill", root, onPlayerStealthKill)