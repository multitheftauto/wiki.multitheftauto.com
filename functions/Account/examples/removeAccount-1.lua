function onCmdDeregister ( playerSource, commandName )
	-- grab the account
	local sourceAccount = getPlayerAccount ( playerSource )
	if sourceAccount then
		removeAccount ( sourceAccount )
		outputChatBox ( "Account deregistered for " .. getPlayerName ( playerSource ) )
	else 
		outputChatBox ( "Unable to get your account, make sure you are logged in", playerSource )
	end
end
 
addCommandHandler("deregister",onCmdDeregister)