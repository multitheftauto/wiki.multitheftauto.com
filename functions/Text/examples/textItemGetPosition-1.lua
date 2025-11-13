function MyTestTextFunction ()
myDisplay = textCreateDisplay ( )                   -- create a text display
textDisplayAddObserver ( myDisplay, myPlayer )      -- make it visible to the player
x,y = textItemGetPosition ( otherTextItem )         -- get the position of 'otherTextItem'
if ( x == 0.5 ) and ( y == 0.5 ) then               -- if the x and y of the text item are in the middle
    textItemSetPosition ( otherTextItem, 0.5, 0.6 ) -- move otherTextItem down
end 
myTextItem = textCreateTextItem ( "Hello world!", 0.5, 0.5 ) -- create a new textitem in the middle saying "Hello world"
textDisplayAddText ( myDisplay, myTextItem )                 -- and add it to the text display
end