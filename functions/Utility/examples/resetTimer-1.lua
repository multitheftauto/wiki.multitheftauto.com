-- This example shows how you can reset timer by using /rtimer command.

local timerElement = false

function timerFunction()
	print("Timer function executed at "..getTickCount())
end
timerElement = setTimer(timerFunction, 3000, 0)

function timerResetCommand()
	local validTimer = isTimer(timerElement)

	if validTimer then
		print("Timer has been resetted.")
		resetTimer(timerElement)
	end
end
addCommandHandler("rtimer", timerResetCommand)