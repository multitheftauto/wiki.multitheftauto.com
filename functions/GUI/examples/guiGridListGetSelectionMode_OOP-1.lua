local list = GuiGridList(0.35, 0.35, 0.4, 0.1, true)
list:addColumn("Column", 0.5)

for i = 1,10 do
	local r = list:addRow()
	list:setItemText(r, 1, "Item "..tostring(i))
end

-- adds the command 'getmode' which will call the function 'getSelectionMode' when typed
function getSelectionMode(commandName)
    local mode = list.selectionMode -- get the selection mode from 'myGridList'
    outputChatBox("The current gridlist selection mode is " .. tostring(mode), 230, 230, 230) -- shows in the chatbox the selection mode
end
addCommandHandler("getmode", getSelectionMode)
