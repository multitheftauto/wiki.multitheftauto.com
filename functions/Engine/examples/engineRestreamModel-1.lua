-- Load IMG
local img = engineLoadIMG("file.img")

-- Enable streaming from this IMG
engineAddImage(img)

-- Get model TXD id
local infernusModelID = 411
local infernusModelTxdID = engineGetModelTXDID(infernusModelID)

-- Link DFF and TXD to IMG files
engineImageLinkDFF(img, "infernus.dff", infernusModelID)
engineImageLinkTXD(img, "infernus.txd", infernusModelTxdID)

-- Reload infernus model
engineRestreamModel(infernusModelID)
