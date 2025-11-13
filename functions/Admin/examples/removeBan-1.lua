addEventHandler("onResourceStart",resourceRoot,function()
	bans = getBans()
	for i,d in ipairs(bans)do
		nick = getBanNick(d)
		if(removeBan(d))then
			outputChatBox(nick.."has been removed from ban",root)
		end
	end
end)