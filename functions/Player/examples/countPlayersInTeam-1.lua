function outputTeamSize ( source, commandName )
	-- Get player's team
	local theTeam = getPlayerTeam ( source )
	-- If the player is in any team
	if theTeam then
		-- Tell the player how big his team is
		outputChatBox ( "Your team has " .. countPlayersInTeam ( theTeam ) .. " players.", source )
	else
		outputChatBox ( "You're not in a team.", source )
	end
end
addCommandHandler ( "teamsize", outputTeamSize )