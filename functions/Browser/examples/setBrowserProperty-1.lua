addCommandHandler("mobile",
    function ()
        for i, browser in pairs(getElementsByType("webbrowser")) do
            setBrowserProperty(browser, "mobile", getBrowserProperty(browser, "mobile") == "1" and "0" or "1")
        end
    end)