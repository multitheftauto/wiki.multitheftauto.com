-- Print a list of all the dead players
  deadPlayers = getDeadPlayers ()
  if ( deadPlayers ) then -- if we got the table
    deadPlayersList = "none"
    -- Loop through the table
    for playerKey, playerValue in deadPlayers do
      -- add their name to the list
      if ( deadPlayersList == "none" ) then
        deadPlayersList = getPlayerName ( playerValue )
      else
        deadPlayersList = deadPlayersList .. ", " .. getPlayerName ( playerValue )
      end
    end
    outputChatBox ( "Dead Players: " .. deadPlayersList )    
  end