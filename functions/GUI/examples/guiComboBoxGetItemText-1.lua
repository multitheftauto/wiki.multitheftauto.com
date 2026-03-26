local x,y = guiGetScreenSize()

local guiWindow = createWindow(x/2-500,y/2-500,500,500,"myWindow",false,nil)
local comboBox = guiCreateComboBox(0.1,0,1,0.8,0.8,"Select a value please",true,guiWindow)
guiComboBoxAddItem(comboBox,"value1")

addCommandHandler("getText",function()
    local item = guiComboBoxGetSelected(comboBox)
    if (item == -1) then
        outputChatBox("No item selected!")
        return
    end

    local text = guiComboBoxGetItemText(comboBox, item)

    if text then
        outputChatBox("You have selected: " .. text) 
    end
end)