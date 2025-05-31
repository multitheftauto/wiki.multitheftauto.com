local browser = guiCreateBrowser(0, 0, 800, 600, false, false, false)
local theBrowser = guiGetBrowser(browser)
showCursor(true)


addEventHandler("onClientBrowserLoadingStart", theBrowser, function(url, isMainFrame)
  if (isMainFrame) then
    outputChatBox("Loading "..url.." in the main frame...")
  else
    outputChatBox("Loading "..url.." in a iframe...")
  end
end)

addEventHandler("onClientBrowserCreated", theBrowser, function()
  loadBrowserURL(source, "https://www.w3schools.com/html/html_iframe.asp")
end)