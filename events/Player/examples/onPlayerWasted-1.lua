-- register player_Wasted as a handler for onPlayerWasted
function player_Wasted ( ammo, attacker, weapon, bodypart )
	-- if there was an attacker
	if ( attacker ) then
		-- we declare our variable outside the following checks
		local tempString
		-- if the element that killed him was a player,
		if ( getElementType ( attacker ) == "player" ) then
			-- put the attacker, victim and weapon info in the string
			tempString = getPlayerName ( attacker ).." killed "..getPlayerName ( source ).." ("..getWeaponNameFromID ( weapon )..")"
		-- else, if it was a vehicle,
		elseif ( getElementType ( attacker ) == "vehicle" ) then
			-- we'll get the name from the attacker vehicle's driver
			tempString = getPlayerName ( getVehicleController ( attacker ) ).." killed "..getPlayerName ( source ).." ("..getWeaponNameFromID ( weapon )..")"
		end
		-- if the victim was shot in the head, append a special message
		if ( bodypart == 9 ) then
			tempString = tempString.." (HEADSHOT!)"
		-- else, just append the bodypart name
		else
			tempString = tempString.." ("..getBodyPartName ( bodypart )..")"
		end
		-- display the message
		outputChatBox ( tempString )
	-- if there was no attacker,
	else
		-- output a death message without attacker info
		outputChatBox ( getPlayerName ( source ).." died. ("..getWeaponNameFromID ( weapon )..") ("..getBodyPartName ( bodypart )..")" )
	end
end
addEventHandler ( "onPlayerWasted", root, player_Wasted )