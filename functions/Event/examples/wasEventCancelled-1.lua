addEvent ( "onFlagPickup", true )

function flagHitcheck ( thePlayer )
    parentElement = getElementParent ( source ) -- get the parent of the marker
    if ( getElementType ( parentElement ) == "flag" ) then -- if it was a flag element then
        triggerEvent ( "onFlagPickup", source, thePlayer ) -- trigger our onFlagPickup event
        
        if ( not wasEventCancelled() ) then -- if handlers for 'onFlagPickup' didn't cancel it then
            setElementData ( thePlayer, "hasFlag", true ) -- set that the player picked up the flag
        end
    end
end
addEventHandler ( "onMarkerHit", getRootElement(), flagHitCheck )