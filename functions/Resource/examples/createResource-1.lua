function createNewResource ( source, command, resourceName ) -- Define the source and add a resourceName argument.
	if ( resourceName ) then -- Check if they entered a resource name, and if they did...
		local resourceName = tostring ( resourceName ) -- Convert the name into a string.
		local newResource = createResource ( resourceName ) -- Create the new resource.
			if ( newResource ) then -- Check if the resource has been created, if so then...
				outputChatBox ( "New resource created succcessfully.", source, 255, 0, 0 ) -- Output it's done.
			else -- If the resource wasn't made successfully then...
				outputChatBox ( "An un-expected error occured.", source, 255, 0, 0 ) -- Output it failed.
			end
	else -- If they didn't enter a resource name...
		outputChatBox ( "Please specify a name for your new resource.", source, 255, 0, 0 ) -- Tell them to specify a name.
	end
end
addCommandHandler ( "new-resource", createNewResource ) -- Make it trigger when somebody types "/new-resource <name>".