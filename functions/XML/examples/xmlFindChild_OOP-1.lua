local rootNode = XML.load("test.xml")
if (not rootNode) then
    return
end

local optionsNode = rootNode:findChild("options", 0)
if (optionsNode) then
    local instructionsNode = optionsNode:findChild("instructions", 0)

    if (instructionsNode) then
        local instructions = instructionsNode.value
        outputChatBox(instructions)
    end
end

rootNode:unload()