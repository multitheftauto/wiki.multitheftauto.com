function doesPlayerHaveWeapon(source)
	local pedSlot = getPedWeaponSlot ( source )
	if (pedSlot == 0)	then
		outputChatBox("Your weapon is not in your hands ;)", source)
	end
end
addCommandHandler("weapon", doesPlayerHaveWeapon)