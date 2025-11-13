local obj = createObject(1488,0,0,3,0,0,90) -- Create object
local lod_obj = createObject(1337,0,0,3,0,0,90,true) -- Create LOD object

setLowLODElement(obj,lod_obj) -- Setting LOD, 'attach' to obj

local lod_get = getLowLODElement(obj) -- Get LOD from obj

--lod_get = lod_obj