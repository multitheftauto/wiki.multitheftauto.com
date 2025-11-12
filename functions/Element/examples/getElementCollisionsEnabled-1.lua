for _,player in ipairs( getElementsByType( "player" ) ) do
   if not getElementCollisionsEnabled( player ) then -- If we get a false return from the function, we know that the collisions are disabled.
      outputConsole( "Player " .. getPlayerName( player ) .. " has collisions disabled." ) 
   end
end