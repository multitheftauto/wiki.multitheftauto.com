-- Load IMG archive
local img = engineLoadIMG('worldmod.img')

-- Enable streaming from this IMG
engineAddImage(img)

-- Allocate a new TXD
local newTxdId = engineRequestTXD("WESTERNHOUSES01")

-- Link IMG files to TXD
engineImageLinkTXD(img, "western.txd", newTxdId)

-- Assign TXD to game models
engineSetModelTXDID(17697, newTxdId)
engineSetModelTXDID(17925, newTxdId)
engineSetModelTXDID(3646, newTxdId)