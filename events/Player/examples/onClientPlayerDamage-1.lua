function stopMinigunDamage(attacker, weapon, bodypart)
	if (weapon == 38) then --if the weapon used was the minigun
		cancelEvent() --cancel the event
	end
end
addEventHandler("onClientPlayerDamage", localPlayer, stopMinigunDamage)