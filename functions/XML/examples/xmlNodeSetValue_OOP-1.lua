local xmlFile = XML.load("exampleFile.xml") -- Open a file already created
if (xmlFile) then -- If it's indeed opened
    local node = xmlFile:createChild("somesubnode") -- Create a new subnode
    local success = node.value = "somevalue" -- Set the value of it
    
    if (success) then -- Check if it was successful
        xmlFile:saveFile() -- Save the file
    end
    xmlFile:unload()
end