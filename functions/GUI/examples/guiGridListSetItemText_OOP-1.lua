local list = GuiGridList(0.80, 0.10, 0.15, 0.60, true)
list:addColumn("Products", 0.8)

local items = {
    ['Fruits'] = {'Apple', 'Lemon', 'Banana'},
    ['Drinks'] = {'Milk', 'Tea', 'Coffee'},
    ['Vegetables'] = {'Carrot', 'Onion', 'Potato'}
}

for section, products in pairs(items) do
    -- Add sections
    list:setItemText(list:addRow(), 1, section, true, false)

    -- Add products
    for i, item in ipairs(products) do
        list:setItemText(list:addRow(), 1, item, false, false)
    end
end