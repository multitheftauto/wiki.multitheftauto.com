function cancelPedDamage()
	cancelEvent() -- cancel any damage done to peds
end
addEventHandler("onClientPedDamage", root, cancelPedDamage)