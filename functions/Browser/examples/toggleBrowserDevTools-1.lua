local GUI_browser = guiCreateBrowser(100,100,640,480,false,false,false) -- Create Browser
local browser = guiGetBrowser(GUI_browser) -- Get browser from GUI element

setDevelopmentMode(true, true) -- Enable client dev mode

addEventHandler("onClientBrowserCreated", browser, function()
    toggleBrowserDevTools(browser, true) -- Toggle the CEF dev console
end)