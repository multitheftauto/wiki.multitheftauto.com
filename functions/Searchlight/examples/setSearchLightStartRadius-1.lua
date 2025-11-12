skywalkerLight = createSearchLight (1544, -1353.5, 330, 1528, -1347, 360, 0.2, 3, false)

setTimer (function ()	
	if not off then
		setSearchLightStartRadius (skywalkerLight, 0)
		setSearchLightEndRadius (skywalkerLight, 0)
		off = true
	else
		setSearchLightStartRadius (skywalkerLight, 0.2)
		setSearchLightEndRadius (skywalkerLight, 3)
		off = false
	end
end, 1000, 0)