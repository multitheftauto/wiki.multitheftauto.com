local theMemo = GuiMemo(0, 0, 200, 100, [[Insert
some
long
text
here]], false)

setTimer(function()
    local position = theMemo.verticalScrollPosition
    outputChatBox("Current scroll position of the memo: " .. position .. "%")
end, 3000, 0)
