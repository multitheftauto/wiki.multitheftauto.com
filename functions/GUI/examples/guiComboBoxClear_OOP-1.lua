local comboBox = GuiComboBox(300, 300, 200, 350, "", false)

addEventHandler('onClientResourceStart', resourceRoot, function()
    for k,v in ipairs(Element.getAllByType('player')) do
        comboBox:addItem(v.name) -- We add the player name to our combo box.
    end
end)

addCommandHandler('clear', function()
    comboBox:clear() -- We clear our combo box removing all players.
end)