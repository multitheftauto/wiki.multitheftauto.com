addEventHandler("onClientResourceStart", resourceRoot, function() -- only execute the code when this resource restarts
    local memo = guiCreateMemo(0.4, 0.4, 0.2, 0.2, "This is a memo.", true) -- create a relative memo GUI element
    guiMemoSetReadOnly(memo, true) -- make it read only, so players won't be able to edit it in-game
end)
