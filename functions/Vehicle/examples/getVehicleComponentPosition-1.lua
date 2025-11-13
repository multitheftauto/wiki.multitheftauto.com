addCommandHandler("vcp", -- short for 'vehicle component position'
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
	local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
        if (theVeh) then
            for k in pairs (getComponent) do
		local x, y, z = getVehicleComponentPosition(theVeh, k)
                outputChatBox("Position of "..k.." is"..x.." "..y.." "..z)
            end
        end
    end
)