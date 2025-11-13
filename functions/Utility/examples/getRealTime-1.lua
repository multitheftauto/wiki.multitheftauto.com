function showtime ()
    local time = getRealTime()
    local hours = time.hour
    local minutes = time.minute
    local seconds = time.second

    -- use string.format to keep it 2 digits. eg 1 will be converted to 01
    outputChatBox ( string.format("Local Time: %02d:%02d:%02d",  hours, minutes, seconds) )
end
addCommandHandler("showtime", showtime)