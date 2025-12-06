local browser = guiGetBrowser(guiCreateBrowser(200, 200, 400, 200, true, false, false))

addEventHandler("onClientBrowserCreated", browser, function()
    loadBrowserURL(source, "http://mta/local/example.html") -- Containing <span id="nick"></span> somewhere in the file
end)

-- The page has to load first
addEventHandler("onClientBrowserDocumentReady", browser, function()
    executeBrowserJavascript(source, string.format("document.getElementById('nick').innerText = %q;", getPlayerName(localPlayer)))
end)
