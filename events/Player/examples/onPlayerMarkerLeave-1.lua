-- Create our marker
marker = createMarker(1248,2012,123,"corona",7,255,255,255,255)

function someoneLeftMarker(markerLeft,matchingDimension)
   -- Output our message
   outputChatBox(getPlayerName(source).." has left the marker!",getRootElement(),255,0,0)
end
-- Add an event handler to trigger our function
addEventHandler("onPlayerMarkerLeave",marker,someoneLeftMarker)