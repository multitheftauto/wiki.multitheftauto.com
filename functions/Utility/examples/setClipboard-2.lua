window = guiCreateWindow(47, 105, 262, 56, "example By ProGamer", false) 
edit = guiCreateEdit(47, 105, 262, 56, "", false, window)  
button1 = guiCreateButton(58, 220, 234, 46, "copy", false, window)

function clickedButton1()
    local text = guiGetText(edit)
    setClipboard(text)
end
addEventHandler("onClientGUIClick", button1, clickedButton1, false)