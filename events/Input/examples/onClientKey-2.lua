addEventHandler( "onClientKey", root, function(button,press) 
    -- Since mouse_wheel_up and mouse_wheel_down cant return a release, we dont have to check the press.
    if button == "mouse_wheel_up" or button == "mouse_wheel_down" then
        outputDebugString( button .. " moved." )
        return true
    end
    return false
end )