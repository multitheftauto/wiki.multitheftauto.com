function kickPing() -- Creates a function called kickPing
	for i, player in ipairs(getElementsByType("player")) do -- Loop every player
		if (getPlayerPing(player) >= 500) then -- If their ping is over 500
			kickPlayer(player, "Ping over 500!") -- Kick them
		end
	end
end
setTimer(kickPing, 5000, 0) -- Every 5 seconds, the kickPing function is called.