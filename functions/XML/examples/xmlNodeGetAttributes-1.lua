local meta = xmlLoadFile("meta.xml")
local info = xmlFindChild(meta, "info", 0)

if (info) then
    local attrs = xmlNodeGetAttributes(info)
    for name,value in pairs(attrs) do
        outputConsole(name.." = "..value)
    end
end

xmlUnloadFile(meta)