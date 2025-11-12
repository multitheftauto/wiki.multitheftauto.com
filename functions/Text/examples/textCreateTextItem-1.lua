myDisplay = textCreateDisplay ()                              -- create a display
textDisplayAddObserver ( myDisplay, myPlayer )                -- make it visible to a player
myTextItem = textCreateTextItem ( "Hello world!", 0.5, 0.5 )  -- create text item for the display
textDisplayAddText ( myDisplay, myTextItem )                  -- add created item to text display so it is displayed