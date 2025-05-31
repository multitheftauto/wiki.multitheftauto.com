function playerDamage_text ( attacker, weapon, bodypart, loss ) --when a player is damaged
	if ( bodypart == 9 and attacker and attacker ~= source ) then -- if the body part is 9 (head) and there is an attacker and it wasn't self damage
            outputChatBox ( "Headshot!", attacker, 255, 170, 0 ) --output "Headshot" into the chatbox
	    killPed ( source, attacker, weapon, bodypart ) -- and kill the player
	end
end
addEventHandler ( "onPlayerDamage", root, playerDamage_text ) --add an event handler for the onPlayerDamage event