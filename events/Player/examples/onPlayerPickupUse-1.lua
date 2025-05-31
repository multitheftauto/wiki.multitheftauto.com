addEventHandler("onPlayerPickupUse",root,function(pickup)
	if(isPickupSpawned(pickup))then
		outputChatBox("The pickup your using is now available to use pick up again.",source)
	else
		outputChatBox("This pickup might be the last pickup to use ever again.",source)
	end
end)