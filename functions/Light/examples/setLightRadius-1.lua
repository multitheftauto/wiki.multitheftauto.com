local light = createLight(0, 2, 3, 4)
addCommandHandler("setradiusoflight",
	function(cmd, radius)
		if radius then
			if tonumber(radius) > 0 then
				setLightRadius(light, tonumber(radius))
			else
				outputChatBox("Radius must be greater than 0.")
			end
		else
			outputChatBox("You must specify a radius.")
		end
	end
)