local comboBox = GuiComboBox(300, 300, 200, 250, "Players", false)

addEventHandler("onClientResourceStart", resourceRoot, function()
    for _, player in ipairs(Element.getAllByType("player")) do
        comboBox:addItem(player.name)
    end
end)

addEventHandler('onClientPlayerQuit', root, function()
    for i = 0, comboBox:getItemCount() - 1 do
        -- Check if the item text matches the player's name, and if so, remove it
        if (comboBox:getItemText(i) == source.name) then 
            comboBox:removeItem(i)
            break
        end
    end
end)