local respawn = false
addCommandHandler("tos",
	function ()
		for i, object in pairs(getElementsByType("object")) do
			toggleObjectRespawn(object, not respawn)
		end
		outputChatBox("Object respawning " .. (respawn and "disabled" or "enabled"))
		respawn = not respawn
	end)