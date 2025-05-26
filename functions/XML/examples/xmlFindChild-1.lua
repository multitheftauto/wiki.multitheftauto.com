local rootNode = xmlLoadFile("test.xml")
if (not rootNode) then
    return
end

local optionsNode = xmlFindChild(rootNode, "options", 0)
if (optionsNode) then
    local instructionsNode = xmlFindChild(optionsNode, "instructions", 0)

    if (instructionsNode) then
        local instructions = xmlNodeGetValue(instructionsNode)
        outputChatBox(instructions)
    end
end

xmlUnloadFile(rootNode)