function showKills ( option )
	if not option then
		-- Remove the "kills" column
		call(getResourceFromName("scoreboard"), "removeScoreboardColumn", "kills")
	else
		-- Add the "kills" column
		call(getResourceFromName("scoreboard"), "addScoreboardColumn", "kills")
		outputDebugString ( "Showing kills now..." )
	end
	gameShowKills = option 
end