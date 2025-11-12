local memo = guiCreateMemo(0.4,0.1,0.3,0.3,"",true)

addEventHandler("onClientGUIChanged",memo,function()
	outputChatBox("Caret index is: "..guiMemoGetCaretIndex(memo)) -- output index to chat
end)