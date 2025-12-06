local input = "Hello World"
local codepoints = {utf8.byte(input, 1, utf8.len(input))}
local joined = utf8.char(unpack(codepoints))

print(joined) -- Hello World
