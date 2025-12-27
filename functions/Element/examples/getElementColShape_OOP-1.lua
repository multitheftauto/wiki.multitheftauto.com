local theMarker = Marker(-687.9, 937.8, 13.6, "cylinder", 2.0, 255, 0, 0, 80) -- create a red cylinder marker inside Toreno's house

function checkOnMarker(thePlayer)
    local isIn = isPlayerInMarker(thePlayer, theMarker) -- use the function to check if player is in the marker
    if isIn then
        thePlayer:outputChat("You are on the marker.")
    else
        thePlayer:outputChat("You are not on the marker.")
    end
end
addCommandHandler("amionmarker", checkOnMarker)

-- define the isPlayerInMarker function
function isPlayerInMarker(thePlayer, theMarker)
    local theShape = theMarker.colShape -- get markers colshape
    return thePlayer:isWithinColShape(theShape) -- check if the player is in it
end
