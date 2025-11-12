function toggleInvis ( thePlayer )  -- thePlayer is whoever executed the command
   if getElementAlpha( thePlayer ) == 0 then -- if the player is invisible
       setElementAlpha ( thePlayer, 255 ) -- set the player alpha to 255.
   else	-- else, if the player is visible
       setElementAlpha ( thePlayer, 0 )	-- set the players alpha to 0.
   end
end
addCommandHandler ( "invis", toggleInvis ) -- When /invis is typed, the function 'toggleInvis' will start.