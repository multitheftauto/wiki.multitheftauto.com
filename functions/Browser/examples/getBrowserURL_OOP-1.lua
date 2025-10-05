-- In order to render the browser on a corner, we need to get the dimensions of the screen
local screenWidth, screenHeight = GuiElement.getScreenSize( )

-- Let's create a new browser in remote mode
local window = GuiWindow( screenWidth/2, 0, screenWidth/2, screenHeight/2, "Web Browser", false )
local browser = GuiBrowser( 0, 28, screenWidth/2, screenHeight/2, false, false, false, window )
local theBrowser = browser.browser -- Get the browser element from gui-browser

-- Let's create a new command to check if youtube is loaded and load it if isnt
addCommandHandler ( "isyoutubeloaded",
    function ()
		if theBrowser.url == "" then  -- If the browser didnt load anything yet, load youtube
			outputChatBox("Youtube isn't loaded yet, loading it now....")
			theBrowser.url = "https://www.youtube.com/"
		else -- If the browser loaded something
			outputChatBox("Youtube is loaded.")
		end
    end
)