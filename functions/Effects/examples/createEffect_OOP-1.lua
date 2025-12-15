local effect

addCommandHandler('effect', function(cmd, name)
    local x,y,z = getElementPosition(localPlayer)

    if (effect) then
        effect:destroy()
    end

    effect = Effect(name, x, y, z, 0, 0, 0)
end)