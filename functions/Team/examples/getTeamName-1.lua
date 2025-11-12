function whatTeamAmIOn (source)
    -- Get the player's team (source is the player who entered the command)
    local playerTeam = getPlayerTeam(source)
  
    if (playerTeam) then -- if he was on a team
        outputChatBox(getPlayerName(source).." is on team: "..getTeamName(playerTeam))
    else
        outputChatBox(getPlayerName(source).. " isn't on a team")
    end
end

-- Add console command to find your team when 'whatTeamAmIOn' is typed.
addCommandHandler("whatTeamAmIOn", whatTeamAmIOn)