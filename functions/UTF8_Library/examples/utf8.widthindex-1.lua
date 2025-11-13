local input = "днём"
local raw_width = utf8.width( input, true )

for location = 1, raw_width do
    print( utf8.widthindex( input, location, true ) )
end