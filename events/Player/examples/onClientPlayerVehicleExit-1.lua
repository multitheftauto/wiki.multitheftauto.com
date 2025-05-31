addEventHandler("onClientPlayerVehicleExit", getRootElement(),

function (vehicle, seat)

local vehicleName = getVehicleName(vehicle)
outputChatBox("Player " .. getPlayerName(source) .. " has left the " .. vehicleName)

end)