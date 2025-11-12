function funcInput ( key, keyState )
	outputChatBox( "You " .. (keyState == "down" and "pressed" or "let go of") .. " the " .. key .. " key!" )
end

function bindTheKeys ( commandName )
	bindKey( "F1", "down", funcInput )   -- bind the player's F1 down key
	bindKey( "F1", "up", funcInput )     -- bind the player's F1 up key
	bindKey( "fire", "both", funcInput ) -- bind the player's fire down and up control
end
addCommandHandler ( "bindme", bindTheKeys )