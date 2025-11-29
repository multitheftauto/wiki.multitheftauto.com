function setCam(command, int)
    if (int) then
        local setInt = Camera.setInterior(int)
        if (setInt) then
            outputChatBox("Your camera's interior has been set to " .. int, 255, 255, 0)
        else
            outputChatBox("Can't change your camera's interior...", 255, 0, 0)
        end
    else
        outputChatBox("Syntax: /camera [interiorID] ", 255, 0, 0)
    end
end
addCommandHandler("camera", setCam)