function showGravity ( thePlayer )
	local gravity = getPedGravity ( thePlayer )
	outputChatBox ( "Your gravity: " .. tostring(gravity), thePlayer )
end
addCommandHandler ( "showGravity", showGravity )