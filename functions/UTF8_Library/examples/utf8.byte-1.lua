local input = "Ницца!"
local codepoints = { utf8.byte( input, 1, utf8.len(input) ) }

for index, codepoint in ipairs( codepoints ) do
    print( "Codepoint @ ".. index .." = ".. codepoint )
end