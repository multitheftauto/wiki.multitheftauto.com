-- CLIENT SIDE:

local lastTriggerd = false 

addCommandHandler("trigger",function()
	local triggers = getLatentEventHandles() -- get all latent events
	if triggers[lastTriggerd] then -- you can use (getLatentEventStatus) too!
		outputChatBox("Wait until the trigger ("..lastTriggerd..") ends!",255,0,0)
		return 
	end 
	triggerLatentServerEvent("LatentEventsCheck",20000,resourceRoot,localPlayer)
	lastTriggerd = #getLatentEventHandles() -- set the lastTriggerd with the id for last event triggerd
end)

-- SERVER SIDE:

addEvent("LatentEventsCheck",true)
addEventHandler("LatentEventsCheck",root,function (thePlayer)
	outputChatBox("Latent trigger done from: " .. getPlayerName(thePlayer), root,math.random(255),0,0) 
end)