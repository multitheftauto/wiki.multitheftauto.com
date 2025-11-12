addCommandHandler("setText",
function(cmd, text)

local item = guiComboBoxGetSelected(comboBox)
guiComboBoxSetItemText(comboBox, item, text)

end)