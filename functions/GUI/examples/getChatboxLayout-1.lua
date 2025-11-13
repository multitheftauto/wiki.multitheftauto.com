addCommandHandler("clear",
    function ()
        local lines = getChatboxLayout()["chat_lines"]
        for i = 1, lines do
            outputChatBox("")
        end
    end
)