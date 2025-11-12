function changeMyTeamName ( source, key, newName )
    playerteam = getPlayerTeam ( source )            -- get the player's team
    if ( playerteam ) then                           -- if he was on a team
        oldName = getTeamName ( playerteam )         -- get the teams current name
        setTeamName ( playerteam, newName )          -- change the teams name to blue
        outputChatBox ( "Changed " .. getPlayerName ( source ) .. "'s team name from " .. oldName .. " to " .. newName )
    end
end
addCommandHandler ( "changeteamname", changeMyTeamName )