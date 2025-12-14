local myTexture = DxTexture("man.png")
local width, height = myTexture:getSize()
outputChatBox("man.png is " .. tostring(width) .. " pixels wide and " .. tostring(height) .. " pixels high")
