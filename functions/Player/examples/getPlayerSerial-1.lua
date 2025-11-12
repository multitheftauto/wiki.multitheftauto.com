function checkMySerial( thePlayer, command )
    local theSerial = getPlayerSerial( thePlayer )
    if theSerial then
        outputChatBox( "Your serial is: " .. theSerial, thePlayer )
    else
        outputChatBox( "Sorry, you have no serial. =(", thePlayer )
    end
end
addCommandHandler( "myserial", checkMySerial )