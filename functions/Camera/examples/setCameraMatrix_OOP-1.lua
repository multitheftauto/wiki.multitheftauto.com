function setCameraOnPlayerJoin()
     -- slowly fade the camera in to make the screen visible
     source:fadeCamera(true, 5)
     -- set the player's camera to a fixed position, looking at a fixed point
     source:setCameraMatrix(1468.8785400391, -919.25317382813, 100.153465271, 1468.388671875, -918.42474365234, 99.881813049316)
end
addEventHandler("onPlayerJoin", root, setCameraOnPlayerJoin)