thePed = createPed(120, 5540.6654, 1020.55122, 1240.545) -- Creates a ped
function cancelPedDamage()
	cancelEvent() -- Cancels the onClientPedDamage event
end
addEventHandler("onClientPedDamage", thePed, cancelPedDamage) -- When thePed is damaged, cancelPedDamage is called