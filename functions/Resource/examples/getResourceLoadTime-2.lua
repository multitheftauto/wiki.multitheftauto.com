function getLoadTime(p,c,res)
	local resource = getResourceFromName(tostring(res))
	if not res or not resource then
		outputChatBox("Syntax: /" .. c .. " [Resource Name]")
	else
		local time = getRealTime(getRealTime().timestamp-getResourceLoadTime(resource))
		outputChatBox("The resource " .. res .. " started at " .. string.format("%i/%i/%i %i:%i:%i",time.monthday,time.month,time.year,time.hour,time.minute,time.second))
	end
end
addCommandHandler("getResourceLoadTime", getLoadTime, false,false) --adds the command handler