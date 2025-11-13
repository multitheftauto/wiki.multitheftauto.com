allObjects = getElementsByType ( "object" )
for key, theObject in ipairs ( allObjects ) do
	local origX, origY, origZ = getElementPosition ( theObject ) --get the original position
	local newZ = origZ + 100 -- make a new z position
	moveObject ( theObject, 10000, origX, origY, newZ ) --move the object to this position in 10 seconds.
end