local input = "Happy Now"

local output = utf8.sub( input, 1, 5 )
outputChatBox( output, root, 255,255,255,true ) -- Happy

local output = utf8.sub( input, -3 )
outputChatBox( output, root, 255,255,255,true ) -- Now

local output = utf8.sub( input, -3, -1 )
outputChatBox( output, root, 255,255,255,true ) -- Now