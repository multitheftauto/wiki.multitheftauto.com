function commandSetSunSize(player, command, size)
    local size = tonumber(size)
    if (not size) then return end -- They didn't use a number
    setSunSize(size)
end
addCommandHandler("setsunsize", commandSetSunSize)