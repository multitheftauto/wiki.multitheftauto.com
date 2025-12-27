addCommandHandler("setinterior", function(plr, cmd, interior)
    if (tonumber(interior)) then
        plr.interior = tonumber(interior)
    end
end)