local GUI_browser = GuiBrowser(100,100,640,480,false,false,false) -- Create Browser
local browser = GUI_browser.browser -- Get browser from GUI element

setDevelopmentMode(true, true) -- Enable client dev mode

addEventHandler("onClientBrowserCreated", browser, function()
    browser.devTools = true -- Toggle the CEF dev console
end)