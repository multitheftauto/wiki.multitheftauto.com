local list = GuiGridList(0.80, 0.10, 0.15, 0.60, true)
list:addColumn("Products", 0.8)

local items = {
    ['Fruits'] = {'Apple', 'Lemon', 'Banana'},
    ['Drinks'] = {'Milk', 'Tea', 'Coffee'},
    ['Vegetables'] = {'Carrot', 'Onion', 'Potato'}
}

local hpValue = {
    ['fruits'] = 10,
    ['drinks'] = 5,
    ['vegetables'] = 7
}

for section, products in pairs(items) do
    -- Add sections
    list:setItemText(list:addRow(), 1, section, true, false)

    -- Add products
    for i, item in ipairs(products) do
        local row = list:addRow()
        list:setItemText(row, 1, item, false, false)
        list:setItemData(row, 1, hpValue[section])
    end
end

addEventHandler('onClientGUIClick', list, function()
    local selectedRow = list:getSelectedItem()
    if (selectedRow == -1) then
        return
    end

    -- Give player hp every click
    local hp = list:getItemData(selectedRow, 1)
    localPlayer.hp = localPlayer.hp + hp
end)