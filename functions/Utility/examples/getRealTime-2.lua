function showtime ()
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	local seconds = time.second

        local monthday = time.monthday
	local month = time.month
	local year = time.year

        local formattedTime = string.format("%04d-%02d-%02d %02d:%02d:%02d", year + 1900, month + 1, monthday, hours, minutes, seconds)
	outputChatBox ( "Local Time: ".. formattedTime )
end
addCommandHandler("showtime", showtime)