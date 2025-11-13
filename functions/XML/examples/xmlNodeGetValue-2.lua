function ClientResourceStart ()
	if (source ~= getResourceRootElement()) then return end --This event will happen with any resource start, isolate it to this resource	
	xmlRootTree = xmlLoadFile ("userSettings.xml") --Attempt to load the xml file	

	if (xmlRootTree) then -- If the xml loaded then...
		xmlHudBranch = xmlFindChild(xmlRootTree,"hud_display",0) -- Find the hud sub-node
		xmlBindsBranch = xmlFindChild(xmlRootTree,"hud_binds",0) -- Find the binds sub-node
		outputChatBox("XML Found and Loaded")
	else -- If the xml does not exist then...
		xmlRootTree = xmlCreateFile("userSettings.xml", "root") -- Create the xml file	
		xmlHudBranch = xmlCreateChild(xmlRootTree, "hud_display") -- Create the hud sub-node under the root node
		xmlBindsBranch = xmlCreateChild(xmlRootTree, "hud_binds")-- Create the binds sub-node under the root node
		xmlNodeSetValue(xmlCreateChild(xmlHudBranch, "IconSizeX"), "60") --Create sub-node values under the hud sub-node
		xmlNodeSetValue(xmlCreateChild(xmlHudBranch, "IconSizeY"), "60") --Create sub-node values under the hud sub-node
		xmlNodeSetValue(xmlCreateChild(xmlBindsBranch, "weaponSlot0"), "tab") --Create sub-node values under the binds sub-node
		xmlNodeSetValue(xmlCreateChild(xmlBindsBranch, "weaponSlot1"), "1") --Create sub-node values under the binds sub-node
		outputChatBox("XML Created")
	end

	--Retrieve a single sub-node name or value
	outputChatBox("Node name: "..xmlNodeGetName(xmlFindChild(xmlHudBranch,"IconSizeX",0)), 0, 0, 255) --blue outputs
	outputChatBox("Node Value: "..xmlNodeGetValue(xmlFindChild(xmlHudBranch,"IconSizeX",0)), 0, 0, 255) --blue outputs
	
    --Retrieve multiple sub-node names or values	
	xmlHudChildrenTable = xmlNodeGetChildren(xmlHudBranch) --Create a table of this branch's children
	for i,node in pairs(xmlHudChildrenTable) do --Loop through the branch's children for sub-nodes
        outputChatBox("Node name: "..xmlNodeGetName(node), 0, 255, 0) --green outputs
        outputChatBox("Node Value: "..xmlNodeGetValue(node), 0, 255, 0) --green outputs
	end
end
addEventHandler("onClientResourceStart", root, ClientResourceStart)
 
function ClientResourceStop ()
	if (source ~= getResourceRootElement()) then return end --This event will happen with any resource stop, isolate it to this resource

	xmlSaveFile(xmlRootTree) --Save the xml from memory for use next time
	xmlUnloadFile(xmlRootTree) --Unload the xml from memory
	outputChatBox( "Saved and unloaded the XML.")
end
addEventHandler("onClientResourceStop", root, ClientResourceStop)