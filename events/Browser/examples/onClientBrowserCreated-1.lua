addEventHandler("onClientBrowserCreated", resourceRoot,
function ()
    -- when the browser is loaded
    loadBrowserURL(source, "http://mtasa.com") -- load MTA:SA site
end)