local theMemo = GuiMemo(0, 0, 200, 100, [[Insert
some
long
text
here]], false)

theMemo.verticalScrollPosition = 33.3 -- A third from the top
outputChatBox("Current scroll position: " .. theMemo.verticalScrollPosition .. "%") -- 33.3%