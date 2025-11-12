function setBirdsState()
	setBirdsEnabled(not getBirdsEnabled()) -- Disable the Birds if they're enabled, either Enable them.
	outputChatBox("The birds are now ".. (getBirdsEnabled() and "Enabled" or "Disabled") ..".") -- Output the new Birds state.
end
addCommandHandler("birds",setBirdsState) -- Add the command handler attached to the function "setBirdsState".