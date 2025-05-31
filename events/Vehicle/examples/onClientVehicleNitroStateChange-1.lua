function nitro_updateState(state)    
    if state then
        outputChatBox("Nitro #00FF00activated!", 255, 200, 0, true)
    elseif not state then
        outputChatBox("Nitro #FF0000deactivated!", 255, 200, 0, true)
    end
end   
addEventHandler("onClientVehicleNitroStateChange", root,  nitro_updateState)