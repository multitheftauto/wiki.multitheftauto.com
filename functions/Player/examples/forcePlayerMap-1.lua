-- Get the player named "dave"
dave = getPlayerFromName ( "dave" )
-- Make sure we found him
if ( dave ) then
    if not isPlayerMapForced ( dave ) then                  -- if his map isn't already forced on
        forcePlayerMap ( dave, true )                       -- force it on
        setTimer ( forcePlayerMap, 10000, 1, dave, false )  -- stop forcing in 10 seconds
    end
end