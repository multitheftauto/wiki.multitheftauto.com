addEventHandler("onClientResourceStart", resourceRoot, function()
	local theObject = createObject(980, 0, 0, 0) -- create an object
	if theObject then
		setObjectProperty(theObject, "center_of_mass", 0, -1, 0) -- set its center of mass

		local x, y, z = getObjectProperty(theObject, "center_of_mass") -- get its center of mass
		outputChatBox("Object's center of mass: "..tostring(x)..", "..tostring(y)..", "..tostring(z))
	end
end)