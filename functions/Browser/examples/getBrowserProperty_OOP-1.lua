local gui = GuiWindow(422, 177, 535, 365, "youtube", false)
gui.sizable = false

local propertyState = GuiButton(10, 332, 515, 23, "getBrowserProperty", false, gui) -- Create button to get your browser property
local webBrowser = GuiBrowser(9, 22, 516, 299, false, false, false, gui) -- Create a web browser, only works with local pages!

local theBrowser = webBrowser.browser -- Get the web browser

-- Load our page on browser creation.
addEventHandler("onClientBrowserCreated", theBrowser, function()
    showCursor(true)
    source.url = "http://m.youtube.com\\"
end)

addEventHandler("onClientGUIClick", resourceRoot, function()
    if source == propertyState then
        if theBrowser.loading then
            return outputChatBox('Please wait until the browser load!', 255, 0, 0)
        end -- To avoid mistakes
        local getType = theBrowser:getProperty('mobile') -- Getting the value of the browser property for the "mobile" key
        if getType == '0' then -- This checks whether or not the browser appears as a mobile page
            theBrowser:setProperty("mobile", '1') -- Show the browser as a mobile page
            theBrowser:reloadPage() -- Reload the browser page
            gui.text = 'mobile_page'
            outputChatBox('You are viewing the browser as a mobile page')
        elseif getType == '1' then
            theBrowser:setProperty("mobile", '0') -- Show the browser as a normal page
            theBrowser:reloadPage() -- Reload the browser page
            gui.text = 'web_page'
            outputChatBox('You are viewing the browser as a web page')
        end
    end
end)
