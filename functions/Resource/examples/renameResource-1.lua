function renameReloadResource()
	renameResource("reload", "reload2");
end
addEventHandler("onResourceStart", resourceRoot, renameReloadResource);