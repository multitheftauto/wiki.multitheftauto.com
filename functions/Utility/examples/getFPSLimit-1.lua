function checkFPSLimit()
	local fpsLimit = getFPSLimit()

	outputChatBox("The FPS limit is: "..fpsLimit)
end
addCommandHandler("checkfpslimit", checkFPSLimit) -- Add command "checkfpslimit" which calls the function checkFPSLimit