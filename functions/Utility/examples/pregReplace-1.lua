addCommandHandler('examples',
    function ()
        -- Replace doh with done
        outputDebugString( pregReplace( 'I doh this, guys.', 'doh', 'done' ) or 'not replaced' ) -- Result: I done this, guys

        -- Remove all uppercase alphabetic characters
        outputDebugString( pregReplace( 'AaaBbbZzz', '[A-Z]{1,}', '' ) or 'not replaced' ) -- Result: aabbzz

        -- Use simple backreference in replacement string
        outputDebugString( pregReplace( "I love Lua!", "(Lua)", "Moon\\1" ) ) -- Result: I love MoonLua!

        -- Remove repeated characters
        outputDebugString( pregReplace( "Keeeeeep this shooooooort.", "((.)\\2{2})\\2+", "\\1" ) ) -- Result: Keeep this shooort.
    end
)