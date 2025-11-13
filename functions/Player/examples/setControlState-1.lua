function onPlayerEnterVehicle ( theVehicle, seat, jacked )
    toggleControl ( source, "accelerate", false ) -- disable the accelerate key
    toggleControl ( source, "brake_reverse", false ) -- disable the brake_reverse key
    toggleControl ( source, "handbrake", false ) -- disable the handbrake key
    setControlState ( source, "accelerate", true ) -- force the accelerate key on
end
addEventHandler ( "onPlayerVehicleEnter", root, onPlayerEnterVehicle )