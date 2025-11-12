local edit = guiCreateEdit(0.4,0.4,0.3,0.1,"",true)

addEventHandler("onClientGUIChanged",edit,function()
	outputChatBox("Caret index is: "..guiEditGetCaretIndex(edit)) -- output index to chat
end)