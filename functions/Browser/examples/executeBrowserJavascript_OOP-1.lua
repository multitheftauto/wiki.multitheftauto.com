local browser = GuiBrowser(200, 200, 400, 200, true, false, false).browser

addEventHandler("onClientBrowserCreated", browser, function()
    source.url = "http://mta/local/example.html" -- Containing <span id="nick"></span> somewhere in the file
end)

-- The page has to load first
addEventHandler("onClientBrowserDocumentReady", browser, function()
    source:executeJavascript(string.format("document.getElementById('nick').innerText = %q;", localPlayer.name))
end)
