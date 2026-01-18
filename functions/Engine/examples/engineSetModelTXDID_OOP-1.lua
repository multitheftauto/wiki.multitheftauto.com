-- Load IMG archive
local img = EngineIMG('worldmod.img')

-- Enable streaming from this IMG
img:add()

-- Allocate a new TXD
local newTxdId = engineRequestTXD("WESTERNHOUSES01")

-- Link IMG files to TXD
img:linkTXD("western.txd", newTxdId)

-- Assign TXD to game models
Engine.setModelTXDID(17697, newTxdId)
Engine.setModelTXDID(17925, newTxdId)
Engine.setModelTXDID(3646, newTxdId)