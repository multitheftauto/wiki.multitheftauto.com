-- add a command handler for 'amiattached' to call the function 'consoleIsPlayerAttached':
function consoleIsPlayerAttached(thePlayer, command)
    if (thePlayer) then -- if a player triggered this command
        local status = thePlayer.attached -- call the function and store it's result in the 'status' variable
        if (status) then -- if the function returned true, tell the player he is attached to something
            outputConsole("You are attached to an element!", thePlayer)
        else -- if the function returned false, tell the player he is not attached to anything
            outputConsole("You are not attached to an element.", thePlayer)
        end
    end
end
addCommandHandler("amiattached", consoleIsPlayerAttached)
