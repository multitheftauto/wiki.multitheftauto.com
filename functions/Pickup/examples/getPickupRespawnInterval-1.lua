addEventHandler("onPickUpHit",root,function(player)
	outputChatBox("That pickup isn't going to be there until "..tostring(getPickupRespawnInterval(source)).." is done.",player)
end)