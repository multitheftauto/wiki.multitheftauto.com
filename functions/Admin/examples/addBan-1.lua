function banMe ( source, command ) -- The function header and where source is defined
	local ipToBan = getPlayerIP ( source ) -- Get the player's IP
	addBan ( ipToBan, nil, nil, source, "Requested" ) -- Ban him with the reason; Requested
end
addCommandHandler ( "ban-me", banMe ) -- Make it trigger when a player types "/ban-me"