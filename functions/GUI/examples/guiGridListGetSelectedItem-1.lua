addEventHandler('onClientResourceStart', resourceRoot, function()
    local playerList = guiCreateGridList(0.8, 0.1, 0.15, 0.6, true)

    -- Create a players column in the list
    local column = guiGridListAddColumn(playerList, 'Player', 0.85)

    -- If the column has been created, fill it with players
    if not column then return end

    for id, playeritem in ipairs(getElementsByType('player')) do
        local row = guiGridListAddRow ( playerList )
        guiGridListSetItemText(playerList, row, column, getPlayerName(playeritem), false, false)
    end

    addEventHandler('onClientGUIClick', playerList, function()
        local row, column = guiGridListGetSelectedItem(playerList)
        outputChatBox(guiGridListGetItemText(playerList, row, column))
    end)
end