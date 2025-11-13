function grav ( sourcePlayer, command, level )
    local level = tonumber(level)
    if (not level) then return end
    setGravity ( tonumber(level) )
end
addCommandHandler ( "setgravity", grav )