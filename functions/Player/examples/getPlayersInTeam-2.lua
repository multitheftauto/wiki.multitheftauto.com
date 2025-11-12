function showTeamFunction ( command, teamName )
        -- Find and show all the players in the team that was specified with the console command
        local theTeam = getTeamFromName ( teamName )
        if ( theTeam ) then
                local players = getPlayersInTeam ( theTeam ) 
                -- Loop through the player table
                for playerKey, playerValue in ipairs ( players ) do
                        outputChatBox ( getPlayerName(playerValue) )
                end
        end
end

addCommandHandler ( "showTeam", showTeamFunction )