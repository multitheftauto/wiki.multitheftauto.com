function netStatus()
	for index, value in pairs(getNetworkStats()) do
		outputConsole(index..": "..value)
	end
	outputChatBox("Network status output to console", 0, 255, 0)
end
addCommandHandler("netstatus", netStatus)