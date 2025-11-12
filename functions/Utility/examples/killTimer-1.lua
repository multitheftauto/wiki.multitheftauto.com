-- Find and kill all the timers with less than 1 minute to go
timers = getTimers ( 60000 )
-- Loop through the timer list
for timerKey, timerValue in ipairs(timers) do
	-- kill the timer
      killTimer ( timerValue )
end