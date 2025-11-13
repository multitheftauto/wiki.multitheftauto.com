addCommandHandler( 'examples',
	function( )
                -- find the first occurrence of 'hello world' in a string
		outputDebugString( pregFind( 'hello world, hello world, hello world', 'hello world' ) and 'found' or 'not found' ) -- found 
                -- find the first occurrence of an integer in a string
                outputDebugString( pregFind( '123', '^-{0,1}\\d+$' ) and 'found' or 'not found' ) -- found
                -- check if the input string consists of at least 3 letters from a to z (both uppercase and lowercase) and does not contain any whitespace characters
                outputDebugString( pregFind( 'Kenix', '^[a-zA-Z]{3,}$' ) and 'found' or 'not found' ) -- found
                -- check if the input string matches the format of a role-play name
                outputDebugString( pregFind( 'Garry_Newman', '([A-Z]{1,1})[a-z]{2,9}_([A-Z]{1,1})[a-z]{2,9}' ) and 'found' or 'not found' ) -- found
                -- example of a search for non-ASCII characters (i.e. cyrillic) - привет
                outputDebugString( pregFind( 'Всем привет парни, ещё раз привет :D', 'привет' ) and 'found' or 'not found' ) -- found
                -- example of a search for a specific sequence of numbers
                outputDebugString( pregFind( '5, 10', '^([1-9]{1}[0-9]{0,})+(((,\s|,)[1-9]{1}[0-9]{0,}){0,1}){1,1}' ) and 'found' or 'not found' ) -- found

                
	end
)