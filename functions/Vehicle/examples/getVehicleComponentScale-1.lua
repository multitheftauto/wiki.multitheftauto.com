addCommandHandler("vcs", -- short for 'vehicle component scale'
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
	local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
        if (theVeh) then
            for k in pairs (getComponent) do
		local x, y, z = getVehicleComponentScale(theVeh, k)
                outputChatBox("Scale of "..k.." is"..x.." "..y.." "..z)
            end
        end
    end
)