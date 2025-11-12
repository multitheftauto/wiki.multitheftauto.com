local parentImage = guiCreateStaticImage(0, 0, 64, 64, "img1.png", false)
local childImage = guiCreateStaticImage(0, 0, 16, 16, "img2.png", false, parentImage)

-- Disable call propagation
setElementCallPropagationEnabled(parentImage, false)

-- Load another image
guiStaticImageLoadImage(parentImage, "img3.png")
--[[
    Normally (enabled call propagation) both parentImage and childImage would contain "img3.png" now. 
    Due to disabled call propagation only parentImage will contain "img3.png" now (the call was not propagated down the tree)
]]