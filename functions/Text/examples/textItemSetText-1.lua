function updateScoreOnWasted ( ammo, killer, weapon )
	if ( killer ~= false) then                            -- Check to see if anything killed the player
		local killerTeam = getTeamName ( getPlayerTeam(killer) )
		if ( killerTeam == "grove" ) then             -- if a Grove player scored the kill
			groveteamscore = groveteamscore + 1   -- Grove gets 1 point
			textItemSetText ( scoregrove, tostring(groveteamscore) ) -- Update scoreboard.
		elseif ( killerTeam == "balla" ) then         -- if a Balla player scored the kill
			ballateamscore = ballateamscore + 1   -- Ballas get 1 point
			textItemSetText ( scoreballa, tostring(ballateamscore) ) -- Update scoreboard.
		end
	end
end
addEventHandler ( "onPlayerWasted", root, updateScoreOnWasted )