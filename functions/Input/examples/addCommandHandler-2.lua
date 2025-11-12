-- Define our function that will handle this command (which can accept a variable number of arguments after commandName)
function consoleCheckParameters ( playerSource, commandName, ... )
	-- If a player, not an admin, triggered it,
	if playerSource then
		local arg = {...}
		-- Get the number of arguments in the arg table (arg table is the same as: {...})
		local parameterCount = #arg
		-- Output it to the player's chatbox
		outputChatBox ( "Number of parameters: " .. parameterCount, playerSource )
		-- Join them together in a single comma-separated string
		local stringWithAllParameters = table.concat( arg, ", " )
		-- Output this parameter list to the player's chatbox
		outputChatBox ( "Parameters passed: " .. stringWithAllParameters, playerSource )
	end
end
-- Attach the 'consoleCheckParameters' function to the "check_parameters" command
addCommandHandler ( "check_parameters", consoleCheckParameters )