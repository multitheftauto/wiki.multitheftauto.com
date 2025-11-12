setTimer(
    function()
        for _, player in ipairs(getElementsByType("player"))do -- Loop thru every player
            if (getPlayerIdleTime(player) > 300000) then -- Player hasn't moved for 300,000ms (5 minutes)
                kickPlayer(player, "Idle for 5 minutes") -- Kick the idling player
            end
        end
    end,
30000, 0) -- Timer to execute every 30 seconds, checking for idlers