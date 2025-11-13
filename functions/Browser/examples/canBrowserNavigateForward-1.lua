window = guiCreateWindow(126, 122, 848, 674, "browser", false)
guiWindowSetSizable(window, false)
navigateBackBtn = guiCreateButton(10, 19, 39, 36, "<", false, window)
navigateForwardBtn = guiCreateButton(98, 19, 39, 36, ">", false, window)
reloadBtn = guiCreateButton(49, 19, 49, 36, "reload", false, window)
addressBar =  guiCreateEdit(137, 19, 701, 36, "", false, window)
guiSetEnabled(addressBar,false)
webBrowser = guiCreateBrowser(10, 55, 828, 609, false, false, false, window)
local theBrowser = guiGetBrowser(webBrowser) 

-- Load our page on browser creation.
addEventHandler("onClientBrowserCreated", theBrowser, 
    function()
	showCursor(true)
        loadBrowserURL(source, "https://forum.mtasa.com/")
    end
)


addEventHandler( "onClientBrowserDocumentReady", theBrowser, function( url )
guiSetText( addressBar, getBrowserURL( theBrowser ) )
end )

-- This part handles the GUI navigation buttons for the browser.
addEventHandler( "onClientGUIClick", resourceRoot, function ( )
    if source == navigateBackBtn then
	if canBrowserNavigateBack(theBrowser) ~= true then return end -- This checks to see if the browser can navigate to the back
        navigateBrowserBack(theBrowser)
    elseif source == navigateForwardBtn then -- This checks to see if the browser can navigate to the forward
	if canBrowserNavigateForward(theBrowser) ~= true then return end
        navigateBrowserForward(theBrowser)
    elseif source == reloadBtn then
        reloadBrowserPage(theBrowser)
    end
end )