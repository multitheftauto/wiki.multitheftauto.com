function commandSetSunColor(player, command, r, g, b, r2, g2, b2)
    local r, g, b, r2, g2, b2 = tonumber(r), tonumber(g), tonumber(b), tonumber(r2), tonumber(g2), tonumber(b2)
    if (r and g and b and r2 and g2 and b2) then
        setSunColor(r, g, b, r2, g2, b2)
        outputChatBox("Color of sun now set", player, 0, 255, 0)
    else
        outputChatBox("Usage: /setsuncolor r g b r2 g2 b2 (eg: /setsuncolor 255 0 0 255 0 0)", player, 255, 0, 0)
    end
end
addCommandHandler("setsuncolor", commandSetSunColor)