addEventHandler("onClientPedsProcessed", root, function()
    -- Left
    setElementBoneRotation(localPlayer, 32, 26.574, 61.3375, 59.2065)
    setElementBoneRotation(localPlayer, 33, 27.844, 15.364, 46.406)
    setElementBoneRotation(localPlayer, 34, -81.0185, 342.875, 326.118)
    -- Right
    setElementBoneRotation(localPlayer, 22, 338.839, 53.4935, 298.452)
    setElementBoneRotation(localPlayer, 23, 307.687, 22.11, 313.594)
    setElementBoneRotation(localPlayer, 24, 96.0475, 357.883, 56.739)

    updateElementRpHAnim(localPlayer)
end)