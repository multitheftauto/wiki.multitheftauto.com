function beheadMe(p, cmd)
	local hasHead = not isPedHeadless(p)

	if hasHead then
		setPedHeadless(p, true) -- Remove head
		outputChatBox("You have been beheaded!", p, 255, 0, 0) -- A confirmation message for the player
	else
		setPedHeadless(p, false) -- Restore head
		outputChatBox("You have been given a head!", p, 255, 0, 0) -- A confirmation message for the player
	end
end
addCommandHandler("togglehead", beheadMe)