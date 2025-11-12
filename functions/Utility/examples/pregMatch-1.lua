addCommandHandler( 'example',
	function( )
                --[[
                Will print:
                Match: 1, hello
                Match: 2, hello
                ]] 
                for i, v in ipairs( pregMatch( "hello hello", "(hello)"  ) ) do
	            outputDebugString( "Match: " .. i .. ", " .. v );
                end
	end
);

addCommandHandler( 'example2',
	function( )
                --[[
                Will print:
                Match: 1, somebodyWWw
                Match: 2, 228
                ]] 
                for i, v in ipairs( pregMatch( "somebodyWWw\n228", "([a-z0-9]+)", "im" ) ) do
	            outputDebugString( "Match: " .. i .. ", " .. v );
                end
	end
);