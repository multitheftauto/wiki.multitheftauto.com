local memo = GuiMemo(0.4, 0.1, 0.3, 0.3, "", true)

addEventHandler("onClientGUIChanged", memo, function()
    outputChatBox("Caret index is: " ..memo.caretIndex) -- output index to chat
end)
