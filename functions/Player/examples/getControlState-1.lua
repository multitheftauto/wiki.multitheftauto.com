function onPlayerSpawn ( theSpawnpoint )
    killPlayerIfTheyPressThisKey ( source, "fire" ) -- start a repeating check
end
addEventHandler ( "onPlayerSpawn", root, onPlayerSpawn )

function killPlayerIfTheyPressThisKey ( thePlayer, key )
    if ( getControlState ( thePlayer, key ) ) then        -- if they're pressing the fire key
        outputChatBox ( "Violence will not be tolerated!", thePlayer )
        killPed ( thePlayer )                          -- kill them
    else                                                  -- otherwise..
        setTimer ( killPlayerIfTheyPressThisKey, 500, 1, thePlayer, key ) -- call this function again in 500ms
    end
end