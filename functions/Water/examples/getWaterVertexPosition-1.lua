function water()
	local water = createWater(1866, -1444, 10, 1968, -1442, 10, 1866, -1372, 10, 1968, -1370, 10); -- create water element
	
	local x, y, z = getWaterVertexPosition(water, 1); -- get first vertex position of our water element
	
	outputChatBox("Water first vertex position X: "..x.." Y: "..y.." Z: "..z);
end