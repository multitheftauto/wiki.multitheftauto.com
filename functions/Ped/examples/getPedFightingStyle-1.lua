function getPlayerFightStyle ( thePlayer, commandName )
	local playerstyle = getPedFightingStyle ( thePlayer )   -- store the fighting style in a variable
	outputChatBox ( tostring(playerstyle), thePlayer )         -- output it to the player
end
addCommandHandler ( "getfightingstyle", getPlayerFightStyle )