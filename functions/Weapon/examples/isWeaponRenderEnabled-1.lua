function toggleWeaponRender()
	local weaponRenderEnabled = isWeaponRenderEnabled()
	local weaponRenderNewState = (not weaponRenderEnabled)

	setWeaponRenderEnabled(weaponRenderNewState)
end
addCommandHandler("weaponrender", toggleWeaponRender)