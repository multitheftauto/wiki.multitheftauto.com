function killTeamFunction ( thePlayer, command, teamName )
	-- Find and kill all the players in the team that was specified with the console command
	local theTeam = getTeamFromName ( teamName )
	if ( theTeam ) then
		local players = getPlayersInTeam ( theTeam )
		-- Loop through the player table
		for playerKey, playerValue in ipairs ( players ) do
			-- kill the player
			killPlayer ( playerValue )
		end
	end
end

addCommandHandler ( "killTeam", killTeamFunction )