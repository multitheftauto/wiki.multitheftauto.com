addCommandHandler( "getrotation", 
    function ()
        local rot = 360 - getPedCameraRotation(localPlayer) -- Also fix the camera rotation
        outputChatBox("Your camera rotation is " .. rot .. "º", 0, 225, 0)
    end
)