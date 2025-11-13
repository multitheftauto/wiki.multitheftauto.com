function dxwidth(msg)
    chatbox = getChatboxLayout()
    local length = dxGetTextWidth(msg,chatbox["chat_scale"][1])
    outputChatBox(tostring(length))
end
addEventHandler("onClientChatMessage",root,dxwidth)