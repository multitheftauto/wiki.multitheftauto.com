local list = GuiGridList(0.30, 0.10, 0.5, 0.60, true)
list:addColumn("Products")

local items = {"Apple", "Water", "Milk", "Banana", "Orange", "Lemon"}
for i, v in ipairs(items) do
    list:addRow(v)
end

addCommandHandler('buy', function(cmd, itemName)
    if (not tostring(itemName)) then
        outputChatBox('Use /buy <itemName>')
        return
    end

    local removed = false
    for i = 0, list.rowCount - 1 do
        local productName = list:getItemText(i, 1)
        if (productName == itemName) then
            list:removeRow(i)
            removed = true
            break 
        end
    end

    if (not removed) then
        outputChatBox('Product '..itemName..' not found')
    else
        outputChatBox('Product '..itemName..' has been removed from your shopping list')
    end
end)