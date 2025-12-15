addCommandHandler("sshot", function()
    local x, y, z = localPlayer:getPosition()
    Effect.addGunshot(x, y+0.5, z+0.5, 0, 0, 0, true)
end)