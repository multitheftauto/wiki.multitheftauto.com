function getAttached(thePlayer)
    local attached = thePlayer.attachedTo -- or thePlayer:getAttachedTo()
    if (attached) then
        outputConsole(thePlayer.name.. " is attached to a " ..attached.type)
    else
        outputConsole(thePlayer.name.." is not attached to an element")
    end
end
addCommandHandler("getattached", getAttached)
