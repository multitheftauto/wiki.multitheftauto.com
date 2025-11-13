-- Get a table of all current timers from this resource
local timers = getTimers ( )
-- Loop through the table of timers
for timerIndex, timerValue in ipairs( timers ) do
    -- check if each timer is currently paused
    local isPaused = isTimerPaused( timerValue )
    -- pause or resume each timer based on its current state
    setTimerPaused ( timerValue, not isPaused )
end