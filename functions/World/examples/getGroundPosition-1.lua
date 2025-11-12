function isPlayerUnderCover ( thePlayer )
	--we get the player's position
	local px, py, pz = getElementPosition ( thePlayer )
	--we'll check for ground level at the player's position, and also 500 units over him.
	--if these ground levels match, it must mean there were no obstacles (such as a ceiling) over the player,
	return getGroundPosition ( px, py, pz ) ~= getGroundPosition ( px, py, pz + 530 )
end