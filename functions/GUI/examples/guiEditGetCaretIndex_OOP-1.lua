local edit = GuiEdit(0.4, 0.4, 0.3, 0.1, "", true)

addEventHandler("onClientGUIChanged", edit, function()
    outputChatBox("Caret index is: " .. edit.caretIndex) -- output index to chat
end)
