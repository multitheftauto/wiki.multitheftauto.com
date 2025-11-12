-- create the function
function mutePlayer(player,command,victimName)
	-- if the player has specified a victim name to mute
	if victimName then
		-- get the victim player element from their name
		local victim = getPlayerFromName(victimName)
		-- if the player exists
		if victim then
			-- if they arent already muted
			if ( not isPlayerMuted(victim) ) then
				-- mute them and output a message to the chat
				setPlayerMuted(victim, true)
				outputChatBox("You have been muted.",victim)
			end
		else
			outputChatBox("Could not find player with name: "..tostring(victimName),player)
		end
	else
		outputChatBox("Usage: /mute <player name>",player)
	end
end
-- add the /mute command
addCommandHandler("mute",mutePlayer)