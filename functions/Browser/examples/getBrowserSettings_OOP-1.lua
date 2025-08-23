local window = GuiWindow(377, 156, 671, 454, "", false)
window.sizable = true

local webBrowser = GuiBrowser(9, 26, 652, 418, false, false, false, window)

local theBrowser = webBrowser.browser

addEventHandler("onClientBrowserCreated", theBrowser, function()
    showCursor(true)
    source.url = "http://google.com\\"
    for k,v in pairs(Browser.getSettings()) do
        outputChatBox("['"..tostring(k).."'] = "..tostring(v))
    end
end
)