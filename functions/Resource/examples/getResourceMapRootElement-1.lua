-- We have 2 map files in our meta.xml: island_1.map, island_2.map.
-- These maps contains objects, vehicles, pickups, etc.
-- After resource start we must found all vehicles only from island_1.map and lock them.

-- `resourceRoot` is predefined script variable containing current resource root pointer
addEventHandler( 'onResourceStart', resourceRoot,
    function()
        -- `resource` is predefined script variable containing current resource pointer
        local island_1_mapRoot = getResourceMapRootElement( resource, 'island_1.map' )
        local island_1_vehicles = getElementsByType( 'vehicle', island_1_mapRoot )
        
        for vehicle in ipairs(island_1_vehicles) do
            setVehicleLocked( vehicle, true )
        end
    end
)