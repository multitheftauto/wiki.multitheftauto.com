function getAttached ( thePlayer )
    local attached = getElementAttachedTo ( thePlayer )
    if ( attached ) then
        outputConsole ( getPlayerName(thePlayer) .. " is attached to a " .. getElementType(attached) )
    else
        outputConsole ( getPlayerName(thePlayer) .. " is not attached to an element" )
    end
end
addCommandHandler ( "getattached", getAttached )