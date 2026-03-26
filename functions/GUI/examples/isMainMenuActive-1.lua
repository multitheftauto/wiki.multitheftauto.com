local lastStatus = false
local seconds = 0

setTimer(function()
    local currentStatus = isMainMenuActive()
    if (currentStatus and not lastStatus) then
        seconds = 0
    end

    if (currentStatus) then
        seconds = seconds + 1
    end

    if (not currentStatus and lastStatus) then
        outputChatBox('You were in the menu for '..seconds..' seconds')
    end

    lastStatus = currentStatus
end, 1000, 0)