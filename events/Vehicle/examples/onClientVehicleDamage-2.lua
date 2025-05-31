-- Only let these weapons damage a Rhino
local weaponsToDamageRhino = {
	[38] = true, -- minigun
	[33] = true, -- country rifle
	[34] = true, -- sniper rifle
	[30] = true, -- AK-47
	[31] = true, -- M4
}

function handleRhinoDamage(attacker, weapon, loss, x, y, z, tire)
	if (weapon and getElementModel(source) == 432 and loss > 0) then
		if (weaponsToDamageRhino[weapon]) then
			setElementHealth(source, getElementHealth(source) - loss)
		end
	end
end
addEventHandler("onClientVehicleDamage", root, handleRhinoDamage)