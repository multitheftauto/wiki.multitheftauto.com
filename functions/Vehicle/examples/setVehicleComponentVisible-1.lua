addEventHandler("onClientVehicleEnter", getRootElement(),
    function()
        local getComponent = getVehicleComponents(source) -- get a table with all the components of the vehicle
        for k in pairs (getComponent) do
            setVehicleComponentVisible(source, k, false) -- hides the component
        end
    end
)