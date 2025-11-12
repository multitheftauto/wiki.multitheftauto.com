addCommandHandler("getSelected",
function (command)

local item = guiComboBoxGetSelected(comboBox)
local text = guiComboBoxGetItemText(comboBox, item)

outputChatBox("Currently selected item with ID: " .. tostring(item) .. " and with text: " .. text)

end)