addEventHandler("onResourceStart",resourceRoot,function()
	resource = getResourceFromName("sx_resmanager")
	removeResourceFile(resource,"description.txt")
end)