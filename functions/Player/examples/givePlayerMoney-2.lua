function rewardOnWasted ( ammo, killer, killerweapon, bodypart )
	--if there is a killer, and that killer is not the same person as whoever died
	if ( killer ) and ( killer ~= source ) then 
		givePlayerMoney ( killer, 1000 ) --reward the killer with 1000 cash.
	end
end
addEventHandler ( "onPlayerWasted", root, rewardOnWasted ) --attach the rewardOnWasted function to the relevant event.