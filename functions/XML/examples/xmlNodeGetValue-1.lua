local xmlFile = xmlLoadFile ( "exampleFile.xml" ) -- Open a file that we have already created
if xmlFile then -- If it's indeed opened
    local node = xmlFindChild( xmlFile, "somesubnode", 0 ) -- Find our first sub node
    local success = xmlNodeGetValue ( node ) -- Get the value of it
    xmlUnloadFile(xmlFile)
    if success then -- Check if it was successful
        outputChatBox ( tostring ( success ) ) -- Output "somevalue" to the chatbox
    end
end