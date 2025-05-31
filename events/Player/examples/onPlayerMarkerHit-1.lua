addEventHandler('onPlayerMarkerHit', root, function(marker, matchingDimension)
    if not matchingDimension then return end -- checks if the dimension of the player who activated the marker is the same as the one the marker is in (in this case, if not, it will stop here)
    outputChatBox('You have just entered a marker!', source, 255, 255, 0) -- output something
end)