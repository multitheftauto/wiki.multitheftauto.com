function balanceTeams ( thePlayer )
	--get the team pointers from their names
	local groveTeam = getTeamFromName ( "grove" )
	local ballasTeam = getTeamFromName ( "ballas" )
	--count the number of players in each team, and store them
	local groveCount = countPlayersInTeam ( groveTeam )
	local ballasCount = countPlayersInTeam ( ballasTeam )
	if groveCount == ballasCount then --if the teams are equal
		setPlayerTeam ( thePlayer , groveTeam ) --place the player in grove
	elseif groveCount > ballasCount then --if there are more in grove
		setPlayerTeam ( thePlayer , ballasTeam ) --place him in ballas
	elseif groveCount < ballasCount then --if there are more in ballas
		setPlayerTeam ( thePlayer , groveTeam ) --place him in grove.
	end
end