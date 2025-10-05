local screenWidth, screenHeight = guiGetScreenSize()
local initBrowser = guiCreateBrowser(0, 0, screenWidth, screenHeight, true, true, false)
addCommandHandler("resize",
	function ( cmd, width, height )
		local browser = guiGetBrowser(initBrowser)
		local width, height = tonumber(width), tonumber(height)
		resizeBrowser( browser, width, height )
	end
)