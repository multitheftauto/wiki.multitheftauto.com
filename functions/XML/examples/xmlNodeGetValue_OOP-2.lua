function ClientResourceStart ()
    if (source ~= resourceRoot) then return end --This event will happen with any resource start, isolate it to this resource	
    xmlRootTree = XML.load ("userSettings.xml") --Attempt to load the xml file	

    if (xmlRootTree) then -- If the xml loaded then...
        xmlHudBranch = xmlRootTree:findChild("hud_display",0) -- Find the hud sub-node
        xmlBindsBranch = xmlRootTree:findChild("hud_binds",0) -- Find the binds sub-node
        outputChatBox("XML Found and Loaded")
    else -- If the xml does not exist then...
        xmlRootTree = XML("userSettings.xml", "root") -- Create the xml file	
        xmlHudBranch = xmlRootTree:createChild("hud_display") -- Create the hud sub-node under the root node
        xmlBindsBranch = xmlRootTree:createChild("hud_binds")-- Create the binds sub-node under the root node

        xmlHudBranch:createChild("IconSizeX").value = "60" --Create sub-node values under the hud sub-node
        xmlHudBranch:createChild("IconSizeY").value = "60" --Create sub-node values under the hud sub-node
        xmlBindsBranch:createChild("weaponSlot0").value = "tab" --Create sub-node values under the binds sub-node
        xmlBindsBranch:createChild("weaponSlot1").value = "1" --Create sub-node values under the binds sub-node
        outputChatBox("XML Created")
    end

    --Retrieve a single sub-node name or value
    outputChatBox("Node name: "..xmlHudBranch:findChild("IconSizeX",0).name, 0, 0, 255) --blue outputs
    outputChatBox("Node Value: "..xmlHudBranch:findChild("IconSizeX",0).value, 0, 0, 255) --blue outputs
	
    --Retrieve multiple sub-node names or values	
    xmlHudChildrenTable = xmlHudBranch.children --Create a table of this branch's children
    for i,node in pairs(xmlHudChildrenTable) do --Loop through the branch's children for sub-nodes
        outputChatBox("Node name: "..node.name, 0, 255, 0) --green outputs
        outputChatBox("Node Value: "..node.value, 0, 255, 0) --green outputs
    end
end
addEventHandler("onClientResourceStart", root, ClientResourceStart)
 
function ClientResourceStop ()
    if (source ~= resourceRoot) then return end --This event will happen with any resource stop, isolate it to this resource

    xmlRootTree:saveFile() --Save the xml from memory for use next time
    xmlRootTree:unload() --Unload the xml from memory
    outputChatBox( "Saved and unloaded the XML.")
end
addEventHandler("onClientResourceStop", root, ClientResourceStop)