local input = "You are ugly!"

local badwords = {
    ["ugly"] = true
}

local output = utf8.gsub( input, "%w+",
    function (match)
        local lowerCase = utf8.lower( match )
        
        if badwords[ lowerCase ] then
            return string.rep( '*', utf8.len( match ) )
        end
        
        return match
    end
)

outputConsole( output ) -- You are ****!