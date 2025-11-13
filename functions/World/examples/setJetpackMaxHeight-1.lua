function setMyMaxHeight ( cmd, value )
	local height = tonumber ( value ) -- Get the number of the value
	if height > -20 then -- If the height is higher than -20
		local succes = setJetpackMaxHeight ( height ) -- Set the maximum height
		if succes then -- If it's succesfully changed
			outputChatBox ( "You've set you maximum jetpack height to "..height.."!", 0, 255, 0 ) -- Send the client a succes message
		else -- If there was something wrong
			outputChatBox ( "Failed to set your maximum jetpack height to "..height.."!", 255, 0, 0 ) -- Send the client an error message
		end
	else -- If the given value was below -20
		outputChatBox ( "Failed to change you jetpack height! Please use a number above -20." , 255, 0, 0 ) -- Send the client an error message
	end
end
addCommandHandler ( "maxheight", setMyMaxHeight ) -- Add the command handler