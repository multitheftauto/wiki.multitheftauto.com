-- Define our function that will handle this command
function consoleCreateMarker ( playerSource, commandName )
	-- If a player triggered it (rather than the admin) then
	if ( playerSource ) then
		-- Get that player's position
		local x, y, z = getElementPosition ( playerSource )
		-- Create a size 2, red checkpoint marker at their position
		createMarker ( x, y, z, "checkpoint", 2, 255, 0, 0, 255 )
		-- Output it in his chat box
		outputChatBox ( "You got a red marker", playerSource )
	end
end
-- Attach the 'consoleCreateMarker' function to the "createmarker" command
addCommandHandler ( "createmarker", consoleCreateMarker )