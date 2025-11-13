function isHeFlying ( sourcePlayer )
    if isPedOnGround ( sourcePlayer ) then
        outputChatBox ( "No, you're not flying, you're just stoned!", sourcePlayer )
    else
        outputChatBox ( "Is it a bird, is it a plane... No it's " .. getPlayerName ( sourcePlayer ) .. "!", sourcePlayer )
    end
end
addCommandHandler ( "amiflying", isHeFlying )