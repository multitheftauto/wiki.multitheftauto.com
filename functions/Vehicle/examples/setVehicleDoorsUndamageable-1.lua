function doorsLikeGod()
	for i, car in ipairs( getElementsByType ("vehicle") ) do
		setVehicleDoorsUndamageable ( car, true )
	end
	outputChatBox("All vehicles doors is not damageable")
end
addCommandHandler("nodamage", doorsLikeGod)

function doorsNotLikeGod()
	for i, car in ipairs( getElementsByType ("vehicle") ) do
		setVehicleDoorsUndamageable ( car, false )
	end
	outputChatBox("Now everyone can kick vehicles doors and throw them away.")
end
addCommandHandler("adddamage", doorsNotLikeGod)