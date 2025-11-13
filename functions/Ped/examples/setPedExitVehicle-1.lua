function exitPedVehicles()
	-- For all streamed-in peds
	for k,ped in ipairs(getElementsByType("ped", root, true)) do
		-- Are we syncing it and is it in a vehicle
		if isElementSyncer(ped) and isPedInVehicle(ped) then
			setPedExitVehicle(ped)
		end
	end
end
addCommandHandler("getout", exitPedVehicles)