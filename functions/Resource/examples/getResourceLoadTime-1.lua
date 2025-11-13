local res = getResourceFromName ( "scoreboard" )
if res then
    local time = getRealTime(getResourceLoadTime(res)) --Gets all the data we need from UNIX time format, see getRealTime() for more details
    outputConsole ( "scoreboard was last loaded on: " ..  string.format("%i/%i/%i %i:%i:%i",time.monthday,time.month,time.year,time.hour,time.minute,time.second)) --this will be something like this: scoreboard was last loaded on: 10/07/2017 14:13:10
end