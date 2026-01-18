local img = EngineIMG("file.img")
local data = img:getFile('test.dff')
local dff = EngineDFF(data)
dff:replace(400)