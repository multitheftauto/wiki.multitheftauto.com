function isElementInsideRadarArea ( theElement, theArea )
	-- get the x, y coordinates from getElementPosition (z gets silently discarded)
	local posX, posY = getElementPosition( theElement )
	-- call isInsideRadarArea with those coordinates and return its result
	return isInsideRadarArea ( theArea, posX, posY )
end