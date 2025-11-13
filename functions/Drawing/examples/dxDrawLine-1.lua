local screenWidth, screenHeight = guiGetScreenSize() 
local lineColor = tocolor(255, 0, 0)
function drawLinesAcrossScreen()
	dxDrawLine(0, 0, screenWidth, screenHeight, lineColor)
	dxDrawLine(screenWidth, 0, 0, screenHeight, lineColor)
end
addEventHandler("onClientRender", root, drawLinesAcrossScreen)