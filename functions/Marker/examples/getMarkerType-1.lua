function createMarkerAndOutputType ( ... )
    -- we create the marker.
    local theMarker = createMarker ( ... )
    -- if the marker was created.
    if isElement ( theMarker ) then
        -- then get its type.
        local markerType = getMarkerType ( theMarker )
        -- and output it.
        return outputChatBox ( "It's a " .. markerType .. " marker!" )
    end
end

-- Create a marker and show its type in chat.
createMarkerAndOutputType(0, 0, 2, "cylinder", 2)