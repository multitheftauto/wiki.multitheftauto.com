local function changeCameraFovOnClientResourceStart()
    setCameraFieldOfView("player", 20)
end
addEventHandler("onClientResourceStart", resourceRoot, changeCameraFovOnClientResourceStart)