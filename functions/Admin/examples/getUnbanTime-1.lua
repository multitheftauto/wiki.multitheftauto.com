function listBans ()
	local bansList = getBans() -- Return a table of all the bans.
 
	for banID, ban in ipairs ( banList ) do -- For every ban do the following...
		local nick = getBanNick ( ban ) -- Get the IP of the ban
                local timetounban = getUnbanTime ( ban ) -- get the time to wait of the banned player
		if nick then
			outputChatBox ( "Ban #" .. banID .. ": " .. nick.." || Time to unban: "..timetounban , source, 255, 0, 0 ) -- Output the baninfo
		end
	end
end
addCommandHandler ( "bans", listBans ) -- Add "/bans" as the trigger for the function.