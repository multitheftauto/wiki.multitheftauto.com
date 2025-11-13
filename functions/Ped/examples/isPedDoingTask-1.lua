function checkDriveBy()
    local playerName = getPlayerName(localPlayer)
    local doingDriveBy = isPedDoingTask(localPlayer, "TASK_SIMPLE_GANG_DRIVEBY")
    local driveByStatus = doingDriveBy and "is doing a driveby!" or "is not doing a driveby."

    outputChatBox(playerName.." "..driveByStatus)
end
addCommandHandler("doingdriveby", checkDriveBy)