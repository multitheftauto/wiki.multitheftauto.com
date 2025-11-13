addEvent("exampleEvent",true)
addEventHandler("exampleEvent",root,
function ()
	outputChatBox("Warning! The triggerLatentServerEvent wasn't cancelled!",client,255,0,0) -- warn the user.
end)