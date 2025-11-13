local xml = XML("test.xml","test")
if (not xml) then
    return
end

local xmlNode = xml:createChild("nextTest")
local xmlNodeName = xmlnode.name
xml:unload()

outputConsole(xmlNodeName) -- This should output "nextTest"