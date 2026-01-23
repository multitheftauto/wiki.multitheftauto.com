addCommandHandler("cancelLatentEvents",
function (player)
	local handles = getLatentEventHandles (player) -- Returns a table. 
	
	for index=1,#handles do -- Loop through the table.
		local handle = handles[index]
		cancelLatentEvent(player,handle) -- Cancel it!
	end
end)