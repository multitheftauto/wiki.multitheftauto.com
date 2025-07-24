addCommandHandler("listGroups", function(player)
	local account = player.account
	if (not account or account.guest) then
		return
	end

	player:outputChat('Groups:')
	local groups = aclObjectGetGroups('user.'..account.name) 

	for _,v in ipairs(groups) do
		player:outputChat('* '..v.name)
	end
end)