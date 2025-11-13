team = createTeam ( "RedTeam", 255, 0, 0 ) -- create the team
if ( team ) then                           -- if the team was created (a team with that name didn't already exist)
    setTeamName ( team, "BlueTeam" )       -- change the name
    setTeamColor ( team, 0, 0, 255 )       -- change the color to suit its new name
end