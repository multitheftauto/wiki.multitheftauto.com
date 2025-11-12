function showArmor ( )
	local armor = getPedArmor ( localPlayer )
	outputChatBox( "Your armor: " .. armor )
end
addCommandHandler ( "showarmor", showArmor )