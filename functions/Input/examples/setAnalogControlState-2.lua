addEventHandler("onClientPreRender", root,
    function()
        local right = getAnalogControlState("vehicle_right", true)
        local left = getAnalogControlState("vehicle_left", true)
        
        if right > left then
            setAnalogControlState("vehicle_left", right, true)
        else
            setAnalogControlState("vehicle_right", left, true)
        end
    end
)