function onPickupHit ( )                          -- when a pickup is hit
    local currenttype = getPickupType ( source )  -- get the current type of the pickup and store it in 'currenttype'
    if currenttype == 0 then                      -- if it is currently a health pickup
        setPickupType ( source, 1, 100 )          -- change it to an armour pickup with 100 hp
    elseif currenttype == 1 then                  -- else, if it is currently an armour pickup
        setPickupType ( source, 2, 29, 100 )      -- change it to an mp5 weapon pickup with 100 ammo
    elseif currenttype == 2 then                  -- lastly, if it is already a weapon
        setPickupType ( source, 0, 100 )           -- change it to a health pickup
    end
end
addEventHandler ( "onPickupHit", root, onPickupHit ) -- add an event handler for onPickupHit