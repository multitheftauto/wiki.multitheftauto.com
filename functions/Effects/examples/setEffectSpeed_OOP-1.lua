addCommandHandler("ses", function(cmd)
    local x, y, z = localPlayer:getPosition()
    local effect = Effect("smoke30lit", x, y, z)
    effect.speed = 5
end)
