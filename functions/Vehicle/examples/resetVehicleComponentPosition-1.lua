addEventHandler("onClientVehicleEnter", getRootElement(),
 function(player,seat)
    local getComponent = getVehicleComponents(source) -- returns table with all the components of the vehicle
    for k in pairs (getComponent) do
       local x, y, z = getVehicleComponentPosition(source, k) --get the position of the component
       setVehicleComponentPosition(source, k, x+1, y+1, z+1) -- increases by 1 unit
    end
 end
)
 
addEventHandler("onClientVehicleExit", getRootElement(),
 function(player, seat)
    local getComponent = getVehicleComponents(source) -- returns table with all the components of the vehicle
    for k in pairs (getComponent) do
       resetVehicleComponentPosition(source, k) -- resets the position of the component
    end
 end
)