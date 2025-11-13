-- Cancel all my triggerLatentClientEvent's.
addCommandHandler("cancelLatentEvents",
function (player)

	-- Get all active handles from the player that executed the command: /cancelLatentEvents
	local handles = getLatentEventHandles (player) -- Returns a table. 
	
	for index=1,#handles do -- Loop through the table.
		local handle = handles[index]
		cancelLatentEvent(player,handle) -- Cancel it!
	end
end)