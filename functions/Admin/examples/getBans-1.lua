function listBans ( playerSource )
local banList = getBans() -- Return a table of all the bans.
	--
	for banID, ban in ipairs ( banList ) do -- For every ban do the following...	
		--
		local nick = getBanNick ( ban ) -- Get the IP of the ban
		--
		if nick then
			outputChatBox ( "Ban #" .. banID .. ": " .. nick, playerSource , 255, 0, 0, true ) -- Output the ban.
		end
		--
	end
	--
end
addCommandHandler ( "bans", listBans ) -- Add "/bans" as the trigger for the function.