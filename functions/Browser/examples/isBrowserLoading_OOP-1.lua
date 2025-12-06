local webbrowser = Browser(1000, 1000, false, false)
webbrowser.url = "https://www.youtube.com/watch?v=jofNR_WkoCE"
addCommandHandler("checkload", function()
    if webbrowser.loading then
        outputChatBox("Please  wait, The site is loading!")
    else
        outputChatBox("This site was already loaded")
    end
end)
