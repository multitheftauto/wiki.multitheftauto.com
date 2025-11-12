-- get a table with all teams
local allTeams = getElementsByType ( "team" )
-- for every team,
for index, theTeam in ipairs(allTeams) do
	-- if friendly fire is off,
	if ( getTeamFriendlyFire ( theTeam ) == false ) then
		-- switch it on
		setTeamFriendlyFire ( theTeam, true )
	end
end