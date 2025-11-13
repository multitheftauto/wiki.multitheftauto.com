function changeConfigMarkerColor(thePlayer, command, r, g, b)
    local config = xmlLoadFile("config.xml")
    if (not config) then
        return
    end

    local markernode = xmlFindChild(config, "markers", 0)
    if (markernode) then
        xmlNodeSetAttribute(markernode, "color", r .. "," .. g .. "," .. b)
        xmlNodeSetAttribute(markernode, "foo", nil) -- remove 'foo' attribute
    end

    xmlSaveFile(config)
    xmlUnloadFile(config)
end
addCommandHandler("markercolor", changeConfigMarkerColor)