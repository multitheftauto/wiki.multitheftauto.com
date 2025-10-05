local screenWidth, screenHeight = GuiElement.getScreenSize()
local initBrowser = GuiBrowser(0, 0, screenWidth, screenHeight, true, true, false)
addCommandHandler("resize",
	function ( cmd, width, height )
		local browser = initBrowser.browser
		local width, height = tonumber(width), tonumber(height)
		browser:resize( width, height )
	end
)