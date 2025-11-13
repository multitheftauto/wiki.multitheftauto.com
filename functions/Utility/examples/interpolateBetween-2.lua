local g_Window = nil
addCommandHandler("window",
function ()
	if g_Window then return end
	
	g_Window = {}
	
	local screenWidth, screenHeight = guiGetScreenSize()
	g_Window.windowWidth, g_Window.windowHeight = 400, 315
	local left = screenWidth/2 - g_Window.windowWidth/2
	local top = screenHeight/2 - g_Window.windowHeight/2
	
	g_Window.window = guiCreateWindow(left, top, g_Window.windowWidth, g_Window.windowHeight, "Interpolation on GUI", false)
	
	g_Window.closeBtn = guiCreateButton(320, 285, 75, 23, "Close", false, g_Window.window)
		
	guiWindowSetSizable(g_Window.window, false)
	guiWindowSetMovable(g_Window.window, false)
	guiSetEnabled(g_Window.window, false)
	guiSetVisible(g_Window.window, false)
	
	g_Window.startTime = getTickCount()
	g_Window.startSize = {0, 0}
	g_Window.endSize = {g_Window.windowWidth, g_Window.windowHeight}
	g_Window.endTime = g_Window.startTime + 1000
	addEventHandler("onClientRender", getRootElement(), popWindowUp)
end)

function on_closeBtn_clicked(button, state, absoluteX, absoluteY)
	if (button ~= "left") or (state ~= "up") then
		return
	end
	
	if not g_Window then return end
	
	showCursor(false)
	guiSetEnabled(g_Window.window, false)
	guiWindowSetMovable(g_Window.window, false)
	
	local screenWidth, screenHeight = guiGetScreenSize()
	local posX, posY = guiGetPosition(g_Window.window, false)
	
	g_Window.startTime = getTickCount()
	g_Window.startSize = {g_Window.windowWidth, g_Window.windowHeight}
	g_Window.startCenter = 
	{
		posX + g_Window.windowWidth/2,
		posY + g_Window.windowHeight/2,
	}
	
	g_Window.endSize = {0, 0}
	g_Window.endTime = g_Window.startTime + 1000
	g_Window.endCenter = 
	{
		screenWidth, 
		screenHeight
	}
	
	addEventHandler("onClientRender", getRootElement(), popWindowDown)
end

function popWindowUp()
	local now = getTickCount()
	local elapsedTime = now - g_Window.startTime
	local duration = g_Window.endTime - g_Window.startTime
	local progress = elapsedTime / duration
		
	local width, height, _ = interpolateBetween ( 
		g_Window.startSize[1], g_Window.startSize[2], 0, 
		g_Window.endSize[1], g_Window.endSize[2], 0, 
		progress, "OutElastic")
		
	guiSetSize(g_Window.window, width, height, false)
	
	local screenWidth, screenHeight = guiGetScreenSize()
	guiSetPosition(g_Window.window, screenWidth/2 - width/2, screenHeight/2 - height/2, false)
	
	if not guiGetVisible(g_Window.window) then
		guiSetVisible(g_Window.window, true)
		guiBringToFront(g_Window.window)
	end
	
	if now >= g_Window.endTime then
		guiSetEnabled(g_Window.window, true)
		
		guiBringToFront(g_Window.window)
		removeEventHandler("onClientRender", getRootElement(), popWindowUp)
		addEventHandler("onClientGUIClick", g_Window.closeBtn, on_closeBtn_clicked, false)
		showCursor(true)
		guiWindowSetMovable(g_Window.window, true)
	end
end

function popWindowDown()
	local now = getTickCount()
	local elapsedTime = now - g_Window.startTime
	local duration = g_Window.endTime - g_Window.startTime
	local progress = elapsedTime / duration
	
	local width, height, _ = interpolateBetween ( 
		g_Window.startSize[1], g_Window.startSize[2], 0, 
		g_Window.endSize[1], g_Window.endSize[2], 0, 
		progress, "InQuad")
		
	guiSetSize(g_Window.window, width, height, false)
	
	local centerX, centerY, _ = interpolateBetween ( 
		g_Window.startCenter[1], g_Window.startCenter[2], 0, 
		g_Window.endCenter[1], g_Window.endCenter[2], 0, 
		progress, "InQuad")
	
	guiSetPosition(g_Window.window, centerX - width/2, centerY - height/2, false)
	
	if now >= g_Window.endTime then
		removeEventHandler("onClientRender", getRootElement(), popWindowDown)
		destroyElement(g_Window.window)
		g_Window = nil
	end
end