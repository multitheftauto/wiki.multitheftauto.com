function gimmeATeam(source, commandName, teamName)
    local newTeam = createTeam(teamName) -- create a new team with the specified name
    if newTeam then -- if it was successfully created
        setPlayerTeam(source, newTeam) -- add the player to the new team
    end
end
addCommandHandler("giveteam", gimmeATeam)