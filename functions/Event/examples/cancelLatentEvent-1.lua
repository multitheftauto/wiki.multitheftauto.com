-- *****************************************************************************
-- CLIENT CODE
addCommandHandler("cancelLatentEvent",
function ()
	triggerLatentServerEvent("exampleEvent",3000,false,localPlayer)
	local handles = getLatentEventHandles() -- Returns a table.
	local handle = handles[#handles] -- Get the latest handle.

	if cancelLatentEvent(handle) then -- Cancel it!
		outputChatBox("Successfully cancelled!",0,200,0)
	end
end)

-- *****************************************************************************
-- SERVER CODE
addEvent("exampleEvent",true)
addEventHandler("exampleEvent",root,
function ()
	outputChatBox("Warning! The triggerLatentServerEvent wasn't cancelled!",client,255,0,0) -- warn the user.
end)