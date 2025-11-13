local a = "Hello"
local b = "World"
local result = utf8.ncasecmp( a, b )

if result == -1 then
    print( "a < b" ) -- printed
elseif result == 0 then
    print( "a == b" )
elseif result == 1 then
    print( "a > b" )
end