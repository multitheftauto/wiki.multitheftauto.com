function makeGearGui( )
	local sx, sy = guiGetScreenSize()
	local wx = 50
	local wy = 50
	gearLabel = guiCreateLabel(((sx / 2) - wx), (sy - wy), wx, wy, "5", false)
end
makeGearGui()

function onRender()
	g_vehicle = getPedOccupiedVehicle(localPlayer)
	if g_vehicle then
		g_curGear = tostring(getVehicleCurrentGear(g_vehicle))
		guiSetText(gearLabel, g_curGear)
	else
		guiSetText(gearLabel, "")
	end
end
addEventHandler("onClientRender", root, onRender)