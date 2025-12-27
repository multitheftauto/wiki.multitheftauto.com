function destroyVehiclesOfModel(modelID)
    -- get a table of all the vehicles that exist and loop through it
    local vehicles = getElementsByType("vehicle")
    for i, v in ipairs(vehicles) do
        -- if the vehicle's ID is the one provided, destroy it
        if (getElementModel(v) == modelID) then
            destroyElement(v)
        end
    end
end

destroyVehiclesOfModel(445)
