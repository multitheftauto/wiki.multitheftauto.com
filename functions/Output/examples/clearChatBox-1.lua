function cmdClearChat(p, cmd)
    if not isPlayerStaff(p) then return end
    clearChatBox()
end
addCommandHandler("clearchat", cmdClearChat)

-- Utility function
local staffACLs = {
    aclGetGroup("Admin"),
    aclGetGroup("Moderator")
}

function isPlayerStaff(p)
	if isElement(p) and getElementType(p) == "player" and not isGuestAccount(getPlayerAccount(p)) then
		local object = getAccountName(getPlayerAccount(p))

		for _, group in ipairs(staffACLs) do
			if isObjectInACLGroup("user." .. object, group) then
				return true
			end
		end
	end
	return false
end