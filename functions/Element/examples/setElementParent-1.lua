dummyElem = createElement ( "spawngroup", "Group of spawn points" ) -- create a dummy element
local spawnpoints = getElementsByType ( "spawnpoint" ) -- get a table of spawn point elements
for k,v in ipairs (spawnpoints) do -- loop through the table of spawn points
   setElementParent ( v, dummyElem ) -- set the dummy element as the parent of the spawn point
end
-- all of the spawn points are now children of 'dummyElem'