local webbrowser = createBrowser(1000, 1000, false, false)
loadBrowserUrl(webbrowser, "https://www.youtube.com/watch?v=jofNR_WkoCE")
addCommandHandler("checkload",
      function()
            if isBrowserLoading(webbrowser) then  
                  outputChatBox("Please  wait, The site is loading!") 
            else
                  outputChatBox("This site was already loaded")
            end
      end
)