local meta = XML.load("meta.xml")
local info = meta:findChild("info", 0)

if (info) then
    local attrs = info.attributes
    for name,value in pairs (attrs) do
        outputConsole(name.." = "..value)
    end
end

meta:unload()