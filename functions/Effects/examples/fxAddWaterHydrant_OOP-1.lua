function createHydrants()
	local x, y, z = localPlayer:getPosition() -- Get your location.
	for i=0, 20 do -- 20 Hydrants.
		Effect.addWaterHydrant(x + math.random(-5,5), y + math.random(-5,5), z) -- Using math.random, and your current location 20 water hydrants are created.
	end
end
addCommandHandler("hydrantmania", createHydrants)