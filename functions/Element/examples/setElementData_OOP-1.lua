addCommandHandler('setmaxpassengers', function(plr, cmd, maxPassengers)
    if (not tonumber(maxPassengers)) then
        plr:outputChat('Usage: /' .. cmd .. ' [maxPassengers]', 255, 0, 0)
        return
    end

    local veh = plr.vehicle
    if (not veh) then
        plr:outputChat('You are not in a vehicle.', 255, 0, 0)
        return
    end

    if (tonumber(maxPassengers) < 0) then
        plr:outputChat('Max passengers cannot be negative.', 255, 0, 0)
        return
    end

    if (tonumber(maxPassengers) > veh.maxPassengers) then
        plr:outputChat('Max passengers cannot exceed the vehicle\'s maximum of ' .. veh.maxPassengers .. '.', 255, 0, 0)
        return
    end

    veh:setData('maxPassengers', tonumber(maxPassengers), false) -- Keep data server-side only, no need to sync to clients
    plr:outputChat('Max passengers for this vehicle set to ' .. maxPassengers .. '.', 0, 255, 0)
end)

addEventHandler('onVehicleStartEnter', root, function(plr, seat)
    if (seat == 0) then return end -- Driver seat, ignore

    local maxPassengers = source:getData('maxPassengers')
    if (maxPassengers) then
        local occupants = source.occupants
        local passengersCount = #occupants - 1 -- Exclude driver

        if (passengersCount >= maxPassengers) then
            plr:outputChat('This vehicle has reached its maximum number of passengers (' .. maxPassengers .. ').', 255, 0, 0)
            cancelEvent()
        end
    end
end)