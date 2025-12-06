function enableCameraThoughCars()
    setCameraClip(true, false)
    outputChatBox("Your camera can see the vehicle interior now!", 255, 0, 0, false)
end
addEventHandler("onClientResourceStart", resourceRoot, enableCameraThoughCars)
