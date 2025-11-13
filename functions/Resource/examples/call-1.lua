function showKills ( option )
	if not option then
		-- Remove the "kills" column
		exports.scoreboard:removeScoreboardColumn("kills")
	else
		-- Add the "kills" column
		exports["scoreboard"]:addScoreboardColumn("kills")
		outputDebugString ( "Showing kills now..." )
	end
	gameShowKills = option 
end