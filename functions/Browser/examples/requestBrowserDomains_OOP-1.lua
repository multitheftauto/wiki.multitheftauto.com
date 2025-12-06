Browser.requestDomains({"mtasa.com"}) -- request browser domain
showCursor(true) -- show cursor
addEventHandler("onClientBrowserWhitelistChange", root, function(_, newDomains)
    if newDomains[1] == "mtasa.com" then
        local browser = Browser(1280, 720, false, false) -- create browser
        browser.url = "http://mtasa.com/" -- load browser url
    end
end)
