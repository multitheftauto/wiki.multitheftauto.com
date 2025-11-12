local playerSitState = {}

function toggleSit(thePlayer)
	local playerSitting = playerSitState[thePlayer]

	if (not playerSitting) then
		setPedAnimation(thePlayer, "ped", "seat_down", -1, false, false, false, false)
		playerSitState[thePlayer] = true -- store the player state in the table

		return true
	end

	setPedAnimation(thePlayer) -- if you use again this command then your character stand up
	playerSitState[thePlayer] = nil -- remove player sit state from table
end
addCommandHandler("sit", toggleSit)

function onPlayerQuitClearSitState()
	playerSitState[source] = nil -- clear state at player quit, to prevent memory leak
end
addEventHandler("onPlayerQuit", root, onPlayerQuitClearSitState)