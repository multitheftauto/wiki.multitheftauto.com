local browserGUI = guiCreateBrowser(100, 100, 300, 50, true, true, false)
local browser    = guiGetBrowser(browserGUI)

addEventHandler("onClientBrowserCreated", browser, function()
  loadBrowserURL(browser, "http://mta/local/html/index.html")
end)