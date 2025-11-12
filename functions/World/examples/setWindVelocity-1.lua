local function windVelocityCommand(_, x, y, z)
	-- Ensure all arguments are valid (default to 0 otherwise)
	x = tonumber(x) or 0
	y = tonumber(y) or 0
	z = tonumber(z) or 0
	
	-- Set the wind velocity, and inform the user of the change.
	setWindVelocity(x, y, z)
	outputChatBox("* Wind velocity set to ("..x..", "..y..", "..z..").", 0, 255, 0)
end
addCommandHandler("windVelocity", windVelocityCommand)