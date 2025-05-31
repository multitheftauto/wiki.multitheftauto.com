function nickChangeHandler(oldNick, newNick)
    -- check if there's account with newNick as username
    if getAccount(newNick) then
        outputChatBox("Sorry, there already exists an account with your new nickname as username.", source, 0, 255, 0)
        outputChatBox("Please choose another one.", source, 0, 255, 0)
        -- cancel the event to prevent the nick from being changed
        cancelEvent()
    end
end
-- add an event handler
addEventHandler("onPlayerChangeNick", root, nickChangeHandler)