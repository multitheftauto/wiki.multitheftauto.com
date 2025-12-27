function destroyVehiclesOfModel(modelID)
    -- get a table of all the vehicles that exist and loop through it
    local vehicles = Element.getAllByType("vehicle")
    for i, v in ipairs(vehicles) do
        -- if the vehicle's ID is the one provided, destroy it
        if (v.model == modelID) then
            v:destroy()
        end
    end
end

destroyVehiclesOfModel(445)
