function handleAC(detectedACList)
	for _, acCode in ipairs(detectedACList) do
		if acCode == 33 then -- SD #33 in this code example = NetLimiter software (possible lagswitch)
			local playerName = getPlayerName(source)
			warnAdmins(playerName, acCode)
		end
	end
end
addEventHandler("onPlayerACInfo", root, handleAC)

local staffACL = {
	[aclGetGroup("Admin")] = true,
	[aclGetGroup("Moderator")] = true
}

function warnAdmins(playerName, acCode)
	for _, p in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(p)
		if p and account then
			for group, _ in pairs(staffACL) do
				local name = getAccountName(account)
				if isObjectInACLGroup("user." .. name, group) then
					outputChatBox("The player " .. playerName .. " has triggered SD/AC #" .. acCode .. "! Keep an eye out!", p)
				end
			end
		end
	end
end

-- Ensure no one gets missed when the resource is (re)started
function onRestart()
	for _,p in ipairs (getElementsByType("player")) do
		resendPlayerACInfo(p)
	end
end
addEventHandler("onResourceStart", resourceRoot, onRestart)