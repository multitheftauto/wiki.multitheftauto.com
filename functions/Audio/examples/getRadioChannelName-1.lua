addCommandHandler("getradio", function()
	local radio = getRadioChannelName(getRadioChannel())
	outputChatBox("You're currently listening to "..radio.."!")
end)