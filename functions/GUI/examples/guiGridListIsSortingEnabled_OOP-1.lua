local newGridlist = GuiGridList(0.50, 0.50, 0.20, 0.30, true)

function toggleGridlistSortingState()
    newGridlist.sortingEnabled = not newGridlist.sortingEnabled
    outputChatBox("The gridlist sorting is now " .. (newGridlist.sortingEnabled and "Enabled" or "Disabled"), 230, 230, 230)
end
addCommandHandler("togglesorting", toggleGridlistSortingState)
