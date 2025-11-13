function areBirdsEnabled()
	outputChatBox("The birds are currently ".. (getBirdsEnabled() and "Enabled" or "Disabled") ..".") -- Output the birds state.
end
addCommandHandler("birds", areBirdsEnabled) -- Add the command handler attached to the function "areBirdsEnabled".