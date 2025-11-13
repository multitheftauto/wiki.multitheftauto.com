function createHydrants()
	local x, y, z = getElementPosition(localPlayer) -- Get your location.
	for i=0, 20 do -- 20 Hydrants.
		fxAddWaterHydrant(x + math.random(-5,5), y + math.random(-5,5), z) -- Using math.random, and your current location 20 water hydrants are created.
	end
end
addCommandHandler("hydrantmania", createHydrants)