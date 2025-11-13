function startTheResource ( thePlayer, command, resourceName )
	if ( resourceName ) then -- Check if they specified a resource name
		local resource = getResourceFromName ( resourceName ) -- Get the resource
		
		local start = startResource ( resource ) -- Start the resource
		if ( start ) then -- If it was successfully started...
			outputChatBox ( resourceName .. " was started successfully.", thePlayer, 255, 0, 0 )
		else -- If it wasn't successfully started...
			outputChatBox ( "This resource doesn't exist.", thePlayer, 255, 0, 0 )
		end
	else -- If they didn't put a resource name...
		outputChatBox ( "Please specify a resource to start.", thePlayer, 255, 0, 0 )
	end
end
addCommandHandler ( "resource-start", startTheResource ) -- Make it trigger when somebody types "/resource-start"