function outputTeamSize ( commandName )
	-- Get player's team
	local theTeam = getPlayerTeam ( getLocalPlayer() )
	-- If the player is in any team
	if team then
		-- Tell the player how big his team is
		outputChatBox ( "Your team has " .. countPlayersInTeam ( theTeam ) .. " players." )
	else
		outputChatBox ( "You're not in a team." )
	end
end
addCommandHandler ( "teamsize", outputTeamSize )