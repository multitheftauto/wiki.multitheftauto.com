addCommandHandler("getangularvelocity", function(commandName)
    local aX, aY, aZ = getElementAngularVelocity(localPlayer)
    outputChatBox("Your current angular velocity is: X: " .. aX .. " Y: " .. aY .. " Z: " ..aZ)
end)
