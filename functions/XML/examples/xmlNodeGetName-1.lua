local xml = xmlCreateFile("test.xml","test")
local xmlNode = xmlCreateChild(xml,"nextTest")
local xmlNodeName = xmlNodeGetName(xmlNode)
xmlUnloadFile(xml)
outputConsole(xmlNodeName) --This should output "nextTest".