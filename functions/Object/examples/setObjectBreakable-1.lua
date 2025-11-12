function toggleObjectVulnerability()
	local object = createObject(1337, 5540.6654, 1020.55122, 1240.545)
	if isObjectBreakable(object) then
		setObjectBreakable(object, false)
		outputChatBox("The object is now not breakable.")
	else
		setObjectBreakable(object, true)
		outputChatBox("The object is now breakable.")
	end
end
addEventHandler("onClientResourceStart", resourceRoot, toggleObjectVulnerability)