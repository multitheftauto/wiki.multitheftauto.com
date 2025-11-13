addEventHandler("onResourceStart", resourceRoot, function()
	outputConsole(ACLGroup.get("Admin").name.."'s are ready to watch :)",root)
end)