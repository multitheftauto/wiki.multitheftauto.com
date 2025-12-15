addCommandHandler("ses", function(cmd)
    local density = 4
    local x, y, z = getElementPosition(localPlayer)
    local effect = createEffect("cement", x, y, z)
    setEffectDensity(effect, density)
    getEffectDensity(effect)
end)
