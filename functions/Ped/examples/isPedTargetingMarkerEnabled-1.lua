function toggleTargetMarkers(cmd)
	local targets = isPedTargetingMarkerEnabled()
	setPedTargetingMarkerEnabled(not targets)
	outputChatBox("You have " .. (targets and "enabled" or "disabled") .. " target markers.", 0, 255, 0, false)
end
addCommandHandler("togtargetmarkers", toggleTargetMarkers)