local list = guiCreateGridList(0.35, 0.35, 0.4, 0.1, true)
guiGridListAddColumn(list, "Column A")

for i = 1,10 do
	guiGridListAddRow(list, "Item "..tostring(i))
end

addCommandHandler('setMode', function(cmd, mode)
	if (not tonumber(mode)) then
		outputChatBox("Use /setMode <mode>")
		return
	end

	guiGridListSetSelectionMode(list, tonumber(mode))
	outputChatBox("Selection mode changed to "..mode)
end)