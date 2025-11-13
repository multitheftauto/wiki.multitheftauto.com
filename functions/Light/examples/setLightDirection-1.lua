local light = createLight(0, 0, 0, 4)
addCommandHandler("setdirectionoflight",
	function(cmd, x, y, z)
		if x and y and z then
			setLightDirection(light, tonumber(x), tonumber(y), tonumber(z))
		end
	end
)