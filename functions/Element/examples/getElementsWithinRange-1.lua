function deleteNearbyVehicles(playerElement)
	local playerAccount = getPlayerAccount(playerElement)

	if (not playerAccount) then
		return false
	end

	local guestAccount = isGuestAccount(playerAccount)

	if (guestAccount) then
		return false
	end

	local accountName = getAccountName(playerAccount)
	local aclObject = "user."..accountName
	local adminGroup = aclGetGroup("Admin")
	local playerAdmin = isObjectInACLGroup(aclObject, adminGroup)

	if (not playerAdmin) then
		return false
	end

	local playerX, playerY, playerZ = getElementPosition(playerElement)
	local playerInterior = getElementInterior(playerElement)
	local playerDimension = getElementDimension(playerElement)
	local searchRange = 300
	local nearbyVehicles = getElementsWithinRange(playerX, playerY, playerZ, searchRange, "vehicle", playerInterior, playerDimension)

	for vehicleID = 1, #nearbyVehicles do
		local vehicleElement = nearbyVehicles[vehicleID]
		local validElement = isElement(vehicleElement)

		if (validElement) then
			destroyElement(vehicleElement)
		end
	end
end
addCommandHandler("deletenearbyvehs", deleteNearbyVehicles)