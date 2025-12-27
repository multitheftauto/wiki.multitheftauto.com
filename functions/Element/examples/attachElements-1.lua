-- create the vehicle
local vehicleMrWhoopee = createVehicle(423, 237.472, -54.225, 1.518, 0, 354.488, 0)

function onMrWhoopeeEnter(thePlayer, seat, jackedPlayer)
    outputChatBox(getPlayerName(thePlayer) .. " stole the Whoopee!", root, 255, 0, 0)
    -- create the marker to attach
    local arrowMarker = createMarker(0, 0, 0, "arrow", .75, 255, 0, 0, 170)
    -- attach the marker to the player with a vertical offset of 2 units
    attachElements(arrowMarker, thePlayer, 0, 0, 2)
end

-- attach it to an event
addEventHandler("onVehicleEnter", vehicleMrWhoopee, onMrWhoopeeEnter)
