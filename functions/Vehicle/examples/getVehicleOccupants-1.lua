function outputOccupants()
    -- Make sure they're in a vehicle
    if (not isPedInVehicle(localPlayer)) then
        outputConsole("You're not in a vehicle.")
        return false
    end
    outputConsole("------------------------------------") -- Print a separator for easier reading
    for seat, occupant in pairs(getVehicleOccupants(getPedOccupiedVehicle(localPlayer))) do -- Loop through the array
        outputConsole("Seat " .. seat .. ": " .. getPlayerName(occupant)) -- Print who's in the seat 
    end
    outputConsole("------------------------------------") -- Print another separator
end
addCommandHandler("occupants", outputOccupants, false, false) -- Add a command "/occupants" which triggers outputOccupants