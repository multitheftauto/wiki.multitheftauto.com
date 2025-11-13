local xml = xmlCreateFile("fileName.xml","Test")
local xmlNode = xmlCreateChild(xml,"Test1")
local xmlNodeName = xmlNodeGetName(xmlNode)
xmlUnloadFile(xml)
if xmlNodeName == "Test1" then
   xmlNodeSetName(xmlNode, "Test2")
end