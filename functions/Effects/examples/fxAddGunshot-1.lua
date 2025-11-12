addCommandHandler("sshot", function()
    local x, y, z = getElementPosition(localPlayer)
    fxAddGunshot(x, y+0.5, z+0.5, 0, 0, 0, true)
end)