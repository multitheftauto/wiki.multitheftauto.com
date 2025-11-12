function toggleAirCars()
    setWorldSpecialPropertyEnabled( "aircars", not isWorldSpecialPropertyEnabled("aircars") )
end
addCommandHandler("toggleAirCars", toggleAirCars)