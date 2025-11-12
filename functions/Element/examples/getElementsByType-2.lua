local teams = getElementsByType("team")
for i,team in ipairs(teams) do
   local teamName = getTeamName(team) -- get the team name
   outputChatBox(teamName) -- display the team name in chat
end