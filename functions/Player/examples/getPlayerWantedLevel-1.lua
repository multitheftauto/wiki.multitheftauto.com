local players = getElementsByType ( "player" ) -- get a table of all the players in the server
for theKey,thePlayer in ipairs(players) do -- use a generic for loop to step through each player
   local level = getPlayerWantedLevel ( thePlayer ) -- get the wanted level of the player
   if ( level > 0 ) then -- if the player has any stars, announce it in the chat:
      outputChatBox ( getPlayerName ( thePlayer ) .. " has a wanted level of " .. level .. "  stars!" )
   end 
end