local rootNode = XML.loadstring("<animals test='x'><wolf name='timmy'></wolf> <fox name='luxy'></fox></animals>")

if rootNode then
	local rootAttributes = rootNode.attributes
	print("Root Node", "Name: "..rootNode.name,  "Attributes :"..toJSON(rootAttributes))
	
	local children = rootNode.children
	
	for i, childNode in ipairs(children) do
		local attributes = childNode.attributes
		print("Child #"..i, "Name: "..childNode.name, "Attributes :"..toJSON(attributes))
	end
end