serverDisplay = textCreateDisplay()  -- create a text display
serverText = textCreateTextItem ( "Hello world!", 0.5, 0.5 ) -- create a text item for the display
textDisplayAddText ( serverDisplay, serverText )  -- add it to the display so it is displayed

function showTextDisplay ( player, command )
	local isObserver = textDisplayIsObserver ( serverDisplay , player ) -- check if he is already a observer in the server display
	if not isObserver then -- if he is not an observer
		textDisplayAddObserver ( serverDisplay, player ) -- make it visible to a player
	end
end
addCommandHandler( "showText", showTextDisplay )

function removeTextDisplay ( player , command )
	local isObserver = textDisplayIsObserver ( serverDisplay , player ) -- check if he is already a observer in the server display
	if isObserver then -- if he is an observer
		textDisplayRemoveObserver ( serverDisplay , player ) -- remove the player from display
	end
end
addCommandHandler( "removeText",removeTextDisplay)