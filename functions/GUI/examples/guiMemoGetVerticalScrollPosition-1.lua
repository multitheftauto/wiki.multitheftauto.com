local theMemo = guiCreateMemo( 0, 0, 200, 100, [[Insert
some
long
text
here]], false )

if ( theMemo ) then
    local position = guiMemoGetVerticalScrollPosition( theMemo )
    outputChatBox( "Current scroll position of the memo: " .. position .. "%" )
else
    outputChatBox( "Memo not found!" )
end