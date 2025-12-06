-- In order to render the browser on the full screen, we need to know the dimensions.
local screenWidth, screenHeight = guiGetScreenSize()

-- Let's create a new browser in local mode. We will not be able to load an external URL.
local webBrowser = createBrowser(screenWidth, screenHeight, false, false)

-- This is the function to render the browser.
function webBrowserRender()
    -- Render the browser on the full size of the screen.
    dxDrawImage(0, 0, screenWidth, screenHeight, webBrowser, 0, 0, 0, tocolor(255, 255, 255, 255), true)
end

-- The event onClientBrowserCreated will be triggered, after the browser has been initialized.
-- After this event has been triggered, we will be able to load our URL and start drawing.
addEventHandler("onClientBrowserCreated", webBrowser, function()
    -- After the browser has been initialized, we can load our website.
    loadBrowserURL(webBrowser, "https://www.youtube.com/")

    -- Now we can start to render the browser.
    addEventHandler("onClientRender", root, webBrowserRender)
end)
