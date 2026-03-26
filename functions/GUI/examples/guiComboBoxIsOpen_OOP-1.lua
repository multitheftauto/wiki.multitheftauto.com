local comboBox = GuiComboBox(0.30, 0.45, 0.30, 0.20, 'Test', true) -- create the gui combo-box
local openButton = GuiButton(0.35, 0.31, 0.15, 0.15, 'Show numbers', true) -- create the button

for i = 1, 20 do
    comboBox:addItem(tostring(i)) -- add items
end

addEventHandler('onClientGUIClick', openButton, function()
    if (not comboBox.open) then -- or comboBox:isOpen()
        comboBox.open = true -- open the combobox
        openButton.text = 'Hide numbers'
    else
        comboBox.open = false-- close the combobox
        openButton.text = 'Show numbers'
    end
end)
