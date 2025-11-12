addEventHandler("onClientResourceStart", resourceRoot, function()
	setRainLevel(math.random(5))
end)

function returnRain()
	local rain = getRainlevel()
	if(rain >= 1) then
		outputChatBox("Looks like it's going to be a rainy day!",255,130,130,false)
	else
		outputChatBox("Surprisingly dry!",255,130,130,false)
	end
end
addCommandHandler("rain", returnRain)