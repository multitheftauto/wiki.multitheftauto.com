function fpsFunction(commandName, fpsLimit)
	local newFPS = tonumber(fpsLimit)

	if not newFPS then
		outputChatBox("Syntax: /" .. commandName .. " [FPS] - to limit your own FPS.")
		return false
	end

	if newFPS < minFPS or newFPS > maxFPS then
		outputChatBox("Please enter a value between " .. minFPS .. " and " .. maxFPS .. ".")
		return false
	end

	local currentLimit = getFPSLimit()
	local setNewFPS = (newFPS ~= currentLimit)

	if (setNewFPS) then
		outputChatBox("Your FPS have been limited to: " .. newFPS .. ".")
		setFPSLimit(newFPS)
	end
end
addCommandHandler("fpslimit", fpsFunction)