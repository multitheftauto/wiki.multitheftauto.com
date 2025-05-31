function notifyAboutExplosion()
    -- source is the element that triggered the event and can be used in other events as well
    outputChatBox(getVehicleName(source) .. " just blew up")
end

-- by using root, it will work for any vehicle (even if it wasn't created via this resource)
addEventHandler("onVehicleExplode", root, notifyAboutExplosion)