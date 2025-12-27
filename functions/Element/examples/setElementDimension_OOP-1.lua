addCommandHandler('setdim', function(plr, cmd, dim)
    if (not tonumber(dim)) then
        plr:outputChat('Usage: /' .. cmd .. ' [dimension]', 255, 0, 0)
        return
    end

    plr.dimension = tonumber(dim)
    plr:outputChat('Your dimension has been set to ' .. dim .. '.', 0, 255, 0)
end)