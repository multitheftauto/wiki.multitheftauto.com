addCommandHandler("ses", function(cmd)
    local density = 4
    local x, y, z = localPlayer:getPosition()
    local effect = Effect("cement", x, y, z)
    effect.density = density
    
    local currentDensity = effect.density -- or effect:getDensity()
    outputChatBox("Density: "..tostring(currentDensity))
end)
