addCommandHandler("getangularvelocity", function(commandName)
    local angularVelocity = localPlayer.angularVelocity
    outputChatBox("Your current angular velocity is: X: " .. angularVelocity.x .. " Y: " .. angularVelocity.y .. " Z: " ..angularVelocity.z)
end)
