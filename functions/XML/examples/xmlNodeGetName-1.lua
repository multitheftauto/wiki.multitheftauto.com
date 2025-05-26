local xml = xmlCreateFile("test.xml","test")
if (not xml) then
    return
end

local xmlNode = xmlCreateChild(xml, "nextTest")
local xmlNodeName = xmlNodeGetName(xmlNode)
xmlUnloadFile(xml)

outputConsole(xmlNodeName) -- This should output "nextTest"