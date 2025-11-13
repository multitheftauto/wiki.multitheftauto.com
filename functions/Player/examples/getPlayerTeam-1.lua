function teamName ( source, key, newTeamName )
    local playerTeam = getPlayerTeam ( source )          -- get the player's team
    if ( playerTeam ) then                               -- if he's on a team
        local oldTeamName = getTeamName ( playerTeam )   -- get the team's current name
        setTeamName ( playerTeam, newTeamName )          -- change its name
        outputChatBox ( "Changed " .. getPlayerName ( source ).."'s team name from " .. oldTeamName .. " to " .. newTeamName )
    else
        outputChatBox ( getPlayerName ( source ) .. " isn't on a team" )
    end
end
addCommandHandler ( "teamname", teamName )