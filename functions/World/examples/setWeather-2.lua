function changeWeather(player, command, weatherID)
	if (not weatherID or not tonumber(weatherID)) then --Check if weatherID is a number
		outputChatBox("You must enter a valid weather ID number", player, 255, 0, 0)
		return false
	end
	
	setWeather(weatherID) --Set the weather and let the player know he did it
	outputChatBox("Weather successfully changed to ID "..weatherID, player, 0, 255, 0)
end
addCommandHandler("weather", changeWeather)