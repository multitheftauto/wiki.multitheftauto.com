function checkWeightOnSpawn ( )
    local stat = getPedStat ( source, 21 )
    -- Check that getPedStat returned a value
    if ( stat > 500 ) then
        -- Output the stat in the chat box
        outputChatBox ( getPlayerName ( source ) .. " needs to lose a bit of weight!" )
    end
end
addEventHandler ( "onPlayerSpawn", getRootElement(), checkWeightOnSpawn )