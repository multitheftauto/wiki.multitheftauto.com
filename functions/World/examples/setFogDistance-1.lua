function makeWeatherClear()
    setFogDistance(500) -- Set the fog distance to 500 units, so any weather will appear to be extremely clear
end
addEventHandler("onResourceStart", resourceRoot, makeWeatherClear)