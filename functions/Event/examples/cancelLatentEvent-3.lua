addCommandHandler("cancelLatentEvents",
function ()
	local handles = getLatentEventHandles () -- Returns a table. 
	
	for index=1,#handles do -- Loop through the table.
		local handle = handles[index] 
		cancelLatentEvent(handle) -- Cancel it!
	end
end)