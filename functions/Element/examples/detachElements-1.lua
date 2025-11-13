function attachMarkerToVehicle ( theVehicle )
    -- create the marker to attach
    local arrowMarker = createMarker ( 0, 0, 0, "arrow", 1.5, 0, 0, 255, 255 )
    -- attach the marker above the vehicle
    attachElements ( arrowMarker, theVehicle, 0, 0, 2 )
    -- add an event handler for when the vehicle blows up
    addEventHandler ( "onVehicleExplode", theVehicle, onMarkedCarExplode )
end

function onMarkedCarExplode ()
    -- get the elements attached to the vehicle
    local attachedElements = getAttachedElements ( source )
    -- loop through the table of elements
    for i,v in ipairs ( attachedElements ) do
        -- detach the element from the vehicle
        detachElements ( v, source )
    end
    -- remove the event handler
    removeEventHandler ( "onVehicleExplode", source, onMarkedCarExplode )
end