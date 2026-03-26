local gridlist = GuiGridList(332, 195, 286, 249, false)
local column = gridlist:addColumn("Your title", 0.6)

addCommandHandler("setTitle", function(cmd, title)
    if (not tostring(title)) then
        outputChatBox("Use /setTitle <title>")
        return
    end

    gridlist:setColumnTitle(1, title)
    outputChatBox("Column name has been successfully changed to: "..title)
end)
