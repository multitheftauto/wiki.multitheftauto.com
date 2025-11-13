window = guiCreateWindow(377, 156, 671, 454, "", false)
guiWindowSetSizable(window, true)

webBrowser = guiCreateBrowser(9, 26, 652, 418, false, false, false, window)

local theBrowser = guiGetBrowser(webBrowser)

addEventHandler("onClientBrowserCreated", theBrowser, function()
showCursor(true)
loadBrowserURL(source, "http://google.com\\")
for k,v in pairs(getBrowserSettings(theBrowser)) do
outputChatBox("['"..tostring(k).."'] = "..tostring(v))
end
end
)