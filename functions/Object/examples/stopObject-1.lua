function objectMoveControl ( thePlayer, commandName, state )
    -- On "toggleobjectmove" in console, activate this command, which also asks the player to define the value for the varible 'state'. 
    if state == "on" then
        outputChatBox ( "Moving object randomly" )
        mytimer = setTimer ( randomObjectMovement, 2250, 0 )
        -- if the player types "on" for the state variable, turn on the timer, which triggers a function
        -- called randomObjectMovement that moves the object whenever it is called (not included for
        -- this example). The timer runs every 2 1/4 seconds for 0 times, which means it runs infinitely.
    elseif state == "off" then
        outputChatBox ( "Stopping object movement" )
        killTimer ( mytimer )
        stopObject ( myobject )
        -- if the player typed "off" for state, stop the object movement immediately and kill the
        -- randomObjectMovement timer
    else
        outputChatBox ( "must define object state as 'on' or 'off'" )
        -- if the player typed something besides "on" or "off" for state, do nothing
    end
end
addCommandHandler ( "toggleobjectmove", objectMoveControl )