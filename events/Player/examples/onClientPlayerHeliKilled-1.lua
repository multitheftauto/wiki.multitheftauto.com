function cancelDeath()
	cancelEvent()
end
addEventHandler("onClientPlayerHeliKilled", getLocalPlayer(), cancelDeath)