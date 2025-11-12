local firstColor = tocolor(0, 0, 0, 150)
local secondColor = tocolor(255, 255, 255, 255)
local screenX, screenY = guiGetScreenSize()
local currentCount = 0
local systemUpTime = getTickCount() -- Store the system tick count, this will be 0 for us

function onClientRenderClock()
	currentCount = getTickCount()
	
	dxDrawRectangle(screenX *.40, screenY * .09, 250, 50, firstColor)
	dxDrawText(currentCount - systemUpTime, screenX * .48, screenY * .1, screenX, screenY, secondColor, 2)
end
addEventHandler("onClientRender", root, onClientRenderClock)