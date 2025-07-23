local xml = XML("fileName.xml","Test")
if (not xml) then
    return
end

local xmlNode = xml:createChild("Test1")
local xmlNodeName = xmlNode.name
if (xmlNodeName == "Test1") then
   xmlNode.name = "Test2" -- or xmlNode:setName("Test2")
end

xml:unload()