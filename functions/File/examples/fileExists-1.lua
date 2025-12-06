function checkExistingFile(player, cmd, filename, resourcename)
	if not filename then -- if the player didn't include a filename
		outputChatBox("ERROR: Syntax '/checkfile filename resourcename(optional)'.",player) -- display error
		return false  -- stop function
	end

	if not resourcename then -- if the player didn't specify the resource he wants to check, use current resource
		resourcename = getResourceName(resource) --every resource has a predefined global variable called resource that contains the resource pointer for that resource, in other words, the value that getThisResource() function returns.
	else
		if not getResourceFromName(resourcename) then -- if a resource with that name doesn't exist, output error and stop function
			outputChatBox("ERROR: Resource "..resourcename.." doesn't exist.",player) -- output error message
			return false -- stop the function here
		end
	end
	
	-- as it hasn't stopped anywhere, we have both correct resourcename and filename
	local exists = fileExists((":%s/%s"):format(resourcename,filename)) -- using shorter format of string.format, see StringLibraryTutorial in lua wiki for that
	if exists then
		outputChatBox(("The file %q in resource %q exists"):format(filename,resourcename), player)
	else
		outputChatBox(("The file %q in resource %q doesn't exist"):format(filename,resourcename), player)
	end
end
addCommandHandler("exists",checkExistingFile)