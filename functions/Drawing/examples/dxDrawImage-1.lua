local screenWidth, screenHeight = guiGetScreenSize()  -- Get screen resolution.
local arrowTexture = dxCreateTexture('arrow.png')

function renderDisplay ( )
	local seconds = getTickCount() / 1000
	local angle = math.sin(seconds) * 80
	-- This will draw the graphic file 'arrow.png' at the top middle of the screen
	-- using the size of 100 pixels wide, and 240 pixels high.
	-- The center of rotation is at the top of the image.
	dxDrawImage ( screenWidth/2 - 50, 0, 100, 240, arrowTexture, angle, 0, -120 )
end
addEventHandler("onClientRender", root, renderDisplay)  -- Keep everything visible with onClientRender.