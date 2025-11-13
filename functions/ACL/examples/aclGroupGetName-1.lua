addEventHandler("onResourceStart", resourceRoot, function()
	outputConsole(aclGroupGetName(aclGetGroup("Admin")).."'s are ready to watch :)",root)
end)