local window = guiCreateWindow(126, 122, 848, 674, "Firechrome", false)
guiWindowSetSizable(window, false)

local navigateBackBtn = guiCreateButton(10, 19, 39, 36, "<", false, window)
local navigateForwardBtn = guiCreateButton(98, 19, 39, 36, ">", false, window)
local addressBar = guiCreateEdit(137, 19, 701, 36, "", false, window)
guiSetEnabled(addressBar, false)
local reloadBtn = guiCreateButton(49, 19, 49, 36, "reload", false, window)
local browser = guiCreateBrowser(10, 55, 828, 609, false, false, false, window)

-- Load our page on browser creation.
local theBrowser = guiGetBrowser(browser)
addEventHandler("onClientBrowserCreated", theBrowser, function()
    loadBrowserURL(source, "https://forum.mtasa.com/")
end)

-- This checks to see if the browser can navigate in any direction and enables the back or forward buttons
addEventHandler("onClientBrowserDocumentReady", theBrowser, function()
    guiSetEnabled(navigateForwardBtn, canBrowserNavigateForward(theBrowser))
    guiSetEnabled(navigateBackBtn, canBrowserNavigateBack(theBrowser))
    guiSetText(addressBar, getBrowserURL(theBrowser))
end)

-- This part handles the GUI navigation buttons for the browser.
addEventHandler("onClientGUIClick", resourceRoot, function()
    if source == navigateBackBtn then
        navigateBrowserBack(theBrowser)
    elseif source == navigateForwardBtn then
        navigateBrowserForward(theBrowser)
    elseif source == reloadBtn then
        reloadBrowserPage(theBrowser)
    end
end)
