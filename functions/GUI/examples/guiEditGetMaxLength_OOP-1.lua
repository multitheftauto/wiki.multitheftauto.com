local edit = GuiEdit(0.4, 0.4, 0.3, 0.1, "", true)

addEventHandler("onClientGUIChanged", edit, function()
    outputChatBox("Characters remaining in edit box: " .. source.maxLength - #source.text) -- output remaining amount of characters
end)
