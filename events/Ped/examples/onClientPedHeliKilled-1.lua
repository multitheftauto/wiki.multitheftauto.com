function cancelDeath()
	cancelEvent()
end
addEventHandler("onClientPedHeliKilled", root, cancelDeath)