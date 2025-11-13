addCommandHandler("checknitro",function ()
    local pedVeh = getPedOccupiedVehicle(localPlayer)
    if pedVeh then
        if isVehicleNitroRecharging(pedVeh) then
            outputChatBox("Your vehicle's nitro is recharging.",255,255,0)
        end
    end
end)