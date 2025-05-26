local xml = xmlLoadFile("config.xml")
if (not xml) then
    return
end

local markernode = xmlFindChild(xml, "markers", 0)
xmlNodeSetAttribute(markernode, "color", "0,0,200")

xmlSaveFile(xml)
xmlUnloadFile(xml)