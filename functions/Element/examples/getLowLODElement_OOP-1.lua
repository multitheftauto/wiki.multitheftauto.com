local obj = Object(1488, 0, 0, 3, 0, 0, 90) -- Create object
local lod_obj = Object(1337, 0, 0, 3, 0, 0, 90, true) -- Create LOD object

obj.lowLOD = lod_obj -- Setting LOD, 'attach' to obj

print(obj.lowLOD)
print(obj:getLowLOD())

-- lod_get = lod_obj
