-- Define the function for this command (/changetag, as defined below)
-- source = the player that triggered this command
-- command = the command passed into the function (changetag)
-- thePlayer = the player that you wish to add a tag to
-- tag = the tag to add to the players nickname
function tagPlayer ( source, command, thePlayer, tag )
	-- Attempt to grab the element id for the player from the parsed name.
	local sPlayerElement = getPlayerFromName ( thePlayer )
	-- Check to see if the player were changing the tag for exists.
	if ( sPlayerElement ) then
		-- make sure that the element type of thePlayer is acctually pointing to a player element
		if getElementType ( sPlayerElement ) == "player" then
			-- we store the player's current name,
			local oldName = getPlayerName ( sPlayerElement )
			-- append the tag passed to this function before it
			local taggedName = tag .. oldName
			-- then set it as his new name
			setPlayerName ( sPlayerElement, taggedName )
			-- Tell the player who triggerd the command that the tag has been applied
			outputChatBox ( "Player " .. thePlayer .. "'s tag changed to " .. taggedName, source )
		end
	else
		-- Tell the player who triggerd the command that the player could not be found
		outputChatBox ( "Unable to change player tag: Player " .. thePlayer .. " not found", source )
	end
end
-- Add a command handler for either the console or / chat commands
-- Example: /changetag <playername> <tag>
addCommandHandler ( "changetag", tagPlayer )