function checkTheObjects(cmd)
    local amount = 0 -- When starting the command, we don't have any objects looped.
    for k, v in ipairs(getElementsByType("object")) do -- Looping all the objects in the server
        if isElementStreamedIn(v) then -- If the object is streamed in
            amount = amount + 1 -- It's an object more streamed in
        end
    end
    outputChatBox("You have currently " .. amount .. " objects streamed in.") -- Send the player the amount of objects that are streamed in
end
addCommandHandler("checkobjects", checkTheObjects)
