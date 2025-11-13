function onPlayerEnterVehicle ( theVehicle, seat, jacked )
      if ( getElementDimension ( source ) == 0 ) then    -- if the player is in dimension 0
            setElementDimension ( source, 1 )            -- set his dimension to 1
            setElementDimension ( theVehicle, 1 )        -- set his vehicle's dimension to 1 as well
      end
end
addEventHandler ( "onPlayerVehicleEnter", root, onPlayerEnterVehicle )

function onPlayerExitVehicle ( theVehicle, seat, jacker )
      if ( getElementDimension ( source ) == 1 ) then    -- if the player is in dimension 1
            setElementDimension ( source, 0 )            -- set his dimension back to 0
            setElementDimension ( theVehicle, 0 )        -- set his vehicle's dimension back to 0 as well
      end
end
addEventHandler ( "onPlayerVehicleExit", root, onPlayerExitVehicle )