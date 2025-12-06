local browser = Browser(860, 680, false)
addEventHandler("onClientBrowserCreated", browser, function()
    source:focus()
end)
