addCommandHandler("clear", function()
    outputChatBox(('\n'):rep(getChatboxLayout("chat_lines"))); -- or string.rep('\n', getChatboxLayout("chat_lines"))
end)
