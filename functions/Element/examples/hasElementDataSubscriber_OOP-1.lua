addEventHandler("onVehicleEnter", root, function(thePlayer, seat)
    if seat == 0 then -- if the player is a driver
        if (source:hasDataSubscriber('id', thePlayer)) then
            thePlayer:outputChat('This is your car.')
        end
    end
end)
