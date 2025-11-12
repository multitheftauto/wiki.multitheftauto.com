function SwatRope()
    local myVehicle = getPedOccupiedVehicle(localPlayer)
    if myVehicle and getVehicleName(myVehicle) == "Police Maverick" then
        local x,y,z = getElementPosition(myVehicle)
        createSWATRope(x, y, z, 11111)  
    end
end
addCommandHandler("createrope", SwatRope)