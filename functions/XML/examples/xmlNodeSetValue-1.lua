local xmlFile = xmlLoadFile ( "exampleFile.xml" ) -- Open a file already created
if xmlFile then -- If it's indeed opened
    local node = xmlCreateChild ( xmlFile, "somesubnode" ) -- Create a new subnode
    local success = xmlNodeSetValue ( node, "somevalue" ) -- Set the value of it
    if success then -- Check if it was successful
        xmlSaveFile ( xmlFile ) -- Save the file
    end
    xmlUnloadFile(xmlFile)
end