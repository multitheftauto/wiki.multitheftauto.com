local input = "Mutli Theft Auto"
local codepoints = {}

-- Extract first 5 characters (read: Mutli)
for index = 1, 5 do
    codepoints[index] = utf8.byte(input, index)
end

local output = ""

-- Join the first 5 characters together
for index = 1, #codepoints do
    output = output .. utf8.char(codepoints[index])
end

outputConsole(output) -- Multi