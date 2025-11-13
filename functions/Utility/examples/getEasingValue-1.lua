local g_Fade = nil
addCommandHandler("fade", 
function ()
	if g_Fade then return end
	g_Fade = {}
	g_Fade.startTime = getTickCount()
	g_Fade.endTime = g_Fade.startTime + 2000
	g_Fade.easingFunction = "InQuad" --Slow at first and accelerating
	addEventHandler("onClientRender", getRootElement(), fadeCameraOut)
end)

function fadeCameraOut()
	local now = getTickCount()
	local elapsedTime = now - g_Fade.startTime
	local duration = g_Fade.endTime - g_Fade.startTime
	local progress = elapsedTime / duration
	
	local fAnimationTime = getEasingValue(progress, g_Fade.easingFunction)
	
	local alpha = fAnimationTime*255
	local width, height = guiGetScreenSize()
	dxDrawRectangle(0, 0, width, height, tocolor(0, 0, 0, alpha), true)
	
	if now > g_Fade.endTime then
		removeEventHandler("onClientRender", getRootElement(), fadeCameraOut)
		g_Fade.startTime = getTickCount()
		g_Fade.endTime = g_Fade.startTime + 2000
		g_Fade.easingFunction = "OutQuad" --Fast at first then decelerating
		addEventHandler("onClientRender", getRootElement(), fadeCameraIn)
	end
end

function fadeCameraIn()
	local now = getTickCount()
	local elapsedTime = now - g_Fade.startTime
	local duration = g_Fade.endTime - g_Fade.startTime
	local progress = elapsedTime / duration
	
	local fAnimationTime = getEasingValue(progress, g_Fade.easingFunction)
	
	local alpha = (1-fAnimationTime)*255
	local width, height = guiGetScreenSize()
	dxDrawRectangle(0, 0, width, height, tocolor(0, 0, 0, alpha), true)
		
	if now > g_Fade.endTime then
		removeEventHandler("onClientRender", getRootElement(), fadeCameraIn)
		g_Fade = nil
	end
end