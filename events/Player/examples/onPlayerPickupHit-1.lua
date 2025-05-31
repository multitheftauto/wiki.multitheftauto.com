function armourBlock(pickup)
	if (getPickupType(pickup) == 1) then -- If it's an armour pickup
		cancelEvent() -- Cancel the event
		outputChatBox("Armour pickups are disabled.", source, 255, 0, 0)
	end
end
addEventHandler("onPlayerPickupHit", root, armourBlock)