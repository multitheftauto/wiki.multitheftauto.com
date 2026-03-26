local numberList = GuiGridList(0.80, 0.10, 0.15, 0.60, true)
local column = numberList:addColumn("Column Title", 0.85)

for i = 1,5 do
    local row = numberList:addRow()
    numberList:setItemText(row, column, 'Number '..tostring(i), false, false)
    numberList:setItemData(row, column, {text = "someData "..tostring(i*10), index = i})
end

addEventHandler('onClientGUIClick', numberList, function()
    local selectedItem = source:getSelectedItem()
    if (selectedItem == -1) then
        return
    end

    local data = source:getItemData(selectedItem, column)
    if (data) then
        local specialText = data.text
        print(specialText..' ('..data.index..')') -- e.g someData 30 (3)
    end
end)