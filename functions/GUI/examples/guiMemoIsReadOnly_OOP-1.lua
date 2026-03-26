local memo = GuiMemo(0.4, 0.4, 0.2, 0.2, "This is a memo.", true) -- create a relative memo GUI element

addCommandHandler('readOnly', function()
    memo.readOnly = not memo.readOnly
    outputChatBox("The memo is now "..(memo.readOnly and 'read only' or 'editable'))
end)