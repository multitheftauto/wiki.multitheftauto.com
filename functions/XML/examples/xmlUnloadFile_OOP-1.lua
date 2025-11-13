local xml = XML.load("config.xml")
if (not xml) then
    return
end

local markernode = xml:findChild("markers", 0)
markernode:setAttribute("color", "0,0,200")

xml:saveFile()
xml:unload()