local window = GuiWindow(126, 122, 848, 674, "Firechrome", false)
window.sizable = false

local navigateBackBtn = GuiButton(10, 19, 39, 36, "<", false, window)
local navigateForwardBtn = GuiButton(98, 19, 39, 36, ">", false, window)
local addressBar = GuiEdit(137, 19, 701, 36, "", false, window)
addressBar.enabled = false

local reloadBtn = GuiButton(49, 19, 49, 36, "reload", false, window)
local browser = GuiBrowser(10, 55, 828, 609, false, false, false, window)

-- Load our page on browser creation.
local theBrowser = browser.browser
addEventHandler("onClientBrowserCreated", theBrowser, function()
    source.url = "https://forum.mtasa.com/"
end)

-- This checks to see if the browser can navigate in any direction and enables the back or forward buttons
addEventHandler("onClientBrowserDocumentReady", theBrowser, function()
    navigateForwardBtn.enabled = theBrowser:canNavigateForward()
    navigateBackBtn.enabled = theBrowser:canNavigateBack()
    addressBar.text = theBrowser.url
end)

-- This part handles the GUI navigation buttons for the browser.
addEventHandler("onClientGUIClick", resourceRoot, function()
    if source == navigateBackBtn then
        theBrowser:navigateBack()
    elseif source == navigateForwardBtn then
        theBrowser:navigateForward()
    elseif source == reloadBtn then
        theBrowser:reloadPage()
    end
end)
