addCommandHandler("listGroups", function(player)
	local account = getPlayerAccount(player)
	if (not account or isGuestAccount(account)) then
		return
	end

	outputChatBox('Groups:', player)
	local groups = aclObjectGetGroups('user.'..getAccountName(account)) 

	for _,v in ipairs(groups) do
		outputChatBox('* '..aclGroupGetName(v), player)
	end
end)