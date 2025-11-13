addEventHandler("onResourceStart",resourceRoot,function()
	local bans = Ban.getList()
	for i,d in ipairs(bans) do
		local nick = d.nick

		if (d:remove()) then
			root:outputChat(nick.." has been unbanned.")
		end
	end
end)