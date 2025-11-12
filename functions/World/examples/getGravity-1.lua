function getGravityLevel( playerSource )
    local gravity = getGravity ( )
    outputConsole ( "The gravity is currently set to " .. gravity, playerSource )
end
-- attach the 'getGravityLevel' function to the "gravity" command
addCommandHandler ( "gravity", getGravityLevel )