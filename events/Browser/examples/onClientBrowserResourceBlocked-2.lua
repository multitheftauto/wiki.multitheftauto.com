function resourceBlocked(url,domain,reason)
    if reason == 0 then
        requestBrowserDomains({domain})
    end
end
addEventHandler("onClientBrowserResourceBlocked",browserElement,resourceBlocked)