function encryptString( cmd, theString, theKey )
    if ( theString ) then
        if ( not theKey ) then
            theKey = string.rep( string.char( math.random( string.byte( "a" ), string.byte( "Z" ) ) ), 10 ) -- Generate a random key of 10 characters if no key was passed in as an argument
        end
        local encodedString = teaEncode( theString, theKey ) -- Encode the string with the key
        outputChatBox( "The encoded string is: " .. tostring( encodedString ) .. " (used key: " .. theKey .. ")" )
    else
        outputChatBox( "Syntax: /" .. cmd .. " [string] <[key]>" )
    end
end
addCommandHandler( "teaencrypt", encryptString )