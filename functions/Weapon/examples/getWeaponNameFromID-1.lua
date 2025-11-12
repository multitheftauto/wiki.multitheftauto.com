function scriptOnPlayerWasted ( totalammo, killer, killerweapon, bodypart ) --when a player dies
	local causeOfDeath = getWeaponNameFromID ( killerweapon ) --get the name of 'killerweapon' and define it as 'causeOfDeath'
	local killedPerson = getPlayerName ( source ) --get the name of the player who died and define it as 'killedPerson'
	if ( killer ) then --if there was a killer
	local killerPerson = getPlayerName ( killer ) --get the name of the killer and define it as 'killerPerson'
		if ( killer == source ) then --if the killer is the same as the person who died i.e. he killed himself
			outputChatBox ( "* "..killerPerson.." died ("..causeOfDeath..")", root, 255, 100, 100 ) --output in the chatbox that  he died and the method he died in the brackets
		else --if the killer is not the same as the person who died
			outputChatBox ( "* "..killerPerson.." killed "..killedPerson.." ("..causeOfDeath..")", root, 255, 100, 100 ) --output in the chatbox that he was killed by the killer and the method in brackets
		end
	else --if there was no killer
		outputChatBox ( "* "..killedPerson .. " died (" ..causeOfDeath..")", root, 255, 100, 100 ) --output in the chatbox that the person died and how he died
	end
end
addEventHandler ( "onPlayerWasted", root, scriptOnPlayerWasted ) --add an event handler for onPlayerWasted