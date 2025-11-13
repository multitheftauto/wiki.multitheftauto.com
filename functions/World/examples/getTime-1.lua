function currentTime()
    local timehour, timeminute = getTime()
    outputChatBox( "The current game time is "..timehour..":"..timeminute )
end
addCommandHandler("gettime", currentTime)