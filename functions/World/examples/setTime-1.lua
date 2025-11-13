function setTimeAndNotify( hour, minute )
	-- set the time first
	setTime ( hour, minute )
	-- format a notification message, adding leading zeros (e.g. 12:03 instead of 12:3)
	local notifyMessage = string.format("Time changed to %02d:%02d!", hour, minute)
	-- output the message
	outputChatBox ( notifyMessage )
end