local function changeCameraFovOnClientResourceStart()
    Camera.setFieldOfView("player", 20)
end
addEventHandler("onClientResourceStart", resourceRoot, changeCameraFovOnClientResourceStart)