-- Define our function that will handle this command
function consoleGiveWeapon ( playerSource, commandName, weapName )
	-- If a player triggered it (rather than the admin) then
	if ( playerSource ) then
		-- Get the weapon ID from the name
		local weapID = getWeaponIDFromName ( weapName )
		-- If it's a valid weapon
		if ( weapID ) then
		 	-- Give the weapon to the player
			giveWeapon ( playerSource, weapID, 20 )
			-- Output it in the chat box
			outputChatBox ( "You got a " .. weapName, playerSource )
		else outputChatBox ( "Invalid weapon name." )
		end
	end
end
-- Register the command handler and attach it to the 'consoleGiveWeapon' function
addCommandHandler ( "weapon", consoleGiveWeapon )