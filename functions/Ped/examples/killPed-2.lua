function headshotKill ( attacker, attackerweapon, bodypart, loss )
	if bodypart == 9 then --if the bodypart is the head
		--kill the player, emulating the correct killer, weapon and bodypart.
		killPed ( source, attacker, attackerweapon, bodypart )
	end
end
addEventHandler ( "onPlayerDamage", getRootElement(), headshotKill )