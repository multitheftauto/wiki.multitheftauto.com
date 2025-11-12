function outputBan(ban)
	local banned = getBanNick(ban) -- Get the name of the player who was banned
	local banner = getBanAdmin(ban) -- Get the name of the admin who banned the player
	local reason = getBanReason(ban) -- Get the reason the player was banned
	outputChatBox("-----BAN-----",getRootElement(),255,0,0)
	if (banned) then
		outputChatBox("Player banned: "..banned,getRootElement(),255,0,0) -- Output the player name who was banned
	end
	if (banner) then
		outputChatBox("Banner: "..banner,getRootElement(),255,0,0) -- Output the admin name who performed the ban
	end
	if (reason) then
		outputChatBox("Reason: "..reason,getRootElement(),255,0,0) -- outputt the reason the player was banned
	end
end
addEventHandler("onBan",getRootElement(),outputBan) -- When a player is banned trigger the outputBan function