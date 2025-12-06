addEventHandler("onClientClick", root, function(button, state)
    if state == "down" then
        injectBrowserMouseDown(browser, button)
    else
        injectBrowserMouseUp(browser, button)
    end
end)
