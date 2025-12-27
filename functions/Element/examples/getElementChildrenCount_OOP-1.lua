local object = Object(1337, 0, 0, 0)
local object2 = Object(1337, 2, 2, 2)
object2.parent = object

local childrens = object.childrenCount
print(childrens) -- 1