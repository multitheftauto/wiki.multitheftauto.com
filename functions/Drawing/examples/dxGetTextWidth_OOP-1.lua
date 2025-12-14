local font = DxFont("myFont.ttf")

local text = "Hello World - Hello MTA!"
local width = font:getTextWidth(text, 1, false)
outputChatBox("Width: "..tostring(width))