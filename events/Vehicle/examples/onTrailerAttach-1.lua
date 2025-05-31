function detachTrailer(theTruck)
    --detachTrailerFromVehicle(theTruck, source) --detach the newly attached trailer
    -- Immediate detatchment of the trailer through cancel event or this method doesn't seem to work so requires a timer:
    setTimer(detachTrailer2, 50, 1, theTruck, source)
end
addEventHandler("onTrailerAttach", getRootElement(), detachTrailer)

function detachTrailer2(theTruck, trailer)
    if (isElement(theTruck) and isElement(trailer)) then
        detachTrailerFromVehicle(theTruck, trailer)
    end
end