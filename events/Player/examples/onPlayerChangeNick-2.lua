function wasNickChangedByUser(oldNick, newNick, changedByUser)
	if (changedByUser == false) then -- check if the nickname was not changed by the user
		outputServerLog("Player "..oldNick.."'s name was changed to "..newNick.." by a script") -- output to the server's logs
	end	
end
addEventHandler("onPlayerChangeNick", root, wasNickChangedByUser) -- add an event handler