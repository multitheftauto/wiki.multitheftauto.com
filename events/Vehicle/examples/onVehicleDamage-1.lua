function displayVehicleLoss(loss)
    local thePlayer = getVehicleOccupant(source)
    if(thePlayer) then -- Check there is a player in the vehicle
        outputChatBox("Your vehicle just lost " .. tonumber(loss) .. " health.", thePlayer) -- Display the message
    end
end

addEventHandler("onVehicleDamage", root, displayVehicleLoss)