local xmlFile = XML.load("exampleFile.xml") -- Open a file that we have already created
if (xmlFile) then -- If it's indeed opened
    local node = xmlFile:findChild("somesubnode", 0) -- Find our first sub node
    local success = node.value -- Get the value of it
    xmlFile:unload()

    if (success) then -- Check if it was successful
        outputChatBox (tostring(success)) -- Output "somevalue" to the chatbox
    end
end