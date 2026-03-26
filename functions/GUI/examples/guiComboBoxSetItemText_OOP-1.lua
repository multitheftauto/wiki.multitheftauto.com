local comboBox = GuiComboBox(300, 300, 200, 250, "Players", false)

addEventHandler("onClientResourceStart", resourceRoot, function()
    for _, player in ipairs(Element.getAllByType("player")) do
        comboBox:addItem(player.name)
    end
end)

addEventHandler('onClientPlayerChangeNick', root, function(old, new)
    for i = 0, comboBox:getItemCount() - 1 do
        -- Check if the item text matches the old name, and if so, update it to the new name
        if (comboBox:getItemText(i) == old) then 
            comboBox:setItemText(i, new)
            break
        end
    end
end)