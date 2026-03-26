-- Let's create a new browser in remote mode.
local window = GuiWindow(200, 200, 1024, 768, "Webbrowser", false)
local browser = GuiBrowser(0, 0, 800, 600, false, false, window)

-- The event onClientBrowserCreated will be triggered, after the browser has been initialized.
-- After this event has been triggered, we will be able to load our URL
local theBrowser = browser.browser -- Get the browser element from gui-browser
addEventHandler("onClientBrowserCreated", theBrowser, function()
    -- After the browser has been initialized, we can load www.youtube.com
    source.url = "http://www.youtube.com"
end)
