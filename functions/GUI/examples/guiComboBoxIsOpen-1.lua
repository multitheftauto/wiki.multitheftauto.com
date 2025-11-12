local comboBox = guiCreateComboBox(0.30,0.45,0.30,0.20,'Test',true) -- create the gui combo-box
local openButton = guiCreateButton(0.35,0.31,0.15,0.15,'Show numbers',true) -- create the button

for i = 1,20 do
	guiComboBoxAddItem(comboBox, tostring(i)) -- add items
end

addEventHandler('onClientGUIClick',openButton,function()
	if not guiComboBoxIsOpen(comboBox) then
		guiComboBoxSetOpen(comboBox, true) -- open the combobox
		guiSetText(source, 'Hide numbers')
	else
		guiComboBoxSetOpen(comboBox, false) -- close the combobox
		guiSetText(source, 'Show numbers')
	end
end)