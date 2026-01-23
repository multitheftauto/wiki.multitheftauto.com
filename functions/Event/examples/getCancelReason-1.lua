function stopVehicleEntry(theplayer, seat, jacked)
    cancelEvent(true, "You can't enter a vehicle during war.") -- stop the event from occuring and tell the player the reason.
    outputConsole("We told " .. getPlayerName(theplayer) .. ": " .. getCancelReason()) -- Now tell everyone what the player tried to do
end
addEventHandler("onVehicleStartEnter", huntedPlayer, stopVehicleEntry)
