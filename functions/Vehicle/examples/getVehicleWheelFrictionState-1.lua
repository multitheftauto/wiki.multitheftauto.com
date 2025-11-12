addEventHandler("onClientRender", root, function ()
    local veh = getPedOccupiedVehicle (localPlayer)
    
    if not veh then
        return false
    end
    
    dxDrawRectangle (0, 0, 300, 140, tocolor (0, 0, 0, 150))
    dxDrawText ("FRICTION FRONT LEFT = ".. getVehicleWheelFrictionState (veh, 0), 8, 10, 290, 40, tocolor (255, 255, 255), 1.5)
    dxDrawText ("FRICTION FRONT RIGHT = ".. getVehicleWheelFrictionState (veh, 2), 8, 40, 290, 70, tocolor (255, 255, 255), 1.5)
    dxDrawText ("FRICTION REAR LEFT = ".. getVehicleWheelFrictionState (veh, 1), 8, 70, 290, 100, tocolor (255, 255, 255), 1.5)
    dxDrawText ("FRICTION REAR RIGHT = ".. getVehicleWheelFrictionState (veh, 3), 8, 100, 290, 130, tocolor (255, 255, 255), 1.5)
end)