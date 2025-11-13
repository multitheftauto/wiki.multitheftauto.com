local theMemo = guiCreateMemo( 0, 0, 200, 100, [[Insert
some
long
text
here]], false )

if ( theMemo ) then
    guiMemoSetVerticalScrollPosition( theMemo, 33.3 ) -- A third from the top
    local position = guiMemoGetVerticalScrollPosition( theMemo )
    outputChatBox( "Current position of scroll pane: " .. position .. "%" )
else
    outputChatBox( "Memo not found!" )
end