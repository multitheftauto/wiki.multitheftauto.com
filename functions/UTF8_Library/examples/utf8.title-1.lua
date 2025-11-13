local output = utf8.upper( "WHAT ARE YOU UP TO? Do you like uppercase?" )
outputConsole( output ) -- WHAT ARE YOU UP TO? DO YOU LIKE UPPERCASE?

local value = utf8.title( 1088 )
outputConsole( value, type( value ) ) -- 1056, number