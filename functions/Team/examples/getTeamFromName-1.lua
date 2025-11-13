-- Creates a red team
createTeam("Red", 255, 0, 0)

function joinRedTeam (source)
	local redteam = getTeamFromName("Red")
	if (redteam) then -- If the team was successfully created
		-- Sets the player's team by getting the partial name of the red team.
		setPlayerTeam(client, readteam)
		outputChatBox("You are now in the 'Red' team", source)
	else
		outputChatBox("Sorry, we can't set your team. An error occurred!", source)
	end
end

--Add console command to join the team when 'joinTeam' is typed.
addCommandHandler("jointeam", joinRedTeam)