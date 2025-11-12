function showPlayers()
    local window = guiCreateWindow(0,0,500,400,"Window example - Title",false) -- Create the window
    grid = guiCreateGridList(0,0,100,300,false,window) -- Create the gridlist
    local column = guiGridListAddColumn(grid, "Players online", 0.9) -- Create a column
    showCursor(true)--show cursor
    for index,player in ipairs(getElementsByType("player")) do -- Loop through all players
        local row = guiGridListAddRow(grid) -- Add a row
        guiGridListSetItemText ( grid, row, column, (string.gsub ( getPlayerName(player), '#%x%x%x%x%x%x', '' ) or getPlayerName(player)), false, false) -- Set it's text to the player's name excluding colorcodes
        guiGridListSetItemData ( grid, row, column, getPlayerName(player)) -- Set it's data to the player's name with colorcodes
    end
end
 
function outputPlayerName()
    if source == grid then -- If the player clicked something in the grid
        local selectedRow, selectedColumn = guiGridListGetSelectedItem(grid) -- See which player he selected
        local playerName = guiGridListGetItemData(grid, selectedRow, selectedColumn) -- Get the selected player's name with color codes   local playerNameWithoutColorCodes = guiGridListGetItemText(grid, selectedRow, selectedColumn) -- Get the selected player's name without color codes
        local playerNameWithoutColorCodes = guiGridListGetItemText(grid, selectedRow, selectedColumn) -- Get the selected player's name without color codes
        if playerName and playerNameWithoutColorCodes then -- If he really selected something
            outputChatBox("The selected player's name without color codes : "..playerNameWithoutColorCodes, 255,255,255,false) -- output without color codes
            outputChatBox("The selected player's name with color codes : "..playerName, 255,255,255,false) -- output with color codes
            outputChatBox("The selected player's name with colors : "..playerName, 255,255,255,true) -- output with colors
        end
    end
end
 
addEventHandler("onClientGUIClick", getRootElement(), outputPlayerName)
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), showPlayers)