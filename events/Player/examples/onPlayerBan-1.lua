function outputBan ( banPointer, responsibleElement ) -- Define the banner and the ban pointer in the function.
	local banner = getPlayerName( responsibleElement ) or "Console" -- Get the banner's name.
	
	outputChatBox ( banner .." has banned ".. getPlayerName( source ) ..".", root, 255, 0, 0 ) -- Output the ban.
end
addEventHandler ( "onPlayerBan", root, outputBan ) -- Trigger the function when there is a ban.