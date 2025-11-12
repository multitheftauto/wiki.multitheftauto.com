function planeEnter ( theVehicle, seat, jacked ) -- when someone enters a vehicle
    local id = getElementModel ( theVehicle ) -- get the model ID of the vehicle
    if id == 519 or id == 577 then -- if theVehicle is either Shamal or AT-400
        local vehicleName = getVehicleName ( theVehicle ) -- get the name of theVehicle
        outputChatBox ( "Someone has stolen a " .. vehicleName .. "!" ) -- announce that someone has stolen the plane
    end
end
-- add the event handler to the event
addEventHandler ( "onPlayerVehicleEnter", root, planeEnter )