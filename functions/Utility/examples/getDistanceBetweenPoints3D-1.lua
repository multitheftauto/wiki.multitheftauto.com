-- create the vehicles which we're going to measure distance between of
vehicle1 = createVehicle(445, -2629.79248, 1370.82996, 7.10079)
vehicle2 = createVehicle(560, -2629.71899, 1350.18188, 7.10897)

-- get position of both created vehicles
vehicle1x, vehicle1y, vehicle1z = getElementPosition(vehicle1)
vehicle2x, vehicle2y, vehicle2z = getElementPosition(vehicle2)

-- measure the distance
outputChatBox("The distance between vehicle1 and vehicle2 is " ..tostring(getDistanceBetweenPoints3D(vehicle1x, vehicle1y, vehicle1z, vehicle2x, vehicle2y, vehicle2z)))