local input = "Happy Now"

local output = utf8.sub(input, 1, 5)
outputChatBox(output) -- Happy

local output = utf8.sub(input, -3)
outputChatBox(output) -- Now

local output = utf8.sub(input, -3, -1)
outputChatBox(output) -- Now
