function showTextDisplay ( player, command )
   local serverDisplay = textCreateDisplay()                             -- create a text display
   textDisplayAddObserver ( serverDisplay, player )                      -- make it visible to a player
   local serverText = textCreateTextItem ( "Hello world!", 0.5, 0.5 )    -- create a text item for the display
   textDisplayAddText ( serverDisplay, serverText )                      -- add it to the display so it is displayed
end
addCommandHandler( "showText", showTextDisplay )