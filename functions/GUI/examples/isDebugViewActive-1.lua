function checkDebug () -- The function header
	if ( isDebugViewActive() ) then -- Check if debugscript is active...
		outputChatBox ( "You currently have debugscript on." ) -- If it is, output that it is
	else -- If it returns anything else (that it's not active)...
		outputChatBox ( "You currently have debugscript off." ) -- Output that they haven't got it on.
	end
end
addCommandHandler ( "debug", checkDebug ) -- Execute the script when the client types "/debug"