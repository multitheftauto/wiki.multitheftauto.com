-- Print a list of all the alive players
alivePlayers = getAlivePlayers ()
if ( alivePlayers ) then -- if we got the table
    alivePlayersList = "none"
    -- Loop through the table
    for playerKey, playerValue in ipairs(alivePlayers) do
        -- add their name to the list
        if ( alivePlayersList == "none" ) then
            alivePlayersList = getPlayerName ( playerValue )
        else
            alivePlayersList = alivePlayersList .. ", " .. getPlayerName ( playerValue )
        end
    end
    outputChatBox ( "Alive Players: " .. alivePlayersList )    
end