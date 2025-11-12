function initBind()
	bindKey("lshift", "down", jumpKey)
end
addEventHandler("onClientResourceStart", resourceRoot, initBind)

function jumpKey()
	if not isPedInVehicle(localPlayer) then return end

	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle and getVehicleController(vehicle) == localPlayer then
		local vehType = getVehicleType(vehicle)
		if vehType == "Plane" or vehType == "Helicopter" then return end
		local sx, sy, sz = getElementVelocity(vehicle)
		setElementVelocity(vehicle, sx, sy, sz + 0.33) -- The jump effect is achieved by raising the Z axis (height) coordinate
	end
end