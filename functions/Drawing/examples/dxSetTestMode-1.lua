local testValues = {
	["none"] = true,
	["no_mem"] = true,
	["low_mem"] = true,
	["no_shader"] = true
}

function testmode( cmd, value )
	if testValues[value] then
		dxSetTestMode( value )
		outputChatBox( "Test mode set to " .. value .. ".", 220, 175, 20, false )
	else
		outputChatBox( "Invalid test mode entered.", 245, 20, 20, false )
	end
end
addCommandHandler( "setmode", testmode )