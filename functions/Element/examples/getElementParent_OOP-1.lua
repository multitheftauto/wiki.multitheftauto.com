local object = Object(1337, 0, 0, 0)
local object2 = Object(1337, 0, 0, 0)
object.parent = object2

print(object.parent) -- object2