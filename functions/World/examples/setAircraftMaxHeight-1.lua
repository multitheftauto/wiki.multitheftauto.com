function setAircraftHeight ( command, ve1 )
	local height = tonumber ( ve1 )
	if height then
		if height > 0 then
			local wert = setAircraftMaxHeight ( height )
			if wert == true then
				outputChatBox ( "Aircraft height set!", 0, 200, 0 )
			else
				outputChatBox ( "Error to set Aircraft height!", 255, 0, 0 )
			end
		else
			outputChatBox ( "Value must be above 0", 255, 0, 0 )
		end
	else
		outputChatBox ( "Error to set Aircraft height!", 255, 0, 0 )
	end
end
addCommandHandler ( "aircraft", setAircraftHeight )