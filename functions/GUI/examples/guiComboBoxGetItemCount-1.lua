addEventHandler('onClientResourceStart',resourceRoot,function()
	local playersList = guiCreateComboBox(0.35,0.40,0.31,0.20,'Players',true) -- create gui combo box

	for key,player in ipairs(getElementsByType('player')) do -- get the connected players
		guiComboBoxAddItem(playersList, getPlayerName(player)) -- add players name to the combo box
	end
	local playersCount = guiComboBoxGetItemCount(playersList) -- get the number of items 
	outputChatBox('Number of connected players: '..playersCount) -- show info on chatbox
end)