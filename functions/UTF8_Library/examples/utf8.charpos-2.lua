local input = "Привет мир" -- Hello World
local from = utf8.charpos( input, 1 ) -- 1
local to = utf8.charpos( input, 2 ) -- 3

local byteLength = to - from
outputConsole( byteLength ) -- 2

local character = string.sub( input, from, byteLength )
outputConsole( character ) -- П