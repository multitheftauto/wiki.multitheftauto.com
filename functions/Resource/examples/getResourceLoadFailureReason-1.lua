for _,v in ipairs(getResources())do --loop through all the resources
	if getResourceState(v)=="failed to load" then --check if it failed to load
		outputChatBox("Resource: "..getResourceName(v).." failed to load because: "..getResourceLoadFailureReason(v)..".") --output why it didn't load
	end
end