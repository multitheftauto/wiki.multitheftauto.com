editBox = guiCreateEdit(0.3,0.1,0.4,0.1,"",true)
addEventHandler("onClientGUIChanged", editBox, function() 
   outputChatBox("The box now reads: " .. guiGetText(source))
end)