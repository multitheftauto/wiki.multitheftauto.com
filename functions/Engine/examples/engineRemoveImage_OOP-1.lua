local img = EngineIMG('file.img') -- load IMG file
img:add() -- add it to GTA world

Timer(engineRemoveImage, 600*1000, 1, img)