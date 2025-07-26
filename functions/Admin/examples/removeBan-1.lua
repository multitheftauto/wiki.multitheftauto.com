addEventHandler("onResourceStart",resourceRoot,function()
	local bans = getBans()
	for i,d in ipairs(bans) do
		local nick = getBanNick(d)

		if (removeBan(d)) then
			outputChatBox(nick.." has been unbanned.",root)
		end
	end
end)