-- Keep the first and last character
local input = "яблоко"
local output = utf8.remove( input, 2, -2 ) 
print( output ) -- яо

-- Remove the last character
local input = "Банан"
local output = utf8.remove( input, -1, -1 )
print( output ) -- Бана