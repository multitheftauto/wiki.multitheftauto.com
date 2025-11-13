function changeMyPickupType ( key, keyState )
    local currenttype = getPickupType ( myPickup )  -- get the current type of the pickup and store it in 'currenttype'
    if currenttype == 0 then                      -- if it is currently a health pickup
        setPickupType ( myPickup, 1, 100 )          -- change it to an armour pickup with 100 hp
    elseif currenttype == 1 then                  -- else, if it is currently an armour pickup
        setPickupType ( myPickup, 2, 29, 100 )      -- change it to an mp5 weapon pickup with 100 ammo
    elseif currenttype == 2 then                  -- lastly, if it is already a weapon
        setPickupType ( myPickup, 0, 100 )          -- change it to a health pickup
    end
end

function clientsideResourceStart ()
	myPickup = createPickup ( 10.0, 10.0, 3.11, 0, 100 ) -- create myPickup at resource start
	bindKey ( "space", "down", changeMyPickupType ) --bind spacebar to changeMyPickupType function
end
addEventHandler ( "onClientResourceStart", resourceRoot, clientsideResourceStart )