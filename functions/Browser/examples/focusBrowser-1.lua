local browser = createBrowser(860, 680, false)
addEventHandler("onClientBrowserCreated", browser,
   function ()
       focusBrowser(source)
   end
)