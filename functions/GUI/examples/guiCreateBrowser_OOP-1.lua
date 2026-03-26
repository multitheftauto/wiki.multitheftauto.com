local browserGUI = GuiBrowser(100, 100, 300, 50, true, true, false)
local browser = browserGUI.browser

addEventHandler("onClientBrowserCreated", browser, function()
    browser.url = "http://mta/local/html/index.html"
end)
