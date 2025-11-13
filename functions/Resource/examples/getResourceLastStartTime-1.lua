function whenStarted()
    local startTime = getResourceLastStartTime ( getThisResource() )    --Get the time and date
    outputChatBox( "This resource was started on: " .. startTime )    --tell everybody when the current resource was started.
end