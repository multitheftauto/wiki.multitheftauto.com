addEventHandler('onClientResourceStart',resourceRoot,function()
	local playersList = GuiComboBox(0.35,0.40,0.31,0.20,'Players',true) -- create gui combo box

	for key,player in ipairs(Element.getAllByType('player')) do -- get the connected players
		playersList:addItem(player.name) -- add players name to the combo box
	end
	
	local playersCount = playersList.itemCount -- get the number of items 
	outputChatBox('Number of connected players: '..playersCount) -- show info on chatbox
end)