addEventHandler("onPickupUse",root,function(player)
	if(isPickupSpawned(source))then
		outputChatBox("The pickup your using is now available to use pick up again.",player)
	else
		outputChatBox("This pickup might be the last pickup to use ever again.",player)
	end
end)