local browser = Browser(1024,1024,false,false)      --Create Browser

addEventHandler("onClientBrowserCreated",browser,function()
    browser.url = "http://www.youtube.com"    --Load URL
end)

addEventHandler("onClientBrowserDocumentReady",browser,function(url)
    local rnt = browser:getSource(function(code)     --Get Browser Source and Call Function
        outputChatBox(code)                             --Output Code
    end)
    
    if rnt then
        outputChatBox("Browser Source Got",0,255,0)
    else
        outputChatBox("Failed To Get Browser Source",255,0,0)
    end
end)