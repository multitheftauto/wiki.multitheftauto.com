function setReason (player,cmd,name,...)
	local reason = table.concat({...}," ")
	if name and reason then
		local bans = getBans()
		for i,v in ipairs(bans)do
			if getBanNick(v) == name then
				setBanReason(v,reason)
				outputChatBox("Successfully edited the new Ban Reason.",player,0,125,0)
			end
		end
	end
end
addCommandHandler("setreason", setReason)