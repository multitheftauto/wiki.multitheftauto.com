print( utf8.find( "Hello MTA User", "User" ) ) -- 11, 14
print( utf8.find( "Hello MTA User", "e" ) ) -- 2, 2
print( utf8.find( "Hello MTA User", "e", 3 ) ) -- 13, 13
print( utf8.find( "Привет Привет", "%s" ) ) -- 7, 7
print( utf8.find( "Привет Привет", "%s", 1, true ) ) -- nil

-- Comparsion of utf8.find and string.find
local startpos, endpos = utf8.find( "Привет", "и" )
print( startpos, endpos ) -- 3, 3

local startpos, endpos = string.find( "Привет", "и" )
print( startpos, endpos ) -- 5, 6