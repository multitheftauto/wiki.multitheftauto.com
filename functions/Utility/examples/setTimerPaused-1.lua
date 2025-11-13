-- Get a table of all current timers from this resource
local timers = getTimers ( )
-- Loop through the table of timers
for timerIndex, timerValue in ipairs( timers ) do
    -- pause each timer
    setTimerPaused ( timerValue, true )
end