function rotateLocalPlayerCamera()
    --setPedCameraRotation(localPlayer, getPedCameraRotation(localPlayer) + 45) -- This would work if getPedCameraRotation returned non-transformed angles
    setPedCameraRotation(localPlayer, -(getPedCameraRotation(localPlayer) + 45)) -- Tranform the angle returned and then add 45º to it
    outputChatBox("Your camera was rotated 45 degrees counter clockwise.", 0, 255, 0)
end
addCommandHandler("rotatecam", rotateLocalPlayerCamera)