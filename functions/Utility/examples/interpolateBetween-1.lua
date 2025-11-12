local g_Marker = nil
addCommandHandler("marker",
function ()
	if g_Marker then return end
	
	local x, y, z = getElementPosition(getLocalPlayer())
	z = z - 1
	
	g_Marker = {}
	g_Marker.startPos = {x, y, z + 5}
	g_Marker.startTime = getTickCount()
	g_Marker.startColor = {255, 0, 0, 0}
	g_Marker.endPos = {x, y, z}
	g_Marker.endTime = g_Marker.startTime + 2000
	g_Marker.endColor = {0, 0, 255, 255}	
	
	local x, y, z = unpack(g_Marker.startPos)
	local r, g, b, a = unpack(g_Marker.startColor)
	g_Marker.marker = createMarker(x, y, z, "cylinder", 1, 255, r, g, b, a)
		
	addEventHandler("onClientRender", getRootElement(), popMarkerUp)
end)

function popMarkerUp()
	local now = getTickCount()
	local elapsedTime = now - g_Marker.startTime
	local duration = g_Marker.endTime - g_Marker.startTime
	local progress = elapsedTime / duration

	local x1, y1, z1 = unpack(g_Marker.startPos)
	local x2, y2, z2 = unpack(g_Marker.endPos)
	local x, y, z = interpolateBetween ( 
		x1, y1, z1,
		x2, y2, z2, 
		progress, "OutBounce")
		
	setElementPosition(g_Marker.marker, x, y, z)
			
	local r1, g1, b1, a1 = unpack(g_Marker.startColor)
	local r2, g2, b2, a2 = unpack(g_Marker.endColor)
	local r, g, b = interpolateBetween ( 
		r1, g1, b1,
		r2, g2, b2, 
		progress, "Linear")
	local a = interpolateBetween ( 
		a1, 0, 0,
		a2, 0, 0,
		progress, "Linear")
		
	setMarkerColor(g_Marker.marker , r, g, b, a)
	
	if now >= g_Marker.endTime then
		removeEventHandler("onClientRender", getRootElement(), popMarkerUp)
		setTimer(
			function ()
				destroyElement(g_Marker.marker)
				g_Marker = nil
			end, 3000, 1)
	end
end