setTimer( function()
	local zx, zy, zz = -2405.49268, -599.97339, 132.64844 -- Zone position
	local radius = 20 -- Zone radius

	local x, y, z = getElementPosition( localPlayer )
	local dist = getDistanceBetweenPoints3D( x, y, z, zx, zy, zz )
	local intensity = math.max( radius - dist, 0 ) / radius

	setGrainLevel( intensity * 255 )
end, 100, 0 )