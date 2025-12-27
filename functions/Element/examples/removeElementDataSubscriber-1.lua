addEventHandler("onVehicleExit", getRootElement(), function(thePlayer)
    removeElementDataSubscriber(source, "id", thePlayer)
end)
