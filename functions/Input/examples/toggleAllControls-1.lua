function freezeThisDude ( thePlayer, freezeTime )
    toggleAllControls ( thePlayer, false )                         -- disable this player's controls
    setTimer ( toggleAllControls, freezeTime, 1, thePlayer, true ) -- enable this player's controls after the specified time
end

function freezeOnEnterVehicle ( theVehicle, seat, jacked )
    freezeThisDude ( source, 5000 ) -- 'freeze' him for 5000ms = 5 seconds
end
addEventHandler ( "onPlayerVehicleEnter", root, freezeOnEnterVehicle )