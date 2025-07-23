addEventHandler("onResourceStart", getResourceRootElement(),
    function()
        local xml = XML.load("welcome.xml")             -- open the XML file
        local messageNodes = xml.children       -- get all child nodes of the root node (<messages>)
        g_WelcomeMessages = {}                             -- create a new global variable to store the welcome messages
        for i,node in ipairs(messageNodes) do              -- loop over all the message nodes
            g_WelcomeMessages[i] = node.value   -- retrieve the text in each node
        end
        xml:unload()                                 -- close the XML file
    end
)

addEventHandler("onPlayerJoin", getRootElement(),
    function()
        local numMessages = #g_WelcomeMessages                        -- get the number of messages
        local message = g_WelcomeMessages[math.random(numMessages)]   -- pick a random message
        source:outputChat(message, 0, 255, 0)                     -- display it to the joining player
    end
)