-- Define the function that will handle the 'createmarker' command
function consoleCreateMarker ( playerSource, commandName )
	-- If a player triggered it (rather than the admin) then
	if ( playerSource ) then
		-- Get that player's position
		x, y, z = getElementPosition ( playerSource )
		-- Create a marker at their position
		createMarker ( x, y, z, 0, "checkpoint", 255, 0, 0, 255 )
		-- Output it in the chat box
		outputChatBox ( "You got a red marker", playerSource )
	end
end
-- Add the function as a handler for the command
addCommandHandler ( "createmarker", consoleCreateMarker )

-- Define a second console command that will just call the first.
-- First define the function
function consoleCreateMarker2 ( playerSource, commandName )
	-- re-route back to the original
	executeCommandHandler ( "createmarker", playerSource )
end
-- Then add it as a handler for the new console command
addCommandHandler ( "createmarker2", consoleCreateMarker2 )