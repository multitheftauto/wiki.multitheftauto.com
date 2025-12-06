addEventHandler("onResourceStart", getResourceRootElement(), function()
    local xml = xmlLoadFile("welcome.xml") -- open the XML file
    local messageNodes = xmlNodeGetChildren(xml) -- get all child nodes of the root node (<messages>)
    g_WelcomeMessages = {} -- create a new global variable to store the welcome messages
    for i, node in ipairs(messageNodes) do -- loop over all the message nodes
        g_WelcomeMessages[i] = xmlNodeGetValue(node) -- retrieve the text in each node
    end
    xmlUnloadFile(xml) -- close the XML file
end)

addEventHandler("onPlayerJoin", getRootElement(), function()
    local numMessages = #g_WelcomeMessages -- get the number of messages
    local message = g_WelcomeMessages[math.random(numMessages)] -- pick a random message
    outputChatBox(message, source, 0, 255, 0) -- display it to the joining player
end)
