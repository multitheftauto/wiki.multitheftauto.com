-- Cancel triggerLatentServerEvent directly after execution.
addCommandHandler("cancelLatentEvent",
function ()
	triggerLatentServerEvent("exampleEvent",3000,false,localPlayer)

	-- Get all your active handles, when you executed the command: /cancelLatentEvent
	local handles = getLatentEventHandles() -- Returns a table.

	local handle = handles[#handles] -- Get the latest handle.

	if cancelLatentEvent(handle) then -- Cancel it!
		outputChatBox("Successfully cancelled!",0,200,0)
	end
end)