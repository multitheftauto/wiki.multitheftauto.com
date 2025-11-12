local input = "We have nice weather in London"

local replacements = {
    ["weather"] = "food",
    ["London"] = "Germany"
}

local output = utf8.gsub( input, "%w+", replacements )
print( output ) -- We have nice food in Germany