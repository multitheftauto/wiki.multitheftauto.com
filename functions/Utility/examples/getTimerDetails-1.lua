theTimer = setTimer(function() end, 1000, 10) -- A timer that does nothing.

function timerDetails()
	local remaining, executesRemaining, timeInterval = getTimerDetails(theTimer) -- Get the timers details
	if (remaining and executesRemaining and timeInterval) then
		outputChatBox("Time remaining this second: "..remaining.." Executes remaining: "..executesRemaining.." Time interval: "..timeInterval)
	else
		outputChatBox("Timer no longer exists")
	end
end
addCommandHandler("timerdetails", timerDetails)