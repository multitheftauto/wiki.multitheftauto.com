vehicle1x, vehicle1y, vehicle1z = getElementPosition ( vehicle1 )
vehicle2x, vehicle2y, vehicle2z = getElementPosition ( vehicle2 )
outputChatBox ( "The map distance between vehicle1 and vehicle2 is ", getDistanceBetweenPoints2D ( vehicle1x, vehicle1y, vehicle2x, vehicle2y ) )