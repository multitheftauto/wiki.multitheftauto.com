addEventHandler("onClientVehicleEnter", getRootElement(),
 function(player,seat)
    local getComponent = getVehicleComponents(source) -- returns table with all the components of the vehicle
    for k in pairs (getComponent) do
       local x, y, z = getVehicleComponentScale(source, k) --get the scale of the component
       setVehicleComponentScale(source, k, x*2, y*2, z*2) -- double the sizes
    end
 end
)
 
addEventHandler("onClientVehicleExit", getRootElement(),
 function(player, seat)
    local getComponent = getVehicleComponents(source) -- returns table with all the components of the vehicle
    for k in pairs (getComponent) do
       resetVehicleComponentScale(source, k) -- resets the scale of the component
    end
 end
)