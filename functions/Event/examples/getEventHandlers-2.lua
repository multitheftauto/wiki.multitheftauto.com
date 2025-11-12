local events = getEventHandlers ( "onClientMarkerHit", resourceRoot )
for i,v in ipairs(events) do 
    removeEventHandler ( "onClientMarkerHit", resourceRoot, v) 
end