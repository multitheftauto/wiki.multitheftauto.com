--[[ Example By MrKAREEM --]]

gui = guiCreateWindow(422, 177, 535, 365, "youtube", false)
guiWindowSetSizable(gui, false)
propertyState = guiCreateButton(10, 332, 515, 23, "getBrowserProperty", false, gui) -- Create button to get your browser property
webBrowser = guiCreateBrowser(9, 22, 516, 299, false, false, false, gui) -- Create a web browser, only works with local pages!

local theBrowser = guiGetBrowser(webBrowser) -- Get the web browser

-- Load our page on browser creation.
addEventHandler("onClientBrowserCreated", theBrowser, function()
showCursor(true)
loadBrowserURL(source, "http://m.youtube.com\\")
end
)


addEventHandler( "onClientGUIClick", resourceRoot, function ( )
if source == propertyState then
if isBrowserLoading(theBrowser) then return outputChatBox('Please wait until the browser load!',255,0,0) end -- To avoid mistakes
local getType = getBrowserProperty(theBrowser,'mobile') -- Getting the value of the browser property for the "mobile" key
if getType == '0' then -- This checks whether or not the browser appears as a mobile page
setBrowserProperty(theBrowser, "mobile", '1') -- Show the browser as a mobile page
reloadBrowserPage(theBrowser) -- Reload the browser page
guiSetText( gui, 'mobile_page' )
outputChatBox('You are viewing the browser as a mobile page')
elseif getType == '1' then
setBrowserProperty(theBrowser, "mobile", '0') -- Show the browser as a normal page
reloadBrowserPage(theBrowser) -- Reload the browser page
guiSetText( gui, 'web_page' )
outputChatBox('You are viewing the browser as a web page')
end
end
end )