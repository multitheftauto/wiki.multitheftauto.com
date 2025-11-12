-- In order to render the browser fullscreen, we need to get the dimensions of the screen
local screenWidth, screenHeight = guiGetScreenSize( )

-- Let's create a new browser in remote mode
local window = guiCreateWindow( 0, 0, screenWidth, screenHeight, "Web Browser", false )
local browser = guiCreateBrowser( 0, 28, screenWidth, screenHeight, false, false, false, window )
local theBrowser = guiGetBrowser( browser ) -- Get the browser element from gui-browser

-- The event onClientBrowserCreated will be triggered after the browser has been initialized
-- After this event has been triggered we will be able to load our URL
addEventHandler( "onClientBrowserCreated", theBrowser, 
	function( )
		-- After the browser has been initialized, we can load www.youtube.com
		loadBrowserURL( source, "https://www.youtube.com/" )
	end
)