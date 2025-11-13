-- Put the string with the skins in a variable. Normally you would read it from a .map file or something.
local skins = "20,30"
-- Get the startskin and endskin strings ("20" and "30" in this case)
local startskin = gettok ( skins, 1, ',')
local endskin = gettok ( skins, 2, ',' )
-- Get a random skin in the range
local skin = math.random ( tonumber(startskin), tonumber(endskin) )