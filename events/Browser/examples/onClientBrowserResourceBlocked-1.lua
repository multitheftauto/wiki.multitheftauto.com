local browser = guiCreateBrowser(0, 0, 800, 600, false, false, false)
local theBrowser = guiGetBrowser(browser)
showCursor(true)

addEventHandler("onClientBrowserCreated", theBrowser, function()
  loadBrowserURL(source, "https://www.multitheftauto.com/")
end)

local lastBrowser = nil
addEventHandler("onClientBrowserResourceBlocked", theBrowser, function(url, domain, reason)
  if (reason == 0) then
    
    lastBrowser = source
    requestBrowserDomains({domain}, false, function(accepted, newDomains)
      if (accepted == true) then
        reloadBrowserPage(lastBrowser)
      end
      lastBrowser = nil
    end)
  
  end
end)