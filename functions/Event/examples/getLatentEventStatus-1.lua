function beginTransfer()
    triggerLatentServerEvent("blah", resourceRoot, myVeryLongString)    -- Start latent event
    myHandle = getLatentEventHandles()[#getLatentEventHandles()]        -- Get last latent event handle
    myTimer = setTimer( updateStatus, 1000, 0 )                         -- Output status once a second
end

function updateStatus()
    local status = getLatentEventStatus(myHandle)   -- Get latent event status
    if not status then
        killTimer(myTimer)                          -- getLatentEventStatus returns false when the handle is no longer valid
    else
        outputConsole( "Transfer status:"
            .. " tickStart:" .. tostring(status.tickStart)
            .. " tickEnd:" .. tostring(status.tickEnd)
            .. " totalSize:" .. tostring(status.totalSize)
            .. " percentComplete:" .. tostring(status.percentComplete)
            )
    end
end