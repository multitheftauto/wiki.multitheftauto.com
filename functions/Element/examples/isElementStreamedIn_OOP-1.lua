-- Create a marker at a specific position
local myMarker = Marker(0, 0, 3, "cylinder", 2, 255, 0, 0, 150)

-- Check if the marker is streamed in every second
setTimer(function(marker)
    if marker.streamedIn then
        outputChatBox("The marker is currently streamed in.")
    else
        outputChatBox("The marker is not streamed in.")
    end
end, 1000, 0, myMarker)