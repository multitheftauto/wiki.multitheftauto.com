addCommandHandler("icv", -- short for 'is component visible'
    function()
        local theVeh = getPedOccupiedVehicle(localPlayer)
	local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
        if (theVeh) then
            for k in pairs (getComponent) do
	        local isVisible = getVehicleComponentVisible(theVeh, k) -- gets if it is visible or not
		if (isVisible == true) then
		    outputChatBox(k.." is visible")
		else
		    outputChatBox(k.." is not visible")
		end   
            end
        end
    end
)