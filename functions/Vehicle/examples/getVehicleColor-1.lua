function playerEnterVehicle ( theVehicle, seat, jacked )
    -- Get the colors of the car and store them to 4 seperate variables
    local color1, color2, color3, color4 = getVehicleColor ( theVehicle )
    -- Output the four retrieved car colors into the chatbox
    outputChatBox ( "Car color 1: " .. color1 )
    outputChatBox ( "Car color 2: " .. color2 )
    outputChatBox ( "Car color 3: " .. color3 )
    outputChatBox ( "Car color 4: " .. color4 )
end
addEventHandler ( "onPlayerVehicleEnter", root, playerEnterVehicle )