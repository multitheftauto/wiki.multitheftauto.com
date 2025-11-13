[lua]
function decryptString( cmd, theString, theKey )
    if ( theString ) and ( theKey ) then
        local decodedString = teaDecode( theString, theKey ) -- Decode the string with the key
        outputChatBox( "The decoded string is: " .. tostring( decodedString ) )
    else
        outputChatBox( "Syntax: /" .. cmd .. " [string] [key]" )
    end
end
addCommandHandler( "teadecrypt", decryptString )