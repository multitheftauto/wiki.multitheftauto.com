local marker = Marker(0, 0, 0, 5)

addCommandHandler('checkMarker', function(player)
    local isWithin = player:isWithinMarker(marker)
    if isWithin then
        player:outputChat("You are within the marker!")
    else
        player:outputChat("You are outside the marker.")
    end
end)