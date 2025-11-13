function getDummyPosition (commandName, dummy)
    if not dummy then
        return false
    end
    local veh = getPedOccupiedVehicle (localPlayer)

    if not veh then
        outputChatBox ("You should be in a vehicle to use this command", 255, 25, 25)
        return false
    end

    local x, y, z = getVehicleDummyPosition (veh, dummy)
    outputChatBox ("X: "..x..", Y: "..y..", Z: "..z, 0, 255, 0)
end

addCommandHandler ("getdummy", getDummyPosition)