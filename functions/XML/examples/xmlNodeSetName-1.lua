local xml = xmlCreateFile("fileName.xml","Test")
if (not xml) then
    return
end

local xmlNode = xmlCreateChild(xml,"Test1")
local xmlNodeName = xmlNodeGetName(xmlNode)
if (xmlNodeName == "Test1") then
   xmlNodeSetName(xmlNode, "Test2")
end

xmlUnloadFile(xml)