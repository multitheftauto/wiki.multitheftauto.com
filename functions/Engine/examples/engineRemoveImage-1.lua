local img = engineLoadIMG('file.img') -- load IMG file to mta
engineAddImage(img) -- add it to GTA world

setTimer(engineRemoveImage, 600*1000, 1, img)