addCommandHandler("mobile", function()
    for i, browser in pairs(Element.getAllByType("webbrowser")) do
        browser:setProperty("mobile", browser:getProperty("mobile") == "1" and "0" or "1")
    end
end)
