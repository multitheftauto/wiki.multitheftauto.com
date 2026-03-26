local edit = GuiEdit(300, 300, 250, 30, 'Hello MTA', false)
edit.readOnly = true

addEventHandler('onClientGUIClick', edit, function()
    if (edit.readOnly) then
        outputChatBox("This field is read only!")
    end
end)