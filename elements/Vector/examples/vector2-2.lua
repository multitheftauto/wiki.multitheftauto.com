local screenW, screenH = guiGetScreenSize()
local centerVec = Vector2(screenW / 2, screenH / 2)
local mouseVec = Vector2()
local lineLength = 200
local lineColor = tocolor(255, 0, 0)
showCursor(true)
addEventHandler('onClientRender', root, function()
local curX, curY = getCursorPosition()
mouseVec.x, mouseVec.y = curX * screenW, curY * screenH
local dVec = Vector2(mouseVec - centerVec)
local scaleFactor = lineLength / dVec.length
mouseVec = centerVec + (dVec * scaleFactor)
dxDrawLine(centerVec.x, centerVec.y, mouseVec.x, mouseVec.y, lineColor)
end)