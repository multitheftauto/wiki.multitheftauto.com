function setCamInt(thePlayer, commandName, intID)
    if (intID) then -- If there is an ID
        local seted = setCameraInterior(thePlayer, intID) -- set the interior to the camera
        if (seted) then -- If it has been changed correctly
            outputChatBox("Your camera's interior has been set to " .. intID, thePlayer) -- Tell to the player his new camera's interior
        else -- otherwise
            outputChatBox("Can't change your camera's interior...", thePlayer, 255, 0, 0) -- Tell him the change failed
        end
    else -- otherwise 
        outputChatBox("Syntax: /caminterior [interiorID] ", thePlayer, 255, 0, 0) -- Tell him the correct syntax
    end
end
addCommandHandler("caminterior", setCamInt)
