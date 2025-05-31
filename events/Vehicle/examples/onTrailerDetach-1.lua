function reattachTrailer(theTruck)
    attachTrailerToVehicle(theTruck, source) -- Reattach the truck and trailer
end

addEventHandler("onTrailerDetach", getRootElement(), reattachTrailer)