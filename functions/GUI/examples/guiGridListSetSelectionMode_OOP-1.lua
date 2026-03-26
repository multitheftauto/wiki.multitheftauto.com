local list = GuiGridList(0.35, 0.35, 0.4, 0.1, true)
list:addColumn("Column A")

for i = 1,10 do
	list:addRow("Item "..tostring(i))
end

addCommandHandler('setMode', function(cmd, mode)
	if (not tonumber(mode)) then
		outputChatBox("Use /setMode <mode>")
		return
	end

	list.selectionMode = tonumber(mode)
	outputChatBox("Selection mode changed to "..mode)
end)