function CopyAnimation(theCommand, thePlayer) -- The Command Function
	if thePlayer then -- If a player name entered then
		thePlayerToCopyFrom = getPlayerFromName(thePlayer) -- get player from his name
		block, anim = getPedAnimation(thePlayerToCopyFrom) -- get the player animation
		if block then -- if got the animation successfully then
			setPedAnimation(localPlayer, block, anim) -- set my animation the same
			outputChatBox("* Copied Successfully !") -- output chat message
		end
	else	
		outputChatBox("* Please Enter a Player Name To Copy From !") -- if you didnt entered a player name , then output a chat box message
	end
end
addCommandHandler("copyanim", CopyAnimation) --  adding the Command Handler