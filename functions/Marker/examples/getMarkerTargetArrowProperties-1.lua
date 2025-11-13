addEventHandler("onClientResourceStart", resourceRoot, function()

    local myMarker = createMarker(0, 0, 3, "checkpoint", 2.0, 255, 0, 0, 150)


    setMarkerTarget(myMarker, 10, 0, 3)


    local r, g, b, a, size = getMarkerTargetArrowProperties(myMarker)

    if r then
        outputChatBox("Marker Target Arrow Properties:")
        outputChatBox("Color: R=" .. r .. " G=" .. g .. " B=" .. b)
        outputChatBox("Alpha: " .. a)
        outputChatBox("Size: " .. size)
    else
        outputChatBox("Error: Could not retrieve marker target arrow properties.")
    end
end)