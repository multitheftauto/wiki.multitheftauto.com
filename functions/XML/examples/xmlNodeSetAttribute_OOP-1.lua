function changeConfigMarkerColor(thePlayer, command, r, g, b)
    local config = XML.load("config.xml")
    if (not config) then
        return
    end

    local markernode = config:findChild("markers", 0)
    if (markernode) then
        markernode:setAttribute("color", r .. "," .. g .. "," .. b)
        markernode:setAttribute("foo", nil) -- remove 'foo' attribute
    end

    config:saveFile()
    config:unload()
end
addCommandHandler("markercolor", changeConfigMarkerColor)