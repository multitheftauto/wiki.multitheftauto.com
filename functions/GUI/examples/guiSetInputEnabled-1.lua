function setInputState()
	guiSetInputEnabled(not guiGetInputEnabled()) -- Disable the Input if Enabled, either Enable it.
	outputChatBox("The input is now ".. (guiGetInputEnabled() and "Enabled" or "Disabled") ..".") -- Output the new Input state.
end
addCommandHandler("input",setInputState) -- Add the command handler attached to the function "setInputState".