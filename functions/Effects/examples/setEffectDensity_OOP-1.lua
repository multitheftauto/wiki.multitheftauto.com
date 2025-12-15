addCommandHandler("sed", function(cmd)
    local x, y, z = localPlayer:getPosition()
    local effect = Effect("spraycan", x, y, z)
    effect.density = 2
end)
