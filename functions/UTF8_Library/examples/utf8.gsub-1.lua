local text= "#ff0000This text is red"
local colorless = utf8.gsub( text, "#%x%x%x%x%x%x", "" )
print( colorless ) -- This text is red

print( utf8.gsub( "Nice wiki!", ".", utf8.upper ) ) -- NICE WIKI!