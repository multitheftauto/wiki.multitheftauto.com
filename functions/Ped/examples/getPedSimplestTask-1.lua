function showSimplestTask()
    local taskName = getPedSimplestTask(localPlayer)
    local playerName = getPlayerName(localPlayer)

    outputChatBox(playerName.."'s simplest task is: "..taskName)
end
addCommandHandler("simplestTask", showSimplestTask)