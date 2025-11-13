function removeAllObservers ( player , command )
	local tObservers = textDisplayGetObservers ( serverDisplay ) -- get a table of all observers in 'serverDisplay' text display
	if tObservers then -- if got the table
		for index,player in ipairs ( tObservers ) do -- loop the table
			textDisplayRemoveObserver ( serverDisplay , player ) -- remove the player from the text display
		end
	end
end
addCommandHandler("removeAllObservers",removeAllObservers)