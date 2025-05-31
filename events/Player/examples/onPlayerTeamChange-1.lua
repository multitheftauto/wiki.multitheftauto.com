addEventHandler("onPlayerTeamChange", root, function(oldTeam, newTeam)
    local playerName = getPlayerName(source)

    if isElement(newTeam) then 
        outputChatBox(playerName.."'s team changed. New team name: "..getTeamName(newTeam))
    else
        outputChatBox(playerName.." is no longer in a team.")
    end 
end)