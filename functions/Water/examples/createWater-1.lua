-- Setting water properties.
height = 40
SizeVal = 2998
-- Defining variables.
southWest_X = -SizeVal
southWest_Y = -SizeVal
southEast_X = SizeVal
southEast_Y = -SizeVal
northWest_X = -SizeVal
northWest_Y = SizeVal
northEast_X = SizeVal
northEast_Y = SizeVal

-- OnClientResourceStart function that creates the water.
function thaResourceStarting( )
    water = createWater ( southWest_X, southWest_Y, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
    setWaterLevel ( height )
end
addEventHandler("onClientResourceStart", resourceRoot, thaResourceStarting)