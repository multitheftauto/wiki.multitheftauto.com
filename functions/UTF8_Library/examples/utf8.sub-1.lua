local input = "Yarın Salı"

local output = utf8.sub(input, 1, 4)
outputConsole(output) -- Yarı

local output = utf8.sub(input, -4)
outputConsole(output) -- Salı

local output = utf8.sub(input, -4, -1)
outputConsole(output) -- Salı
