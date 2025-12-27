addEventHandler("onVehicleExit", getRootElement(), function(thePlayer)
    source:removeDataSubscriber("id", thePlayer)
end)
