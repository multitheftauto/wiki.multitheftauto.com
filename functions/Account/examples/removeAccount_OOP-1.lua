function onCmdDeregister ( playerSource, commandName )
	-- grab the account
	local sourceAccount = playerSource.account
	if (sourceAccount) then
		sourceAccount:remove()
		playerSource:outputChat ( "Account deregistered for " ..playerSource.name )
	else 
		playerSource:outputChat ( "Unable to get your account, make sure you are logged in")
	end
end
 
addCommandHandler("deregister",onCmdDeregister)