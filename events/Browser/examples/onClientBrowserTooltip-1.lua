local browser = guiCreateBrowser(0, 0, 800, 600, false, false, false)
local theBrowser = guiGetBrowser(browser)
showCursor(true)


addEventHandler( "onClientBrowserCreated", theBrowser, function()
  loadBrowserURL(source, "https://www.google.com/?ncr&hl=en")
end)

addEventHandler("onClientBrowserTooltip", root, function(text)
  if (text ~= "") then
    outputChatBox("Tooltip-Text: "..text)
  else
    outputChatBox("You are not longer hovering a tooltip")
  end
end)