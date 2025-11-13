function currentTime(sourcePlayer)
    local timehour, timeminute = getTime()
    outputChatBox( "The current game time (server) is "..timehour..":"..timeminute, sourcePlayer )
end
addCommandHandler("gettime", currentTime)