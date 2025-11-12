local light = createLight(1, 2, 3, 4)
addCommandHandler("setcoloroflight",
	function(cmd, r, g, b)
		if r and g and b then
			setLightColor(light, tonumber(r), tonumber(g), tonumber(b))
               end
	end
)