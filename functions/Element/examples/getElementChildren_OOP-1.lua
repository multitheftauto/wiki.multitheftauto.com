local object = Object(1337, 0, 0, 0)
object.id = "Trash 1"

local object2 = Object(1337, 2, 2, 2)
object2.id = "Trash 2"

object2.parent = object

local childs = object:getChildren()
if (childs[1]) then
    print(childs[1].id) -- Trash 2
end