function nextCheck(thePlayer)
	local x,y,z = getMarkerTarget(source)    -- get the marker target
	if x ~= false then                       -- if a target is set for the marker, then...
		outputChatBox("Next checkpoint at: " .. x .. " " .. y .. " " .. z, thePlayer) -- output a message with the coordinates
	end
end
addEventHandler("onMarkerHit", root, nextCheck) -- add an event handler for the 'onMarkerHit' event