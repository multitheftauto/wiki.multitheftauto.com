addEventHandler("onPlayerChat", root, function(message, messageType)
    if messageType == 0 and utf8.ncasecmp(message, "hello") == 0 then
        outputChatBox("* Server: Hello!", source, 255, 100, 100)
    end
end)
