local screenWidth, screenHeight = GuiElement.getScreenSize()

local message = "Incredibly huuuuuuuge message"
local messageOffset = 32
local messagePadding = 16
local messageWidth = 256

local font = DxFont("myFont.ttf")

function renderMessage()
    local textWidth, textHeight = font:getSize(message, messageWidth, 2, true)
    local x = screenWidth - textWidth - messageOffset
    local y = screenHeight - textHeight - messageOffset
    dxDrawRectangle(x - messagePadding, y - messagePadding, textWidth + messagePadding * 2, textHeight + messagePadding * 2, 0x80000000) -- draw background
    dxDrawText(message, x, y, x + textWidth, y + textHeight, 0xFFFFFFFF, 2, "default", "left", "top", false, true)
end
addEventHandler("onClientRender", root, renderMessage)