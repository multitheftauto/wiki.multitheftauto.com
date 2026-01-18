-- Load IMG
local img = EngineIMG("file.img")

-- Enable streaming from this IMG
img:add()

-- Get model TXD id
local infernusModelID = 411
local infernusModelTxdID = Engine.getModelTXDID(infernusModelID)

-- Link DFF and TXD to IMG files
img:linkDFF("infernus.dff", infernusModelID)
img:linkTXD("infernus.txd", infernusModelTxdID)

-- Reload game models
engineRestreamWorld()
