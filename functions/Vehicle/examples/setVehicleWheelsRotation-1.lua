addEventHandler("onClientVehicleEnter", root,
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
        if setVehicleWheelsRotation(theVeh, 0) then 
            outputChatBox("SET OK")
        else
            outputChatBox("SET FAILED")
        end
    end
)

addEventHandler("onClientPreRender", root, function()
    local theVeh = getPedOccupiedVehicle(localPlayer)
    if theVeh then
        setVehicleWheelsRotation(theVeh, 0)
        -- also do it for trailer
        local trailer = getVehicleTowedByVehicle(theVeh)
        if trailer then
            setVehicleWheelsRotation(trailer, 0)
        end
    end
end)