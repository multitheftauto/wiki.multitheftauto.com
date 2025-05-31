frozen = false -- This variable stores whether or not the script is going to freeze them.
-- If they were already frozen then don't unfreeze them when the interruption ends to avoid conflicts with other scripts.
function handleInterrupt( status, ticks )
	if (status == 0) then
		outputDebugString( "(packets from server) interruption began " .. ticks .. " ticks ago" )
		if (not isElementFrozen(localPlayer)) then
			setElementFrozen(localPlayer, true) -- Freeze them to prevent them abusing the network interruption
			frozen = true
		end
	elseif (status == 1) then
		outputDebugString( "(packets from server) interruption began " .. ticks .. " ticks ago and has just ended" )
		if (frozen) then
			setElementFrozen(localPlayer, false) -- If we froze them, unfreeze them now.
			frozen = false
		end
	end
end
addEventHandler( "onClientPlayerNetworkStatus", root, handleInterrupt)