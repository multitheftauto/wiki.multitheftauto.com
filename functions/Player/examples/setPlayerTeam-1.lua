function assignNewTeam ( source, commandName, teamName )
  local theTeam = createTeam ( teamName )  -- create a new team with the specified name
  if theTeam then                          -- if it was successfully created
    setPlayerTeam ( source, theTeam )    -- add the player to the new team
  end
end
addCommandHandler ( "gimmeateam", assignNewTeam )

function unassignTeam ( source, commandName )
  local theTeam = getPlayerTeam ( source )  -- Check if the player is on a team
  if theTeam then                          -- this player is on a team, so we can remove them from it
    setPlayerTeam ( source, nil )    -- remove the player from the current team
  end
end
addCommandHandler ( "takeawaymyteam", unassignTeam )