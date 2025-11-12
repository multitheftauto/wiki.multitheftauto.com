function setFriendlyFireOn ( )
	-- For each team,	
	for index, theTeam in ipairs ( getElementsByType("team") ) do
	        -- if friendly fire is off,
	        if ( getTeamFriendlyFire ( theTeam ) == false ) then
	                -- switch it on.
	                setTeamFriendlyFire ( theTeam, true )
	        end
	end
end
-- Add console command 'setFF'
addCommandHandler ( "setFF", setFriendlyFireOn )