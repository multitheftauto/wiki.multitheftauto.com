local rootNode = xmlLoadString("<animals test='x'><wolf name='timmy'></wolf> <fox name='luxy'></fox></animals>")

if rootNode then
	local rootAttributes = xmlNodeGetAttributes(rootNode)
	print("Root Node", "Name: "..xmlNodeGetName(rootNode),  "Attributes :"..toJSON(rootAttributes))
	
	local children = xmlNodeGetChildren(rootNode)
	
	for i, childNode in ipairs(children) do
		local attributes = xmlNodeGetAttributes(childNode)
		print("Child #"..i, "Name: "..xmlNodeGetName(childNode), "Attributes :"..toJSON(attributes))
	end
end