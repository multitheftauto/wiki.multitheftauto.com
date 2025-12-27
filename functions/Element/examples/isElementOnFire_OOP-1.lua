addCommandHandler('amonfire', function(plr)
    if plr.onFire then
        plr:outputChat('You are on fire!', 255, 50, 0)
    else
        plr:outputChat('You are not on fire.', 0, 255, 0)
    end
end)