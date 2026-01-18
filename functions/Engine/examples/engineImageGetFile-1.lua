local img = engineLoadIMG("file.img")
local data = engineImageGetFile(img, 'test.dff')
local dff = engineLoadDFF(data)
engineReplaceModel(dff, 400)
