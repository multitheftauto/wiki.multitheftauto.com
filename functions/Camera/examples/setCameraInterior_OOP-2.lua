function setCamInt(thePlayer, commandName, intID)
    if (intID) then -- If there is an ID
        local seted = thePlayer:setCameraInterior(intID) -- set the interior to the camera
        if (seted) then -- If it has been changed correctly
            thePlayer:outputChat("Your camera's interior has been set to " .. intID) -- Tell to the player his new camera's interior
        else -- otherwise
            thePlayer:outputChat("Can't change your camera's interior...", 255, 0, 0) -- Tell him the change failed
        end
    else -- otherwise 
        thePlayer:outputChat("Syntax: /caminterior [interiorID] ", 255, 0, 0) -- Tell him the correct syntax
    end
end
addCommandHandler("caminterior", setCamInt)