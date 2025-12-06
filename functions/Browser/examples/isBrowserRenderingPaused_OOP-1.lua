-- In order to render the browser on the full screen, we need to know the dimensions.
local screenWidth, screenHeight = GuiElement.getScreenSize()

-- Let's create a new browser in remote mode.
local window = GuiWindow(0, 0, screenWidth, screenHeight, "Webbrowser", false)
local browser = GuiBrowser(0, 0, 800, 600, false, false, false, window)

-- The event onClientBrowserCreated will be triggered, after the browser has been initialized.
-- After this event has been triggered, we will be able to load our URL
local theBrowser = browser.browser -- Get the browser element from gui-browser
addEventHandler("onClientBrowserCreated", theBrowser, function()
    -- After the browser has been initialized, we can load www.youtube.com
    source.url = "http://www.youtube.com"
end)

addCommandHandler("pause", -- Add a command named 'pause'
function(player, commandName)
    if theBrowser.renderingPaused then
        theBrowser.renderingPaused = false
    else
        theBrowser.renderingPaused = true
    end
end)
