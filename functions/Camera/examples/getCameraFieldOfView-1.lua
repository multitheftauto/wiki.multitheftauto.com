function getCamFOV()
    outputChatBox("The camera field of view for 'player walking/running' is: " .. getCameraFieldOfView("player"))
end
addCommandHandler("getfov", getCamFOV)