local obj = Object(1337, 0, 0, 3) -- create an object
local vehicle = Vehicle(411, 0, 5, 3) -- create a vehicle
obj.parent = vehicle -- set the vehicle as the parent of the object
-- the object is now a child of 'vehicle'