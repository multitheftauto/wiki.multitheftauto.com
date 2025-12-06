function checkExistingFile(player, cmd, filename, resourcename)
	if (not filename) then -- if the player didn't include a filename
		player:outputChat("ERROR: Syntax '/checkfile filename resourcename(optional)'.") -- display error
		return false  -- stop function
	end

	if (not resourcename) then -- if the player didn't specify the resource he wants to check, use current resource
		resourcename = resource.name --every resource has a predefined global variable called resource that contains the resource pointer for that resource, in other words, the value that getThisResource() function returns.
	else
		if (not Resource.getFromName(resourcename)) then -- if a resource with that name doesn't exist, output error and stop function
			player:outputChat("ERROR: Resource "..resourcename.." doesn't exist.") -- output error message
			return false -- stop the function here
		end
	end

	-- as it hasn't stopped anywhere, we have both correct resourcename and filename
	local exists = File.exists((":%s/%s"):format(resourcename,filename)) -- using shorter format of string.format, see StringLibraryTutorial in lua wiki for that
	if (exists) then
		player:outputChat(("The file %q in resource %q exists"):format(filename,resourcename))
	else
		player:outputChat(("The file %q in resource %q doesn't exist"):format(filename,resourcename))
	end
end
addCommandHandler("exists",checkExistingFile)